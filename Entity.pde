class Entity {
  PVector pos;
  PVector vel;
  
  boolean dead = false;
  
  void update(float dt) {
    pos.add(PVector.mult(vel, dt));
  }

  void draw() {
    ellipse(pos.x, pos.y, 100, 100);
  }
}
