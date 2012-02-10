
Engine game_engine;

void setup() {
  size(500, 500, P2D);
  
  game_engine = new Engine();
  game_engine.add_entity(new Mover(100, 100));
}

void draw() {
  background(21);
  fill(200);
  game_engine.run();
}

