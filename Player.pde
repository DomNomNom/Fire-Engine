class Player extends Entity {
  PVector control;

  float movementSpeed = .2;

  Player(float x, float y) {
    pos = new PVector(x, y);
    drawLayer = layer.player;
  }

  void update(float dt) {
    vel.x = input.control.x; // deep copy
    vel.y = input.control.y;
    vel.normalize();
    vel.mult(movementSpeed);
    move(dt);
  }

  void draw() {
    fill(color(40, 200, 40));
    ellipse(pos.x, pos.y, size.x, size.y);
  }
}
