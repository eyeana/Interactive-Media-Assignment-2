class City{
 float x;
 float y;
 float size1;
 float size2;
 float x2;
 float y2;
 float size3;
 float size4;
  
  City(){
    x = random(-50, width);
    y = random(100, 400);
    size1 = random(50, 100);
    size2 = height;
    x2 = random(-50, width);
    y2 = random (350, 400);
    size3 = random(75, 125);
    size4 = height;
    
  }
  void display(){
  noStroke();
  fill(107, 73, 132,40);
  //fill(255, 75, 100);
  rect(x, y, size1, size2);
  rect(x2, y2, size3, size4);
  }
  
}
