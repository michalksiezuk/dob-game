class Projectile {
  float speed = 15;
  float xpos, ypos;
  
  boolean isColliding = false;

  Projectile(float x, float y) {
    xpos = x;
    ypos = y;
  }

  void update() { 
    ypos -= speed; 

    noStroke();
    fill(255);
    rect(xpos - 1, ypos, 2, 20);

    checkCollisions();
  }

  void checkCollisions() {
    for (Enemy enemy : enemies) {
      float[] hitbox = enemy.getHitBox();

      if (
        xpos > hitbox[0] &&
        xpos < hitbox[0]+hitbox[2] &&
        ypos > hitbox[1] &&
        ypos < hitbox[1]+hitbox[2]
        ) {
        isColliding = true;
        enemy.isDestroyed = true;
        score.value++;
      }
    }
  }
}
