class Drop {
  float speed, speedInput;
  float ellipseX, ellipseY, endPos;
  float x = random(width);
  float y = random(-100,0);
  
  void fall(float speedpitch) {
    if (speedpitch < 0.75) {
      speed = 5;
    } else if ((speedpitch > 0.75) && (speedpitch < 1.5)){
      speed = 10;
    } else if ((speedpitch > 1.5) && (speedpitch < 2.25)){
      speed = 15;
    } else if ((speedpitch > 2.25) && (speedpitch < 3.0)){
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
