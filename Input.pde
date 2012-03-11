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
    keyCodes.put("#", 51);
    keyCodes.put("!", 49);
    keyCodes.put("&", 55);
    keyCodes.put("'", 222);
    keyCodes.put("$", 52);
    keyCodes.put("%", 53);
    keyCodes.put("*", 56);
    keyCodes.put("+", 61);
    keyCodes.put("(", 57);
    keyCodes.put(")", 48);
    keyCodes.put(".", 46);
    keyCodes.put("/", 47);
    keyCodes.put(",", 44);
    keyCodes.put("-", 45);
    keyCodes.put("3", 51);
    keyCodes.put("2", 50);
    keyCodes.put("1", 49);
    keyCodes.put("0", 48);
    keyCodes.put("7", 55);
    keyCodes.put("6", 54);
    keyCodes.put("5", 53);
    keyCodes.put("4", 52);
    keyCodes.put(";", 59);
    keyCodes.put(":", 59);
    keyCodes.put("9", 57);
    keyCodes.put("8", 56);
    keyCodes.put("?", 47);
    keyCodes.put(">", 46);
    keyCodes.put("=", 61);
    keyCodes.put("<", 44);
    keyCodes.put("D", 68);
    keyCodes.put("E", 69);
    keyCodes.put("F", 70);
    keyCodes.put("G", 71);
    keyCodes.put("@", 50);
    keyCodes.put("A", 65);
    keyCodes.put("B", 66);
    keyCodes.put("C", 67);
    keyCodes.put("L", 76);
    keyCodes.put("M", 77);
    keyCodes.put("N", 78);
    keyCodes.put("O", 79);
    keyCodes.put("H", 72);
    keyCodes.put("I", 73);
    keyCodes.put("J", 74);
    keyCodes.put("K", 75);
    keyCodes.put("U", 85);
    keyCodes.put("T", 84);
    keyCodes.put("W", 87);
    keyCodes.put("V", 86);
    keyCodes.put("Q", 81);
    keyCodes.put("P", 80);
    keyCodes.put("S", 83);
    keyCodes.put("R", 82);
    keyCodes.put("]", 93);
    keyCodes.put("\\", 92);
    keyCodes.put("_", 45);
    keyCodes.put("^", 54);
    keyCodes.put("Y", 89);
    keyCodes.put("X", 88);
    keyCodes.put("[", 91);
    keyCodes.put("Z", 90);
    keyCodes.put("f", 70);
    keyCodes.put("g", 71);
    keyCodes.put("d", 68);
    keyCodes.put("e", 69);
    keyCodes.put("b", 66);
    keyCodes.put("c", 67);
    keyCodes.put("`", 192);
    keyCodes.put("a", 65);
    keyCodes.put("n", 78);
    keyCodes.put("o", 79);
    keyCodes.put("l", 76);
    keyCodes.put("m", 77);
    keyCodes.put("j", 74);
    keyCodes.put("k", 75);
    keyCodes.put("h", 72);
    keyCodes.put("i", 73);
    keyCodes.put("w", 87);
    keyCodes.put("v", 86);
    keyCodes.put("u", 85);
    keyCodes.put("t", 84);
    keyCodes.put("s", 83);
    keyCodes.put("r", 82);
    keyCodes.put("q", 81);
    keyCodes.put("p", 80);
    keyCodes.put("~", 192);
    keyCodes.put("}", 93);
    keyCodes.put("|", 92);
    keyCodes.put("{", 91);
    keyCodes.put("z", 90);
    keyCodes.put("y", 89);
    keyCodes.put("x", 88);
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
