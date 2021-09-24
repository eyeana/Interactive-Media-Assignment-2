import processing.sound.*;

Table table;
SoundFile rain;
Sound s;
int dataRow = 0;
float rainDropAmount;
int rainAmount;
int defaultRainAmount = 10;

Drop[] drops = new Drop[100];
City[] cities = new City[10];

void setup() {
  size(640, 360);
  table = loadTable("Rain Gauge.csv");
  rain = new SoundFile(this, "../531947__straget__the-rain-falls-against-the-parasol.wav");
  s = new Sound(this);
  for (int i = 0; i<drops.length; i++) {
    drops[i] = new Drop();
  }
  for (int i=0; i < cities.length; i++) {
    cities[i] = new City();
  }
}

void draw(){
  background(230, 230,250);
  ellipse(width/3,45,50,50);
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

  dataRow = int(random(1,104677));
  rainDropAmount = table.getInt(int(dataRow),1);

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
  
  defaultRainAmount = 10 * rainAmount;
  
  for (int i = 0; i<defaultRainAmount; i++) {
    drops[i].show();
    drops[i].fall();
  }
  
  for (int i=0; i<cities.length; i++) {
    cities[i].display();
  }
  
}
