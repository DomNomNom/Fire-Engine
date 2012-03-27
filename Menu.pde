class Menu extends Entity {
  Menu() {
    size = new PVector(width, height);
    drawLayer = layer.menu;
  }
  
  void draw() {
    fill(color(0, 100));
    rect(center.x, center.y, size.x, size.y);
  }
}
