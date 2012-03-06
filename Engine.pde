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

    prevTime = millis();
  }

  void run() {
    float mills = millis();
    float dt = mills - prevTime;
    prevTime = mills;
    
    Collections.sort(entities); // ensure we are drawing all our stuff from background to foreground
    
    for (int i=entities.size()-1; i>=0; --i) { // things at the back of the array are more likely to be deleted. Therefore iterate though it in reverse
      Entity e = (Entity) entities.get(i);
      e.update(dt);
      pushStyle();
        e.draw();
      popStyle(); // ensure no graphical settings are transfered
      if (e.dead) entities.remove(i);
    }
  }

  void changeState(state s) { // TODO: safe transitions
    unloadState();
    loadState(s);
    println(s);
  }

  private void unloadState() {
  }

  private void loadState(state s) {
    gameState = s;
  }
}

