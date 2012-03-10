/******************************************************\
| Your base entity that includes a lot of useful stuff |
|                                                      |
| It has natural sorting by draw-layer                 |
\******************************************************/

class Entity implements Comparable<Entity> {
  PVector pos  = new PVector(  0,   0);
  PVector vel  = new PVector(  0,   0);
  PVector size = new PVector(100, 100);
  
  layer drawLayer;
  
  boolean dead = false;     // Identifies whether it should be removed
  boolean updating = true;  // We may not want to update but draw (eg. player] when paused)

  group[] groups = {group.game};

  boolean inGroup(group g) {
    for (group my_group : groups)
      if (g == my_group) return true;
    return false;
  }
  
  void update(float dt) {
    // fancy calculation of velocity here
    move(dt);
  }

  void move(float dt) { // just adds velocity to position
    pos.add(PVector.mult(vel, dt));
  }

  void draw() {
    rect(pos.x, pos.y, size.x, size.y);
  }
  
  int compareTo(Entity e) { // for natural ordering
    return e.drawLayer.ordinal() - this.drawLayer.ordinal();
  }
}
