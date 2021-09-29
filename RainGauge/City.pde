class City {
  float x, y;
  float size1, size2;
  float x2, y2;
  float size3, size4;
  float v1, v2, v3, v4;
  float spacing, spacing2;

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
  }


  void building() {

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
    fill(245, 156, 88);

    //for (float i = y; i < height; i+= spacing) {

    //  for (float j = x; j < size1; j += spacing) {
    //    rect(j+5, i+10, size1/6, size1/6);
    //  }
    //}

    for (float i = y; i < height; i+= spacing) {
      rect(x+5, i+10, size1/6, size1/6);
      rect(x+spacing, i+10, size1/6, size1/6);
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

    //for (float i = y2; i < height; i+= spacing) {
    //  strokeWeight(2);
    //  stroke(69, 76, 150);
    //  fill(245, 156, 88);
    //  rect(x2+spacing2, i+15, size3/8, size4/25);
    //  rect(x2+spacing2*2, i+10, size3/8, size4/30);
    //  rect(x2+spacing2*3, i+10, size3/8, size4/30);
    //}
    noStroke();
  }
}
