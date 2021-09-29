//import processing.sound.*;
//import beads.*;
//import java.util.Arrays; 
//import controlP5.*;

//Table table;
//SoundFile rain;
//Sound s;
//AudioContext ac;
//ControlP5 jControl;

//int dataRow = 0;
//float rainDropAmount;
//int rainAmount;
//int defaultRainAmount = 10;
//float volume;
//float speedpitch;
//Glide gl1;
//Glide gl2;
//Gain g;
//Gain g2;
//int i = 0;



//City[] cities = new City[30];
//Drop[] drops = new Drop[2000];

//void setup() {
//  size(640, 360);
//  ac = new AudioContext();
//  light();
//  heavy();
//  slider();


//  table = loadTable("Rain Gauge.csv");
//  for (int i = 0; i<drops.length; i++) {
//    drops[i] = new Drop();
//  }
//  for (int i=0; i < cities.length; i++) {
//    cities[i] = new City();
//  }
//}

//void vol (float value1) {
//  volume = value1;
//}

//void speed (float value2) {
//  speedpitch = value2;
//}
//void slider() {
//  volume = 2;
//  speedpitch = 1;
//  jControl = new ControlP5(this);

//  jControl.addSlider("vol", 0, 2, 100, 10, 10, 200, 30); 
//  jControl.addSlider("speed", 0, 3, 100, 10, 50, 200, 30);
//}

//void draw() {
//  setGradient(0, 0, width, height, b1, b2, X_AXIS);
//  noStroke();
  
// // for (int i=71; i<163; i+=20 ) {
//   // for (int j=160; j<200; i+=10) {
//    //  fill(255, i, 151, 100); 
//     // ellipse(110, 45, j, j);
//    //}
//  //}
    
//    fill(250, 236, 200,220);
//    ellipse(110, 45, 140, 140);//SUN 

//    g.setGain(volume);
//    gl1.setValue(speedpitch);
//    gl2.setValue(speedpitch);
//    dataRow = int(random(1, 104677));
    
//    rainDropAmount = table.getInt(int(dataRow), 1);

//    if (rainDropAmount == 0) {
//      rainAmount = 1;
//    } else if (rainDropAmount == 0.2) {
//      rainAmount = 2;
//    } else if (rainDropAmount == 0.4) {
//      rainAmount = 3;
//    } else if (rainDropAmount == 0.6) {
//      rainAmount = 4;
//    } else if (rainDropAmount == 0.8) {
//      rainAmount = 5;
//    } else if (rainDropAmount == 1.0) {
//      rainAmount = 6;
//    } else if (rainDropAmount == 1.2) {
//      rainAmount = 7;
//    } else if (rainDropAmount == 1.4) {
//      rainAmount = 8;
//    } else if (rainDropAmount == 1.6) {
//      rainAmount = 9;
//    } else if (rainDropAmount == 1.8) {
//      rainAmount = 10;
//    }

//    defaultRainAmount = 4*rainAmount*rainAmount;//30 * rainAmount;
    
//     for (int i=0; i<cities.length; i++) {
//      cities[i].building();
//    }

//    for (int i=10; i<cities.length; i++) {
//      cities[i].display2();
//    }

//    for (int i = 0; i<defaultRainAmount; i++) {
//      drops[i].show();
//      drops[i].fall(speedpitch);
//    }
//  }
