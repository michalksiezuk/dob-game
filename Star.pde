class Star {
  float xpos, ypos, speed, size, alpha; 

  Star(float x, float y, float sp, float sz, float a) {  
    xpos = x;
    ypos = y; 
    speed = sp;
    size = sz;
    alpha = a;
  } 

  void update() { 
    ypos += speed; 

    if (ypos > height) ypos = 0;

    noStroke();
    fill(255, alpha);
    circle(xpos, ypos, size);
  }
}

Star[] createStars(int count) {
  Star[] stars = new Star[count];

  for (int i = 0; i < count; i++) {
    stars[i] = new Star(
      random(10, width - 10), 
      random(10, height - 10), 
      random(1, 3), 
      random(1, 5), 
      random(125, 255));
  }

  return stars;
}
