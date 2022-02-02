class Enemy {
  float xpos, ypos, speed, shade, size;
  
  boolean isDestroyed = false;

  Enemy(float x, float y, float sp, float sh, float sz) {
    xpos = x;
    ypos = y;
    speed = sp;
    shade = sh;
    size = sz;
  }

  void update() {
    ypos += speed;

    noStroke();

    fill(shade);
    ellipseMode(CORNER);
    circle(xpos, ypos, size);
  }

  float[] getHitBox() {    
    float[] props = {xpos, ypos, size};

    return props;
  }
}

Enemy createEnemy() {
  float xpos = random(10, width - 60);
  float ypos = random(100, 2 * height) * -1;
  float speed = random(1, 2.5);
  float shade = random(175, 255);
  float size = random(30, 60);

  return new Enemy(xpos, ypos, speed, shade, size);
}

ArrayList<Enemy> createEnemies(int count) {
  ArrayList<Enemy> enemies = new ArrayList<Enemy>();

  for (int i = 0; i < count; i++) enemies.add(createEnemy());

  return enemies;
}

void updateEnemyList(ArrayList<Enemy> enemyList) {
  for (int i = enemyList.size() - 1; i >= 0; i--) {
    Enemy e = enemyList.get(i);
    if (e.ypos > height || e.isDestroyed) {
      enemyList.remove(i);
      enemyList.add(createEnemy());
    }
  }
}
