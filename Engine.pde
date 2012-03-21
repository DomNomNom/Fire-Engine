/****************************************************************\
| Has the defenition of main game loop and pulls things together |
|                                                                |
\****************************************************************/

class Engine {
  Player player;
  private ArrayList<Entity> entities = new ArrayList<Entity>();
  private HashMap<group, ArrayList<Entity>> groups = new HashMap<group, ArrayList<Entity>>();

  GameState gameState = new GameState();

  float prevTime;

  Engine() {
    // initial conditions
    player = new Player(300, 200);
    addEntity(player);
    addEntity(new Mover(100, 100));
    addEntity(new Mover(250, 200));

    prevTime = millis();
  }

  void run() {
    float mills = millis();
    float dt = mills - prevTime;
    prevTime = mills;

    Collections.sort(entities); // ensure we are drawing all our stuff from background to foreground

    for (int i=entities.size()-1; i>=0; --i) { // We are deleting from the array so iterating backwards makes more sense
      Entity e = entities.get(i);
      if (e.updating)
        e.update(dt);
      pushStyle();
        e.draw();
      popStyle(); // ensure no graphical settings are transfered
      if (e.dead) entities.remove(i);
    }
  }

  void addEntity(Entity e) {
    entities.add(e);

    // add the entity to the array lists corresponding to the groups it belongs to
    for (group g : e.groups) {
      if (! groups.containsKey(g))
        groups.put(g, new ArrayList<Entity>());
      groups.get(g).add(e);
    }
  }

  /*******************************************************\
  | Handles transitions between game states               |
  |                                                       |
  | It's been moved to a inner class as it is quite a big |
  | chunk of code that is seperate                        |
  \*******************************************************/
  // TODO: use groups properly.
  class GameState {

    state currentState = state.game; // use changeState() which does proper job of changing this with safe transitions

    GameState() { }

    // has lots of code defining safe transitions and what should be done
    void changeState(state changeTo) {
      boolean wasSafe = true;

      if (currentState == state.menu) {
        wasSafe = false; // TODO transitions from the menu.
      }
      else if( currentState == state.paused) {
        if (changeTo == state.paused) // special case: pause toggles back to game
          changeTo = state.game;
        if (changeTo == state.game) {
          entities.removeAll(groups.get(group.pauseMenu)); // I should probably make a function that uses both this and the next statement
          groups.remove(group.pauseMenu);
          for (Entity e : groups.get(group.game)) e.updating = true; // unfreeze game
        }
        else wasSafe = false;
      }
      else if (currentState == state.game) {
        if (changeTo == state.paused) {
          for (Entity e : groups.get(group.game)) e.updating = false; // freeze game
          addEntity(new PauseMenu());
        }
        else wasSafe = false;
      }
      else wasSafe = false;

      if (wasSafe)
        currentState = changeTo;
      else
        println("OMG, you totally did not just try to change from '" +currentState+ "' to '" +changeTo+ "'. I hate you.");
    }
  }
}

