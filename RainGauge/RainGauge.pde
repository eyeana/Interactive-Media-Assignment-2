import beads.*;
import java.util.Arrays; 
import controlP5.*;

AudioContext ac;
ControlP5 jControl; 

String[][] rainData;

float rainDropAmount;
float volume;
float speedpitch;
Glide gl1;
Glide gl2;
Gain g;
Gain g2;
int i = 0;
int timer = 0;
int rainAmount;
int defaultRainAmount = 10;

Drop[] drops = new Drop[10];
City[] cities = new City[10];

void setup() {
  size(400,400);
  frameRate(60);
  ac = new AudioContext();
  light();
  heavy();
  slider();
  Data rainGaugeData = new Data("RainGauge.csv");
  rainData = rainGaugeData.getData();
  for (int i = 0; i<drops.length; i++) {
    drops[i] = new Drop();
  }
  for (int i=0; i < cities.length; i++) {
    cities[i] = new City();
  }
}

void vol (float value1){
  volume = value1;
}

void speed (float value2){
  speedpitch = value2;
}

void slider() {
  volume = 2;
  speedpitch = 1;
  jControl = new ControlP5(this);
  
  jControl.addSlider("vol", 0, 2, 100, 10, 10, 200, 30); 
  jControl.addSlider("speed", 0, 3, 100, 10, 50, 200, 30);  
  
}

void draw() { 
  background(230, 230,250);
  ellipse(width/3,45,50,50);
  textSize(20);
  text("Date: "+rainData[i][0], 30, 100);
  g.setGain(volume);
  gl1.setValue(speedpitch);
  gl2.setValue(speedpitch);
  rainDropAmount = float(rainData[i][1]);
  if (rainDropAmount == 0) {
    rainAmount = 1;
  } else if (rainDropAmount == 0.2){
    rainAmount = 2;
  } else if (rainDropAmount == 0.4){
    rainAmount = 3;
  } else if (rainDropAmount == 0.6){
    rainAmount = 4;
  } else if (rainDropAmount == 0.8){
    rainAmount = 5;
  } else if (rainDropAmount == 1.0){
    rainAmount = 6;
  } else if (rainDropAmount == 1.2){
    rainAmount = 7;
  } else if (rainDropAmount == 1.4){
    rainAmount = 8;
  } else if (rainDropAmount == 1.6){
    rainAmount = 9;
  } else if (rainDropAmount == 1.8){
    rainAmount = 10;
  }
  
  defaultRainAmount = 2 * rainAmount;
  
  for (int i = 0; i<defaultRainAmount; i++) {
    drops[i].show();
    drops[i].fall(speedpitch);
  }
  
  for (int i=0; i<cities.length; i++) {
    cities[i].display();
  }
  if(timer == 60)
  {
    i++;
    timer = 0;
    //println(rainDropAmount);
  }
  else{
    timer++;
    if (rainData[i][0]==null){
      i = 0;
    }
    else if(float(rainData[i][1])<=1.0){// if data value <= 1.0 set g2 gain to 0, else set g2 gain to volume variable
      g2.setGain(0);
    }
    else
      g2.setGain(volume);
  }
}
