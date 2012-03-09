class PauseMenu extends Entity {

  float centerBarHeight;

  PauseMenu() {
    groups = new group[1];
    groups[0] = group.pauseMenu;

    size = new PVector(width, height);
    drawLayer = layer.menu;
    centerBarHeight = center.x/4;
  }

  void draw() {
    fill(color(0, 100));
    rect(pos.x, pos.y, size.x, size.y);
    rect(0, center.y-centerBarHeight, width, centerBarHeight);
    // TODO: "Paused" text
  }
}