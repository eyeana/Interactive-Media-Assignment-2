
Glide  gainValLight;
Glide gainValHeavy;

Glide gl_light;
Glide gl_heavy;

Gain g_light;
Gain g_heavy;

Reverb r_light;
Reverb r_heavy;

OnePoleFilter filter_heavy; 


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
  player_light.setKillOnEnd(false); 
  player_light.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);

  gl_light = new Glide(ac, 1, 10); //intialize glide
  player_light.setRate(gl_light);//connnect glide to sample


  gainValLight = new Glide(ac, 1, 30); //create gain for control of vol
  g_light = new Gain(ac, 2, gainValLight);
  g_light.addInput(player_light);

  r_light = new Reverb(ac, 1);
  r_light.setSize(0.8);
  r_light.setDamping(0.7);
  r_light.setEarlyReflectionsLevel(0.7);
  r_light.addInput(g_light);
  ac.out.addInput(r_light);

  ac.out.addInput(g_light); //connect gain to ac 

  // p.addInput(player_light);
  // g1.addInput(p);

  player_light.start(); 
  //ac.start();
}

void heavy() {

  sourceFile2 = sketchPath("") + "rain.wav";
  try {
    player_heavy = new SamplePlayer(ac, new Sample(sourceFile2));
  }
  catch(Exception e) {
    println("Exception while attempting to load sample!");
    e.printStackTrace();
    exit();
  }
  player_heavy.setKillOnEnd(false);

  player_heavy.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);

  //Panner p = new Panner(ac, 0); 
  gl_heavy = new Glide(ac, 1, 10);
  player_heavy.setRate(gl_heavy);

  gainValHeavy = new Glide(ac, 0, 10);
  g_heavy = new Gain(ac, 1, gainValHeavy);
  g_heavy.addInput(player_heavy);

  //p.addInput(player_heavy);
  //g2.addInput(p);

  r_heavy = new Reverb(ac, 1);
  r_heavy.setSize(0.5);
  r_heavy.setDamping(0.7);
  r_heavy.setEarlyReflectionsLevel(0.7);
  r_heavy.addInput(g_heavy);

  filter_heavy = new OnePoleFilter(ac, 200.0); //cut off freq 200Hz
  filter_heavy.addInput(player_heavy);
  g_heavy.addInput(filter_heavy); 

  ac.out.addInput(r_heavy);


  ac.out.addInput(g_heavy);
  player_heavy.start(); 
  ac.start();
}
