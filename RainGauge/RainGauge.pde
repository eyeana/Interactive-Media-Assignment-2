
import beads.*;
import java.util.Arrays; 
import controlP5.*;

//Changeable Parameters
int rainMultiplier = 4; //amount of visualised raindrops 
int startingDay = 0;//date visualisation starts on ie. 0 = 1/01/20 (valid numbers 0-364)
float maxVolume = 2.0; //controls max volume 
float maxSpeed = 2.0; //controls max visualisation speed
int cityNumber = 30; //controls number of city buildings

//DO WE WANT TO MAKE SPEED REVERSABLE

Table table;

String sourceFile;
SamplePlayer player_light;
String sourceFile2; 
SamplePlayer player_heavy;

AudioContext ac;
ControlP5 jControl;

float rainDropAmount;
int rainAmount;
int defaultRainAmount;

float volume;
float speedpitch;

int timer = 0;
City[] cities = new City[cityNumber];
Drop[] drops = new Drop[rainMultiplier*10*10];

String[][] rainData;
String[][] windDirection;
String[][] windSpeed;
String[][] lighting;

int rainCount = startingDay;
int directionCount = startingDay;
int speedCount = startingDay;
int lightingCount = startingDay;

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
  volume = maxVolume; 
  speedpitch = maxSpeed;
  jControl = new ControlP5(this);
  jControl.addSlider("vol", 0, maxVolume, 100, 10, 10, 200, 30); 
  jControl.addSlider("speed", 0.05, maxSpeed, 100, 10, 50, 200, 30);
}

void draw() {
  setGradient(0, 0, width, height, b1, b2, X_AXIS);
  noStroke();

  fill(250, 236, 200, 220);
  ellipse(110, 45, 140, 140);//SUN 

  gainValLight.setValue(speedpitch);//set glide
  gainValHeavy.setValue(speedpitch);//

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

  defaultRainAmount = rainMultiplier*rainAmount*rainAmount;//30 * rainAmount;

  for (int i=0; i<cities.length; i++) {
    cities[i].building(lighting[lightingCount][1], timer);
  }
  for (int i=10; i<cities.length; i++) {
    cities[i].display2();
  }
  for (int i = 0; i<defaultRainAmount; i++) {
    drops[i].show(parseInt(windSpeed[speedCount][1]),parseInt(windDirection[directionCount][1]));
    drops[i].fall(speedpitch);
  }

  textSize(20);
  text("Date: "+rainData[rainCount][0], 450, 20);//Display current date from the data  

  float maxTime = 60/speedpitch*2;
  if (maxTime > 120.0){
    maxTime = 120;
  }
  if (timer >= maxTime)
  {
    rainCount++;
    speedCount++;
    directionCount++;
    lightingCount++;
    timer = 0;
    println(rainDropAmount);
    for (int i = 0; i<defaultRainAmount; i++) {
      drops[i].reset();
    }
  } else {
    timer++;

    if (float(rainData[rainCount][1])<=-0.1) {
      g_light.setGain(0);
    } else
      g_light.setGain(volume*(1+(rainAmount/10)));

    if (float(rainData[rainCount][1])<=0.9) {// if data value <= 1.0 set g2 gain to 0, else set g2 gain to volume variable
      g_heavy.setGain(0);
    } else
      g_heavy.setGain(volume*(1+(rainAmount/10)));
    ac.start();
  }
  if (rainData[rainCount][0]==null) {
    rainCount = 0;
  }
  if (windDirection[directionCount][0]==null) {
    directionCount = 0;
  }
  if (windSpeed[speedCount][0]==null) {
    speedCount = 0;
  }
  if (lighting[lightingCount][0]==null) {
    lightingCount = 0;
  }
}
