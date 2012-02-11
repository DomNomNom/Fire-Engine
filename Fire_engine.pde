PVector mousePos;
Engine game_engine;

void setup() {
  // graphics options
  size(500, 500, P2D);
  smooth();
  fill(200);
  noStroke();
  
  // ===== init global variables =====
  mousePos = new PVector(width/2, height/2);
  game_engine = new Engine();
  game_engine.add_entity(new Mover(100, 100));
}

void draw() {
  background(21); // clear screen
  game_engine.run();
}

void mouseMoved() {
  mousePos.x = mouseX;
  mousePos.y = mouseY;
}
