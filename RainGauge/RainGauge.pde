import processing.sound.*;
import beads.*;
import java.util.Arrays; 
import controlP5.*;

Table table;
SoundFile rain;

String sourceFile;
SamplePlayer player_light;
String sourceFile2; 
SamplePlayer player_heavy;

Sound s;
AudioContext ac;
ControlP5 jControl;

int dataRow = 0;
float rainDropAmount;
int rainAmount;
int defaultRainAmount = 10;
float volume;
float speedpitch;
Glide gl1;
Glide gl2;
Gain g;
Gain g2;
//int i = 0;
int timer = 0;

City[] cities = new City[30];
Drop[] drops = new Drop[2000];

String[][] rainData;
String[][] windDirection;
String[][] windSpeed;
String[][] lighting;
int rainCount = 0;
int directionCount = 0;
int speedCount = 0;
int lightingCount = 0;

void setup() {
  frameRate(60);
  size(640, 360);
  ac = new AudioContext();
  light();
  heavy();
  slider();

  for (int i = 0; i<drops.length; i++) {
    drops[i] = new Drop();
  }
  for (int i=0; i < cities.length; i++) {
    cities[i] = new City();
  }
  
  Data rainGaugeData = new Data("RainGauge.csv", "max");
  rainData = rainGaugeData.getData();
  Data windDirectionData = new Data("WindDirection.csv", "avg");
  windDirection = windDirectionData.getData();
  Data windSpeedData = new Data("PeakWindGust.csv", "avg");
  windSpeed = windSpeedData.getData();
  Data lightingData = new Data("CB02.01-DB-01-EM-01 Lighting - LIGHTING.csv", "avg");
  lighting = lightingData.getData();
}

void vol (float value1) {
  volume = value1;
}

void speed (float value2) {
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
  setGradient(0, 0, width, height, b1, b2, X_AXIS);
  noStroke();
  
    fill(250, 236, 200,220);
    ellipse(110, 45, 140, 140);//SUN 

    g.setGain(volume);
    gl1.setValue(speedpitch);
    gl2.setValue(speedpitch);
    
    rainDropAmount = Float.parseFloat(rainData[rainCount][1]);

    if (rainDropAmount == 0) {
      rainAmount = 1;
    } else if (rainDropAmount == 0.2) {
      rainAmount = 2;
    } else if (rainDropAmount == 0.4) {
      rainAmount = 3;
    } else if (rainDropAmount == 0.6) {
      rainAmount = 4;
    } else if (rainDropAmount == 0.8) {
      rainAmount = 5;
    } else if (rainDropAmount == 1.0) {
      rainAmount = 6;
    } else if (rainDropAmount == 1.2) {
      rainAmount = 7;
    } else if (rainDropAmount == 1.4) {
      rainAmount = 8;
    } else if (rainDropAmount == 1.6) {
      rainAmount = 9;
    } else if (rainDropAmount == 1.8) {
      rainAmount = 10;
    }

    defaultRainAmount = 4*rainAmount*rainAmount;//30 * rainAmount;
    
     for (int i=0; i<cities.length; i++) {
      cities[i].building(lighting[lightingCount][1]);
     }

    for (int i=10; i<cities.length; i++) {
      cities[i].display2();
    }
    for (int i = 0; i<defaultRainAmount; i++) {
      drops[i].show();
      drops[i].fall(speedpitch);
    }
  textSize(20);
  text("Date: "+rainData[rainCount][0], 450, 20);  
  //System.out.println("Rain data:      "+rainData[rainCount][0]+" "+rainData[rainCount][1]);
  //System.out.println("Direction data: "+windDirection[directionCount][0]+" "+windDirection[directionCount][1]);
  //System.out.println("Speed data:     "+windSpeed[speedCount][0]+" "+windSpeed[speedCount][1]);
<<<<<<< HEAD
  System.out.println("Lighting data:  "+lighting[lightingCount][0]+" "+lighting[lightingCount][1]);
  rainCount++;
=======
  //System.out.println("Lighting data:  "+lighting[lightingCount][0]+" "+lighting[lightingCount][1]);
>>>>>>> d125fb36566ceb775ce2f4e1e248f77dbb281e60
  if (rainData[rainCount][0]==null){
    rainCount = 0;
  }
  if (windDirection[directionCount][0]==null){
    directionCount = 0;
  }
  if (windSpeed[speedCount][0]==null){
    speedCount = 0;
  }
<<<<<<< HEAD
  lightingCount++;
  if (lighting[speedCount][0]==null){
    lightingCount = 0;
  }
=======
  if (lighting[lightingCount][0]==null){
    lightingCount = 0;
  }
  if(timer == 60)
  {
    rainCount++;
    speedCount++;
    directionCount++;
    lightingCount++;
    timer = 0;
    //println(rainDropAmount);
    for (int i = 0; i<defaultRainAmount; i++) {
      drops[i].reset();
    }
  }
  else{
    timer++;
    if(float(rainData[rainCount][1])<=1.0){// if data value <= 1.0 set g2 gain to 0, else set g2 gain to volume variable
      g2.setGain(0);
    }
    else
      g2.setGain(volume);
  }
>>>>>>> d125fb36566ceb775ce2f4e1e248f77dbb281e60
}
