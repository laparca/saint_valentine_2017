class AnimationChain implements Animation {
  class AnimationNode {
    Animation anim;
    AnimationNode next;
    
    AnimationNode(Animation anim, AnimationNode previous) {
      this.next = null;
      this.anim = anim;
      
      if (previous != null)
        previous.next = this;
    }
    
    boolean isEnded() { return anim.isEnded(); }
    void draw() { anim.draw(); }
  }
  
  AnimationNode first;
  AnimationNode last;
  AnimationNode actual;

  AnimationChain add(Animation anim) {
    last = new AnimationNode(anim, last);
    if (first == null) {
      first = last;
      actual = first;
    }
    
    return this;
  }
  
  public void draw() {
    if (actual != null) {
      actual.draw();
      if (actual.isEnded())
        goNext();
    }
  }
  
  public void goNext() {
    if (actual != null)
      actual = actual.next;
  }
  
  public boolean isEnded() {
    return actual == null;
  }
}