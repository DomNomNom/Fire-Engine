Input input; // this is the global var we are going to use

class Input {
  PVector mousePos; 
  PVector control;
  
  Input() {
    mousePos = new PVector(width/2, height/2);
    control = new PVector(0, 0);
  }
  
  void tick() { // should be called at the end of the game main loop
    control.x = 0;
    control.y = 0;
  }
}

void mouseMoved() {
  input.mousePos.x = mouseX;
  input.mousePos.y = mouseY;
}

void keyPressed() {
  switch (key) {
    case 'p': // TODO: safe transitions (eg. from main menu)
      if (engine.gameState == state.paused)
        engine.changeState(state.game);
      else
        engine.changeState(state.paused);
      break;
    /*
    case ' ':
      engine.player.jump();
      break;
    */
    case CODED:
      switch (keyCode) {
        case UP:
          input.control.x -= 1;
          break;
        case DOWN:
          input.control.x += 1;
          break;
        case LEFT:
          input.control.y -= 1;
          break;
        case RIGHT:
          input.control.y += 1;
          break;
      }
      println("coded");
      break;
  }
}
