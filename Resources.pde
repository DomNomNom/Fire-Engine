/**************************************************\
| A class that holds together big data resources   |
| that may be used by multiple objects.            |
| Example: Multiple bullets can use the same image |
\**************************************************/

Resources resources;

class Resources {
  Animation bullet;
  
  Resources() {
    bullet = new Animation("bullet.png");
  }  
  // TODO: I want resources.animations.bullet
}
