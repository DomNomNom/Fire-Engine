Input input; // this is the global var we are going to use

class Input {
  PVector mousePos = new PVector(width/2, height/2);
  PVector control = new PVector(0, 0);

  boolean handleMovementKeys(int keyCode, int pressDir) {
    switch (keyCode) {
      case UP:
        input.control.y -= pressDir;
        break;
      case DOWN:
        input.control.y += pressDir;
        break;
      case LEFT:
        input.control.x -= pressDir;
        break;
      case RIGHT:
        input.control.x += pressDir;
        break;
      default:
        return false;
    }
    return true;
  }
}

void mouseMoved() {
  input.mousePos.x = mouseX;
  input.mousePos.y = mouseY;
}

void keyPressed() {
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
      input.handleMovementKeys(keyCode, 1);
      break;
  }
}

void keyReleased() {
  input.handleMovementKeys(keyCode, -1);
}
