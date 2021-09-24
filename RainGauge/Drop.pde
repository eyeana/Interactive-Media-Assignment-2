class Drop {
  float speed, speedInput;
  float ellipseX, ellipseY, endPos;
  float x = random(width);
  float y = random(-100,0);
  
  void fall() {
    if (mouseX < width*0.25) {
      speed = 5;
    } else if ((mouseX > width*0.25) && (mouseX < width*0.5)){
      speed = 10;
    } else if ((mouseX > width*0.5) && (mouseX < width*0.75)){
      speed = 15;
    } else if ((mouseX > width*0.75) && (mouseX < width*1)){
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
