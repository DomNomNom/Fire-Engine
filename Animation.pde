class Animation {
  PImage[] images;

  boolean pingPong = true;

  float animationTime;
  float period = 1000; // milliseconds
  float frameCount; // same as images.length, just as a float
  int frame;

  Animation(String folder) {
    folder = sketchPath + "/data/animations/" + folder + "/";
    String[] fileNames = sort(new File(folder).list());
    images = new PImage[fileNames.length];
    for (int i=0; i<fileNames.length; ++i)
      images[i] = loadImage(folder + fileNames[i]);
    frameCount = images.length;
  }

  void update(float dt) {
    animationTime += dt;
    while (animationTime >= period) // ensure 0 <= animationTime < period
      animationTime -= period;

    if (pingPong) { // reverse the animation when passing the middle of the period
      if (animationTime < period/2)
        frame = floor(animationTime * 2*(frameCount-1)/period);
      else
        frame = 2*(images.length-1) - floor(animationTime * 2*(frameCount-1)/period);
    }
    else  // start from the beginning when passing the period
      frame = floor(frameCount * animationTime/period);
  }

  void draw() {
    image(images[frame], 0, 0);
  }
}
