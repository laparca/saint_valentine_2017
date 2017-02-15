class Delay implements Animation {
  int frame;
  int untilFrame;
  
  Delay(int untilFrame) {
    frame = 0;
    this.untilFrame = untilFrame;
  }
  
  boolean isEnded() {
    return frame >= untilFrame;
  }
  
  void draw() {
    frame ++;
  }
}