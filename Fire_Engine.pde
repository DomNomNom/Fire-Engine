Engine engine;
PVector center; // the center coordinate of the window. just a handy thing to have around.

void setup() {
  // graphics options
  size(500, 500, P2D);
  smooth();
  fill(200);
  noStroke();
  rectMode(CENTER); // Note: entity.pos is the middle of the object. this will affect collision detection.
  ellipseMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  
  // ===== init global variables =====
  center = new PVector(width/2, height/2);
  resources = new Resources();
  input = new Input();
  engine = new Engine();
}

void draw() {
  background(21,10); // clear screen TODO: move this to a entity
  engine.run();
}
