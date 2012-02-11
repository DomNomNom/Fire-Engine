class Engine {
  Player player;
  ArrayList entities;

  float prevTime;

  Engine() {
    player = new Player(100, 200);
    entities = new ArrayList();
    entities.add(player);
    add_entity(new Mover(100, 100));
    prevTime = millis();
  }

  void run() {
    float mills = millis();
    float dt = mills - prevTime;
    prevTime = mills;

    for (int i=entities.size()-1; i>=0; --i) { // things at the back of the array are more likely to be deleted. Therefore iterate though it in reverse
      Entity e = (Entity) entities.get(i);
      e.update(dt);
      pushStyle();
        e.draw();
      popStyle(); // ensure no graphical settings are transfered
      if (e.dead) entities.remove(i);
    }
  }
  
  void add_entity(Entity e) {
    entities.add(e);
  }
}

