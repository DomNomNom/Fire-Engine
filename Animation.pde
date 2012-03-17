class Animation {
  PImage[] images;

  boolean pingpong = false;

  float animationTime;
  float animationTimeLength = 500; // milliseconds
  int frame;

  Animation(String folder) {
    folder = sketchPath + "/data/animations/" + folder + "/";
    String[] fileNames = sort(new File(folder).list());
    images = new PImage[fileNames.length];
    for (int i=0; i<fileNames.length; ++i)
      images[i] = loadImage(folder + fileNames[i]);
  }

  void update(float dt) {
    animationTime += dt;
    while (animationTime >= animationTimeLength)
      animationTime -= animationTimeLength;
    frame = floor(images.length*animationTime/animationTimeLength);
    //println(animationTime);
  }

  void draw() {
    image(images[frame], 0, 0);
  }
}
