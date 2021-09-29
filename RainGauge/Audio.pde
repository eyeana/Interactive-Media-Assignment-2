
void light() {

  String light_rain = "/Users/emmalum/Documents/GitHub/Interactive-Media-Assignment-2/github/RainGauge/light_rain.wav";
  SamplePlayer player_light = new SamplePlayer(ac, SampleManager.sample(light_rain));
  player_light.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);

  Panner p = new Panner(ac, 0); 
  gl1 = new Glide(ac, 1, 10);
  player_light.setRate(gl1);
  g = new Gain(ac, 2, 0.2);

  p.addInput(player_light);
  g.addInput(p);
  ac.out.addInput(g);
  ac.start();
}

void heavy() {

  String heavy_rain = "/Users/emmalum/Documents/GitHub/Interactive-Media-Assignment-2/github/RainGauge/rain.wav";
  SamplePlayer player_heavy = new SamplePlayer(ac, SampleManager.sample(heavy_rain));
  player_heavy.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);

  Panner p = new Panner(ac, 0); 
  gl2 = new Glide(ac, 1, 10);
  player_heavy.setRate(gl2);
  g2 = new Gain(ac, 2, 0.2);

  p.addInput(player_heavy);
  g2.addInput(p);
  ac.out.addInput(g2);
  ac.start();
}
