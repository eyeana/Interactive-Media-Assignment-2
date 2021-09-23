
void light() {

  String light_rain = "light_rain.wav";
  player_light = new SamplePlayer(ac, SampleManager.sample(light_rain));

  //gainGlide = new Glide(ac, 0.0, 50);
  //g = new Gain(ac, 1, gainGlide); 

  Gain g = new Gain(ac, 2, 0.5); 

  //Envelope rateEnvelope = new Envelope(ac, 2);//playback rate 
  //rateEnvelope.addSegment(1, 5000);
  //rateEnvelope.addSegment(0, 4000);
  //player_light.setRate(rateEnvelope);

  tin = new TapIn (ac, 900); 
  tout = new TapOut(ac, tin, 800); 

  gDelay = new Gain(ac, 8, 1);
  gDelay.addInput(tout); 
  tin.addInput(gDelay); 
  tin.addInput(player_light); 

  p = new Panner(ac, 0);

  p.addInput(player_light);
  p.addInput(tout);
  g.addInput(p);
  ac.out.addInput(g);
  ac.start();
}

void heavy() {

  String heavy_rain = "rain.wav";
  player_heavy = new SamplePlayer(ac, SampleManager.sample(heavy_rain));


//  gainGlide = new Glide(ac, 0.0, 50);
//  g = new Gain(ac, 1, gainGlide); 

  tin = new TapIn (ac, 900); 
  tout = new TapOut(ac, tin, 800); 

  gDelay = new Gain(ac, 8, 1);
  gDelay.addInput(tout); 
  tin.addInput(gDelay); 
  tin.addInput(player_light); 

  p = new Panner(ac, 0);

  p.addInput(player_heavy);
  p.addInput(tout);
  g.addInput(p);
  ac.out.addInput(g);
  ac.start();

  //start when the data or slider reach a certain number
}
