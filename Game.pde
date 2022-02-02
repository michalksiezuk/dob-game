Star[] stars;
Starship ship;
Score score;
Intro intro;
GameOver gameOver;
ArrayList<Enemy> enemies;
PFont fontNormal16, fontNormal20, fontBold28, fontBold64;

boolean isIntro = true;
boolean isPlaying = false;
boolean isGameOver = false;

void setup() {
  surface.setTitle("Defender of Bulbatron");

  fontNormal16 = loadFont("LiberationSans-16.vlw");
  fontNormal20 = loadFont("LiberationSans-20.vlw");
  fontBold28 = loadFont("LiberationSans-Bold-28.vlw");
  fontBold64 = loadFont("LiberationSans-Bold-64.vlw");

  noCursor();
  size(480, 720);

  stars = createStars(30);
  ship = new Starship(220, 480);
  enemies = createEnemies(15);
  score = new Score();
  intro = new Intro();
  gameOver = new GameOver();
}

void draw() { 
  background(0);

  for (Star star : stars) star.update();

  if (isIntro) intro.update();

  if (isGameOver) {
    gameOver.update();
    enemies = createEnemies(15);
  }

  if (!isGameOver) ship.update();

  if (isPlaying) {
    for (Enemy enemy : enemies) enemy.update();
    
    score.update();
    updateEnemyList(enemies);
  }
}

void keyPressed() {  
  if (isIntro) {
    if (keyCode == 16) {
      isIntro = false;
      isPlaying = true;
    }

    return;
  }

  if (isGameOver) {
    if (keyCode == 16) {
      isGameOver = false;
      isPlaying = true;
      score.value = 0;

      gameOver.resetAnimation();
    }

    return;
  }

  switch(keyCode) {
  case 16:
    ship.fireProjectile();
    break;
  case 37:
    ship.directions[0] = true;
    ship.directions[2] = false;
    break;
  case 38:
    ship.directions[1] = true;
    ship.directions[3] = false;
    break;
  case 39:
    ship.directions[0] = false;
    ship.directions[2] = true;
    break;
  case 40:
    ship.directions[1] = false;
    ship.directions[3] = true;
    break;
  }
}

void keyReleased() {
  switch(keyCode) {
  case 37:
    ship.directions[0] = false;
    break;
  case 38:
    ship.directions[1] = false;
    break;
  case 39:
    ship.directions[2] = false;
    break;
  case 40:
    ship.directions[3] = false;
    break;
  }
}
