class Drop {
  float speed, speedInput;
  float ellipseX, ellipseY, endPos;
  float x = random(width);
  float y = random(-100,0);
  
  void fall() {
    if (mouseX < 90) {
      speed = 5;
    } else if ((mouseX > 90) && (mouseX < 180)){
      speed = 10;
    } else if ((mouseX > 180) && (mouseX < 270)){
      speed = 15;
    } else if ((mouseX > 270) && (mouseX < 360)){
      speed = 20;
    }
    y = y + speed;
    if (y > height) {
      y = random(-100,0);
    }
  }
  
  void show() {
    strokeWeight(2);
    stroke(random(1,200), random(1,200), random(1,200));
    rect(x, y, 2, 15);
  }
}
