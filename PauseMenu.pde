class PauseMenu extends Entity {

  float centerBarHeight;

  PauseMenu() {
    groups = new group[] {group.pauseMenu};

    size = new PVector(width, height);
    drawLayer = layer.menu;
    centerBarHeight = center.x/4;
  }

  void draw() {
    fill(color(0, 100));
    rect(center.x, center.y, width, height         );
    rect(center.x, center.y, width, centerBarHeight);

    textFont(pauseLabel, 48);
    fill(250);
    text("Paused", center.x, center.y);
  }
}
