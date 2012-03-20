/****************************************************************\
| Has the defenition of main game loop and pulls things together |
|                                                                |
\****************************************************************/

class Engine {
  Player player;
  ArrayList<Entity> entities = new ArrayList<Entity>();
  //HashMap<String, ArrayList> groups; // TODO

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
    // TODO: HashMap fun
  }


  /*******************************************************\
  | Handles transitions between game states               |
  |                                                       |
  | It's been moved to a inner class as it is quite a big |
  | chunk of code that is seperate                        |
  \*******************************************************/
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
          for (int i : selectGroup(group.pauseMenu)) // remove pause menu
            entities.remove(i);
          for (int i : selectGroup(group.game)) // unfreeze game
            ((Entity)entities.get(i)).updating = true;
        }
        else wasSafe = false;
      }
      else if (currentState == state.game) {
        if (changeTo == state.paused) {
          for (int i : selectGroup(group.game)) // freeze game
            (entities.get(i)).updating = false;
          entities.add(new PauseMenu());
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

  int[] selectGroup(group g) { // gets the indexes of all entities that are in a specific group
    ArrayList<Integer> selected = new ArrayList<Integer>();
    for (int i=0; i<entities.size(); ++i)
      if ((entities.get(i)).inGroup(g))
        selected.add(i);

    // copy it into a array form (not ArrayList)
    int[] sel = new int[selected.size()];
    for (int i=0; i<selected.size(); ++i)
      sel[i] = selected.get(i);
    return reverse(sel); // We are giving the list in reverse to avoid problems when deleting elements
  }

}

