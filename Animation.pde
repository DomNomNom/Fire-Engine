class Animation {
  PImage[] images;
  
  Animation(String folder) {
    folder = sketchPath + "/data/animations/" + folder + "/";
    String[] filenames = new File(folder).list();
    images = new PImage[filenames.length];
    for (int i=0; i<filenames.length; ++i)
      images[i] = loadImage(folder + filenames[i]);
  }
  
  void draw() {
    image(images[0], 0, 0);
  }
}
