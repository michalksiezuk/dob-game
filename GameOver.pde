class GameOver {
  float speed = 5;
  float size = 40;
  float alpha = 255;

  void update() {
    size = constrain(size + speed, size, 600);
    alpha = constrain(alpha - speed + 3, 0, 255);
    noStroke();
    fill(255, alpha);
    circle(ship.xref, ship.yref, size);

    stroke(0);
    fill(255);
    textAlign(CENTER);
    textFont(fontBold64, 64);
    text("GAME OVER", width / 2, 340);    
    textFont(fontNormal20, 20);
    text("Your score: " + score.value, width / 2, 380);
    textFont(fontNormal16, 16);
    text("Press LSHIFT to play again", width / 2, 660);
  }

  void resetAnimation() {    
    speed = 5;
    size = 40;
    alpha = 255;
  }
}
