
import beads.*;
import controlP5.*;

AudioContext ac;
ControlP5 cp5;

SamplePlayer player_light;
SamplePlayer player_heavy; 

Slider s; 
Gain g, gDelay;
Panner p;
Glide gainGlide;
TapIn tin; 
TapOut tout;



void setup() {
  size(640, 360);

  ac = new AudioContext();

  light();
  heavy();
}

void draw() {
  background(230, 230, 250);

}
