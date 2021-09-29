import processing.sound.*;

SoundFile rain;
Sound s;

Drop[] drops = new Drop[100];
String[][] rainData;
String[][] windDirection;
String[][] windSpeed;
int rainCount = 0;
int directionCount = 0;
int speedCount = 0;

void setup() {
  size(640, 360);
  rain = new SoundFile(this, "../531947__straget__the-rain-falls-against-the-parasol.wav");
  s = new Sound(this);
  for (int i = 0; i<drops.length; i++) {
    drops[i] = new Drop();
  }
  
  Data rainGaugeData = new Data("RainGauge.csv", "all");
  rainData = rainGaugeData.getData();
  Data windDirectionData = new Data("WindDirection.csv", "avg");
  windDirection = windDirectionData.getData();
  Data windSpeedData = new Data("PeakWindGust.csv", "avg");
  windSpeed = windSpeedData.getData();
  
}

void draw(){
  background(230, 230,250);
  if(!rain.isPlaying()){
    rain.play();
  }
  if (mouseX < 90) {
      s.volume(0.2);
    } else if ((mouseX > 90) && (mouseX < 180)){
      s.volume(0.3);
    } else if ((mouseX > 180) && (mouseX < 270)){
      s.volume(0.4);
    } else if ((mouseX > 270) && (mouseX < 360)){
      s.volume(0.5);
    }
  for (int i = 0; i<drops.length; i++) {
    drops[i].show();
    drops[i].fall();
  }
  
  //System.out.println("Rain data:      "+rainData[rainCount][0]+" "+rainData[rainCount][1]);
  //System.out.println("Direction data: "+windDirection[directionCount][0]+" "+windDirection[directionCount][1]);
  //System.out.println("Speed data:     "+windSpeed[speedCount][0]+" "+windSpeed[speedCount][1]);
  rainCount++;
  if (rainData[rainCount][0]==null){
    rainCount = 0;
  }
  directionCount++;
  if (windDirection[directionCount][0]==null){
    directionCount = 0;
  }
  speedCount++;
  if (windSpeed[speedCount][0]==null){
    speedCount = 0;
  }
}
