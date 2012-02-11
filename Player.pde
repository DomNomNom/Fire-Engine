class Player extends Entity {
  PVector control;
  Player(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(.0, .0);
  }
}
