/******************************************************\
| Your base entity that includes a lot of useful stuff |
|                                                      |
| It has natural sorting by draw-layer                 |
\******************************************************/

class Entity implements Comparable<Entity> {
  PVector pos  = new PVector(  0,   0);
  PVector vel  = new PVector(  0,   0);
  PVector size = new PVector(100, 100); 
  
  int drawLayer;
  
  boolean dead = false;
  
  void update(float dt) {
    move(dt);
  }

  void move(float dt) {
    pos.add(PVector.mult(vel, dt));
  }

  void draw() {
    rect(pos.x, pos.y, size.x, size.y);
  }
  
  int compareTo(Entity e) { // for natural ordering
    return e.drawLayer - this.drawLayer;
  }
}
