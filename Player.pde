class Player extends Entity {
  PVector control;

  float movementSpeed = .2;

  float angle;

  Player(float x, float y) {
    pos = new PVector(x, y);
    drawLayer = layer.player;
  }

  void update(float dt) {
    vel.x = input.control.x; // deep copy as we don't want to modify input.
    vel.y = input.control.y;
    vel.normalize();
    vel.mult(movementSpeed);
    move(dt);
  }

  void draw() {
    fill(color(40, 200, 40));
    angle = atan2(input.mousePos.y - pos.y, input.mousePos.x - pos.x);
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(angle);
      rect(0, 0, size.x, size.y);
    popMatrix();
    stroke(255, 100);
    line(pos.x, pos.y, input.mousePos.x, input.mousePos.y);
  }
}
