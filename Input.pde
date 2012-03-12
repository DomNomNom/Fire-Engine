Input input; // this is the global var we are going to use

/****************************************************************\
| Handles key presses and mouse actions                          |
|                                                                |
| There are functions from processing that get called when there |
| is a keyboard/mouse event. They are at the end of this file.   |
\****************************************************************/

class Input {
  PVector mousePos = new PVector(width/2, height/2);
  PVector control = new PVector(0, 0);

  HashMap keyMap;   // change this
  HashMap keyCodes; // but don't change this
  String keyValueSeparator = "=>"; // seperates key/values in the .map files

  Input() {
    // TODO: load key bindings from file
    initKeyCodes();
    initKeyMap();
  }

  boolean handleMovementKeys(int keyCode, int pressDir) {
    println(keyCode + " " + pressDir);
         if (keyCode == (Integer)keyMap.get("UP"   )) input.control.y -= pressDir;
    else if (keyCode == (Integer)keyMap.get("DOWN" )) input.control.y += pressDir;
    else if (keyCode == (Integer)keyMap.get("LEFT" )) input.control.x -= pressDir;
    else if (keyCode == (Integer)keyMap.get("RIGHT")) input.control.x += pressDir;
    else return false;
    return true;
  }

  void initKeyMap() {
    keyMap = new HashMap();
    /* // Arrow keys
    keyMap.put("UP",    UP   );
    keyMap.put("DOWN",  DOWN );
    keyMap.put("LEFT",  LEFT );
    keyMap.put("RIGHT", RIGHT);
    */
    keyMap.put("UP",    keyCodes.get("w"));
    keyMap.put("DOWN",  keyCodes.get("s"));
    keyMap.put("LEFT",  keyCodes.get("a"));
    keyMap.put("RIGHT", keyCodes.get("d"));
  }

  void initKeyCodes() { // note: you shouldn't need to modify or look at this
    keyCodes = new HashMap();
    String lines[] = loadStrings("data/keyCodes.map");
    for (String line : lines) {
      int sepPos = line.indexOf(keyValueSeparator);
      if (sepPos != -1) { // if it is a valid line
        keyCodes.put(
          line.substring(0, 1),
          Integer.parseInt(line.substring(sepPos+keyValueSeparator.length()))
        );
      }
    }
  }
}

void mouseMoved() {
  input.mousePos.x = mouseX;
  input.mousePos.y = mouseY;
}

void keyPressed() {
  if (! input.handleMovementKeys(keyCode, 1) ) {
    switch (key) {
      case 'p':
        engine.gameState.changeState(state.paused); // changeState is smart enough to unpause if paused
        break;
      /*
      case ' ':
        engine.player.jump();
        break;
      */
      case CODED:

        break;
    }
  }
}

void keyReleased() {
  input.handleMovementKeys(keyCode, -1);
}
