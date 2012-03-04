Engine game_engine;

void setup() {
  // graphics options
  size(500, 500, P2D);
  smooth();
  fill(200);
  noStroke();
  
  // ===== init global variables =====
  input = new Input();
  game_engine = new Engine();
}

void draw() {
  background(21); // clear screen
  game_engine.run();
}

