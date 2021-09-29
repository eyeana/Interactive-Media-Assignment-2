import processing.sound.*;

SoundFile rain;
Sound s;

Drop[] drops = new Drop[100];
String[][] rainData;
int i = 0;

void setup() {
  size(640, 360);
  rain = new SoundFile(this, "../531947__straget__the-rain-falls-against-the-parasol.wav");
  s = new Sound(this);
  for (int i = 0; i<drops.length; i++) {
    drops[i] = new Drop();
  }
  
  Data rainGaugeData = new Data("RainGauge.csv");
  rainData = rainGaugeData.getData();
  
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
  
  System.out.println(rainData[i][0]);
  System.out.println(rainData[i][1]);
  i++;
  if (rainData[i][0]==null){
    i = 0;
  }
}
