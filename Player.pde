class Player extends Entity {
  PVector control;
  Player(float x, float y) {
    pos = new PVector(x, y);
  }
  
  void draw() {
    fill(color(40, 200, 40));
    ellipse(pos.x, pos.y, size.x, size.y);
  }
}
