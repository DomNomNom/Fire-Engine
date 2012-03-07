class Engine {
  Player player;
  ArrayList entities = new ArrayList();

  state gameState;

  float prevTime;

  Engine() {
    // initial conditions
    loadState(state.menu);
    player = new Player(300, 200);
    entities.add(player);
    entities.add(new Mover(100, 100));
    entities.add(new Mover(250, 200));
    entities.add(new Menu());

    prevTime = millis();
  }

  void run() {
    float mills = millis();
    float dt = mills - prevTime;
    prevTime = mills;
    
    Collections.sort(entities); // ensure we are drawing all our stuff from background to foreground
    
    for (int i=entities.size()-1; i>=0; --i) { // We are deleting from the array so iterating backwards makes more sense
      Entity e = (Entity) entities.get(i);
      e.update(dt);
      pushStyle();
        e.draw();
      popStyle(); // ensure no graphical settings are transfered
      if (e.dead) entities.remove(i);
    }
  }

  void changeState(state changeTo) { // TODO: safe transitions
    unloadState(changeTo);
    loadState(changeTo);
    println(changeTo);
  }

  private void unloadState(state changeTo) {
    switch (changeTo) {
    //  case  // TODO
    }
  }

  private void loadState(state changeTo) {
    gameState = changeTo;
  }
}

