
Engine game_engine;

void setup() {
  // graphics options
  size(500, 500, P2D);
  smooth();
  fill(200);
  noStroke();
  
  game_engine = new Engine();
  game_engine.add_entity(new Mover(100, 100));
}

void draw() {
  background(21);
  game_engine.run();
}

