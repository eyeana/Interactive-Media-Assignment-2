
void light() {
  
  sourceFile = sketchPath("") + "light_rain.wav";
  try {
    player_light = new SamplePlayer(ac, new Sample(sourceFile));
  }
  catch(Exception e) {
    println("Exception while attempting to load sample!");
    e.printStackTrace();
    exit();
  }

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
  
  sourceFile2 = sketchPath("") + "rain.wav";
  try {
    player_heavy = new SamplePlayer(ac, new Sample(sourceFile));
  }
  catch(Exception e) {
    println("Exception while attempting to load sample!");
    e.printStackTrace();
    exit();
  }
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
