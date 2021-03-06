class City {
  float x, y;
  float size1, size2;
  float x2, y2;
  float size3, size4;
  float v1, v2, v3, v4;
  float spacing, spacing2;
  float lightingData;
  float opacity;
  color light; 


  City() {  
    x = random(-50, width);
    y = random(100, 300);
    size1 = random(30, 60);
    size2 = width;

    spacing = random(20, 25);
    spacing2 = random(18, 23); 

    x2 = random(-50, width);
    y2 = random (250, 400);
    size3 = random(75, 125);
    size4 = height;
    opacity = 255;
    light = color(255, 227, 84);
  }


  void building(String lighting, int timer) {

    lightingData = float(lighting);

    noStroke();
    fill(61, 36, 130);
    rect(x, y, size1, size2);//building 

    fill(61, 36, 130, 50);
    rect(x, y+15, size1+40, size2);//shadow


    fill(245, 171, 110);
    rect(x+size1/150, y+1, size1/70, size2-2);//side light
    rect(x+1, y, size1-2, size2/1100);//top light

    stroke(69, 76, 150);
    strokeWeight(2);

    fill(35, 34, 89);
    for (float i = y; i < height; i+= spacing) {
      rect(x+5, i+10, size1/6, size1/6);
      rect(x+spacing, i+5, size1/6, size1/6);
    }

    float endOpacity = 0.0;

    if ((lightingData>=0) && (lightingData<0.5)) {
      endOpacity = 63.0;
    } else if ((lightingData>=0.51) && (lightingData<1.0)) {
      endOpacity = 127.0;
    } else if ((lightingData>=1.01) && (lightingData<1.5)) {
      endOpacity = 191.0;
    } else if ((lightingData>=1.51) && (lightingData<2.0)) {
      endOpacity = 210.0;
    } else if ((lightingData>=2.01)) {
      endOpacity = 255.0;
    }
    opacity = lerp(opacity, endOpacity, timer/60.0);
    fill(light, opacity);

    for (float i = y; i < height; i+= spacing) {
      rect(x+5, i+10, size1/6, size1/6);
      rect(x+spacing, i+5, size1/6, size1/6);
    }
  }

  void display2() {
    noStroke();
    fill(5, 237, 233, 15);
    rect(x2, y2-15, size3+40, size4);//shadow

    fill(55, 42, 89);
    rect(x2, y2, size3, size4);

    fill(173, 92, 5);
    rect(x2+2, y2+1, size3/200, size4-2);//side light
    rect(x2+3, y2+1, size3-5, size4/400);//top light

    noStroke();
  }
}
