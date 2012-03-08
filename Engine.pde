/****************************************************************\
| Has the defenition of main game loop and pulls things together |
|                                                                |
\****************************************************************/

class Engine {
  Player player;
  ArrayList entities = new ArrayList();

  GameState gameState;

  float prevTime;

  Engine() {
    // initial conditions
    gameState = new GameState();
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
        wasSafe = false; // TODO
      }
      else if( currentState == state.paused) {
        if (changeTo == state.paused) // special case: pause toggles back to game
          changeTo = state.game;
        if (changeTo == state.game) {
          // remove pause menu
          // unfreze game
          println("unpaused");
        }
        else wasSafe = false;
      }
      else if (currentState == state.game) {
        if (changeTo == state.paused) {
          // freeze game
          // add pause menu
          println("paused");
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

