class Mover extends Entity {
  Mover(float x, float y) {
    pos = new PVector( x,  y);
    vel = new PVector(.1, .0);
    drawLayer = layer.player.ordinal();
  }
}
