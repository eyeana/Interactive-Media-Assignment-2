Glide gainValDrop;
Glide  gainValLight;
Glide gainValHeavy;

Glide gl_drop;
Glide gl_light;//gl1
Glide gl_heavy;//gl2

Gain g_drop;
Gain g_light;
Gain g_heavy;

Reverb r_drop;
Reverb r_heavy;

OnePoleFilter filter_heavy; 


void rainDropSound() {

  sourceFile3 = sketchPath("") + "drop.mov";
  try {
    player_rainDropSound = new SamplePlayer(ac, new Sample(sourceFile3));
  }
  catch(Exception e) {
    println("Exception while attempting to load sample!");
    e.printStackTrace();
    exit();
  }

  player_rainDropSound.setKillOnEnd(false); 

  gl_drop = new Glide(ac, 1, 30);
  player_rainDropSound.setRate(gl_drop); 

  gainValDrop = new Glide(ac, 1, 10);
  g_drop = new Gain(ac, 2, gainValDrop);
  g_drop.addInput(player_rainDropSound);

  r_drop = new Reverb(ac, 1);
  r_drop.setSize(0.5);
  r_drop.setDamping(0.7);
  r_drop.setEarlyReflectionsLevel(0.7);
  r_drop.addInput(g_drop);
  ac.out.addInput(r_drop);

  ac.out.addInput(g_drop);

  // player_rainDropSound.setLoopType(amplePlayer.LoopType.LOOP_FORWARDS);

  //Panner p = new Panner(ac, 0); 

  //player_rainDropSound.setRate(gl_drop);

  //g.addInput(p);

  //ac.start();
}

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
 // player_light.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);

  //Panner p = new Panner(ac, 0); 
  gl_light = new Glide(ac, 1, 10); //intialize glide
  player_light.setRate(gl_light);//connnect glide to sample


  gainValLight = new Glide(ac, 1, 30); //create gain for control of vol
  g_light = new Gain(ac, 2, gainValLight);
  g_light.addInput(player_light);

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

  //player_heavy.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);

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
