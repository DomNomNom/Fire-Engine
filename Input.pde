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
    initKeyCodes();
    initKeyMap();
  }

  boolean handleMovementKeys(int keyCode, int pressDir) {
    println(keyCode + " " + pressDir);
         if (keyCode == (Integer)keyMap.get("up"   )) control.y -= pressDir;
    else if (keyCode == (Integer)keyMap.get("down" )) control.y += pressDir;
    else if (keyCode == (Integer)keyMap.get("left" )) control.x -= pressDir;
    else if (keyCode == (Integer)keyMap.get("right")) control.x += pressDir;
    else return false;
    return true;
  }

  void initKeyMap() {
    keyMap = new HashMap();
    for (String line : loadStrings("data/keyBindings.map")) {
      int sepPos = line.indexOf(keyValueSeparator);
      if (sepPos != -1) { // if it is a valid line
        keyMap.put(
          line.substring(0, sepPos),
          keyCodes.get(line.substring(sepPos+keyValueSeparator.length()))
        );
      }
    }
    println(keyMap);
  }

  void initKeyCodes() {
    keyCodes = new HashMap();
    for (String line : loadStrings("data/keyCodes.map")) {
      int sepPos = line.indexOf(keyValueSeparator);
      if (sepPos != -1) { // if it is a valid line
        keyCodes.put(
          line.substring(0, sepPos),
          Integer.parseInt(line.substring(sepPos+keyValueSeparator.length()))
        );
      }
    }

    // Special keys that can't be put in the file
    keyCodes.put("UP",      UP    );
    keyCodes.put("DOWN",    DOWN  );
    keyCodes.put("LEFT",    LEFT  );
    keyCodes.put("RIGHT",   RIGHT );
    keyCodes.put("ENTER",   ENTER );
    //keyCodes.put("ENTER", RETURN); // mac os
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
