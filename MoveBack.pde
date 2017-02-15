class MoveBack implements Animation {
  Animation animToMove;
  float z = 0;
  float y = 0;
  float step = 2.0f;
 
  float end;
  
  MoveBack(Animation anim, float begin, float end) {
    setup(anim, begin, end);
  }
  
  MoveBack(Animation anim, float begin, float end, float step) {
    setup(anim, begin, end, step);
  }
  
  MoveBack(Animation anim, float begin, float end, float step, float y) {
    setup(anim, begin, end, step, y);
  }
  
  private void setup(Animation anim, float begin, float end) {
    animToMove = anim;
    z = begin;
    this.end = end;
  }
  
  private void setup(Animation anim, float begin, float end, float step) {
    setup(anim, begin, end);
    this.step = step;
  }
  
  private void setup(Animation anim, float begin, float end, float step, float y) {
    setup(anim, begin, end, step);
    this.y = y;
  }
  
  boolean isEnded() {
    return z >= end;
  }
  
  void draw() {
    pushMatrix();

    translate(0, y, z);
    z -= step;
    y -= 0.5;
    
    animToMove.draw();
    
    popMatrix();
  }
}