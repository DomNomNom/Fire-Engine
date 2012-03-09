Engine engine;
PVector center; // the center coordinate of the window. just a handy thing to have around.

void setup() {
  // graphics options
  size(500, 500, P2D);
  smooth();
  fill(200);
  noStroke();
  
  // ===== init global variables =====
  input = new Input();
  engine = new Engine();
  center = new PVector(width/2, height/2);
}

void draw() {
  background(21); // clear screen
  engine.run();
}

