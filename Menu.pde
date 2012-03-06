class Menu extends Entity {
  Menu() {
    size = new PVector(width, height);
    drawLayer = layer.menu.ordinal();
  }
  
  void draw() {
    fill(color(200, 40, 40, 50));
    rect(pos.x, pos.y, size.x, size.y);
  }
}
