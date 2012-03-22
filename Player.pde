class Player extends Entity {
  PVector target;

  float movementSpeed = .2;
  float angle;

  Player(float x, float y) {
    pos = new PVector(x, y);
    target = new PVector(0,0);
    groups = new group[] {group.game, group.player};
    drawLayer = layer.player;
    animation = resources.animations.get("player");
  }

  void shoot() {
    if (updating)
      engine.addEntity(new Bullet(pos, angle));
  }

  void update(float dt) {
    vel.x = input.control.x; // deep copy as we don't want to modify input.
    vel.y = input.control.y;
    vel.normalize();
    vel.mult(movementSpeed);
    move(dt);

    target.x = input.mousePos.x;
    target.y = input.mousePos.y;
    angle = atan2(target.y - pos.y, target.x - pos.x);

    animation.update(dt);
  }

  void draw() {
    fill(color(40, 200, 40));
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(angle);
      animation.draw();
    popMatrix();
    stroke(255, 100);
    line(pos.x, pos.y, target.x, target.y);
  }
}
