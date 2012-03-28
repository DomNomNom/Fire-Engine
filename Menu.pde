class Menu extends Entity {

  Menu() {
    size = new PVector(width, height);
    groups = new group[] {group.menu};
    drawLayer = layer.menu;
  }
  
  void draw() {
    // background
    fill(color(0, 100));
    rect(center.x, center.y, size.x, size.y);

    // game label
    fill(250);
    textFont(resources.fonts.get("pauseLabel"), 48);
    text("FireEngine", center.x, .8*center.y);
    
    textFont(resources.fonts.get("pauseLabel"), 26);
    text("The metagame", center.x, center.y);
    
    text("Press Spacebar to win", center.x, 1.5*center.y);
  }
}
