class Menu extends Entity {
  Menu() {
    size = new PVector(width, height);
    drawLayer = layer.menu;
  }
  
  void draw() {
    fill(color(0, 100));
    rect(pos.x, pos.y, size.x, size.y);
  }
}
