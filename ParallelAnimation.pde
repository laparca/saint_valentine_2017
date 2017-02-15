import java.util.Vector;
class ParallelAnimation implements Animation {
  Vector<Animation> animations = new Vector<Animation>();
  
  boolean isEnded() {
    boolean ended = true;
    
    for(Animation anim: animations) 
      ended = ended && anim.isEnded();
      
    return ended;
  }
  
  ParallelAnimation add(Animation anim) {
    animations.add(anim);
    
    return this;
  }
  
  void draw() {
    for(Animation anim: animations) 
      anim.draw();
  }
}