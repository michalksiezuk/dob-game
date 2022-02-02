class Score {
  int value = 0;
  
  void update() {
    stroke(255);
    fill(0);
    rect(width - 120, 10, 100, 30, 5);
    
    stroke(0);
    fill(255);
    textFont(fontNormal20, 18);
    textAlign(RIGHT);
    text(value, width - 25, 32);
  }
}
