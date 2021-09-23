import processing.sound.*;

Table table;
SoundFile rain;
Sound s;
int dataRow = 0;
float rainDropAmount;
int rainAmount;

Drop[] drops = new Drop[100];

void setup() {
  size(640, 360);
  table = loadTable("Rain Gauge.csv");
  rain = new SoundFile(this, "../531947__straget__the-rain-falls-against-the-parasol.wav");
  s = new Sound(this);
  for (int i = 0; i<drops.length; i++) {
    drops[i] = new Drop();
  }
 
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
    

  dataRow = int(random(1,104677));
  rainDropAmount = table.getInt(int(dataRow),1);
  if (rainDropAmount == 0) {
    rainAmount = 10;
  } else if (rainDropAmount == 0.2){
    rainAmount = 20;
  } else if (rainDropAmount == 0.4){
    rainAmount = 30;
  } else if (rainDropAmount == 0.6){
    rainAmount = 40;
  } else if (rainDropAmount == 0.8){
    rainAmount = 50;
  } else if (rainDropAmount == 1.0){
    rainAmount = 60;
  } else if (rainDropAmount == 1.2){
    rainAmount = 70;
  } else if (rainDropAmount == 1.4){
    rainAmount = 80;
  } else if (rainDropAmount == 1.6){
    rainAmount = 90;
  } else if (rainDropAmount == 1.8){
    rainAmount = 100;
  }
  for (int i = 0; i<rainAmount; i++) {
    drops[i].show();
    drops[i].fall();
  }
  
}
