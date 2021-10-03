

class Drop {
  float speed, speedInput;
  float ellipseX, ellipseY, endPos;
  float r, x, y;
  float a, b; 
  int angle; 


  Drop() { 
    x = random(width);
    r = 3.5;
    y  = random(-200, 0);
  }

  void fall(float speedpitch) {

    if (speedpitch < 0.75) {
      speed = 5;
    } else if ((speedpitch > 0.75) && (speedpitch < 1.5)) {
      speed = 10;
    } else if ((speedpitch > 1.5) && (speedpitch < 2.25)) {
      speed = 15;
    } else if ((speedpitch > 2.25) && (speedpitch < 3.0)) {
      speed = 20;
    }

    y = y + speed;
  }


  void show(float windSpeed, float direction) {
    
    int directionMultiplier = 0;
    if (direction >= 225 && direction < 315){//wind comming from left
      directionMultiplier = -1;
    }else if (direction >= 45 && direction < 135){//wind comming from right
      directionMultiplier = 1;
    }else{//wind comming from front and back
      directionMultiplier = 0;
    }
    
    int sizeMultiplier = 0;
    if (direction >= 315 && direction < 45){//wind comming from front
      sizeMultiplier = -1;
    }else if (direction >= 135 && direction < 225){//wind comming from behind
      sizeMultiplier = 1;
    }else{//wind comming from left and right
      sizeMultiplier = 0;
    }
    
    
    fill(128, 217, 255);
    noStroke();
    pushMatrix();
    rotate(radians(directionMultiplier*windSpeed));

    for (int i = 2; i < r; i++ ) {
      ellipse(x, y + i*4, i*2, i*3);
    }
    popMatrix();
  }
  
  
  void reset() {
    y  = random(-200, 0);
  }
}
