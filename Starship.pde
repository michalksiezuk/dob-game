class Starship {
  float xpos, ypos, xref, yref;
  float shipWidth = 40;
  float shipHeight = 35;
  float speed = 5;

  ArrayList<Projectile> projectiles = new ArrayList<Projectile>();

  boolean[] directions = {
    false, // LEFT
    false, // UP
    false, // RIGHT
    false  // DOWN
  };

  Starship(float x, float y) {
    xpos = x;
    ypos = y;
  }

  void update() {   
    updateStarship();
    updateProjectiles();
    checkCollisions();
  }

  void updateStarship() {
    if (directions[0]) xpos -= speed;
    if (directions[1]) ypos -= speed;
    if (directions[2]) xpos += speed;
    if (directions[3]) ypos += speed;

    xpos = constrain(xpos, 10, width - 10 - shipWidth);
    ypos = constrain(ypos, 10 + (shipHeight * 2), height - 10 - shipHeight);
    xref = xpos + (shipWidth / 2);
    yref = ypos + (shipHeight / 2) - 5;

    noStroke();
    fill(255);
    triangle(xref, ypos + 15, xref - 20, ypos + 32, xref + 20, ypos + 32); // wings
    triangle(xref, ypos + 25, xref - 5, ypos + 35, xref + 5, ypos + 35); // tail
    triangle(xref, ypos, xref - 12, ypos + 30, xref + 12, ypos + 30); // body

    fill(175);
    ellipseMode(CENTER);
    ellipse(xref, ypos + 17, 7, 12); // visor
  }

  void updateProjectiles() {
    for (Projectile p : projectiles) p.update();

    for (int i = projectiles.size() - 1; i >= 0; i--) {
      Projectile p = projectiles.get(i);

      if (p.ypos < 0 || p.isColliding) projectiles.remove(i);
    }
  }

  void fireProjectile() {
    projectiles.add(new Projectile(xref, ypos));
  }

  void checkCollisions() {
    for (Enemy enemy : enemies) {
      float[] hitbox = enemy.getHitBox();

      if (
        xref > hitbox[0] &&
        xref < hitbox[0]+hitbox[2] &&
        yref > hitbox[1] &&
        yref < hitbox[1]+hitbox[2]
        ) {
        isGameOver = true;
        isPlaying = false;
        xpos = 220;
        ypos = 480;
      }
    }
  }
}
