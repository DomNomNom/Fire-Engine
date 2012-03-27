/**************************************************\
| A class that holds together big data resources   |
| that may be used by multiple objects.            |
| Example: Multiple bullets can use the same image |
\**************************************************/

Resources resources;

class Resources {
  Map<String, Animation> animations = new HashMap<String, Animation>();
  Map<String, PFont    > fonts      = new HashMap<String, PFont    >();
  
  Resources() {
    animations.put("bullet", new Animation("bullet.png"));
    animations.put("player", new Animation("player", 500, true));
    
    fonts.put("pauseLabel", loadFont("CharterBT-Italic-48.vlw"));
  }  
}
