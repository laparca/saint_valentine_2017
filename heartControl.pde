class HeartControl implements Animation {
  float angle = 0.0;
  float step;
  int opaque = 255;
  boolean isToOpaque = false;
  
  int[] heart = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 2, 2, 2, 2, 0, 0, 0, 2, 2, 2, 2, 0, 0, 0,
    0, 0, 2, 1, 1, 1, 1, 2, 0, 2, 1, 1, 1, 1, 2, 0, 0,
    0, 2, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 0,
    0, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 0,
    0, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 0,
    0, 0, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 0, 0,
    0, 0, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 0, 0,
    0, 0, 0, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 0, 0, 0,
    0, 0, 0, 0, 2, 1, 1, 1, 1, 1, 1, 1, 2, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 2, 1, 1, 1, 1, 1, 2, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 2, 1, 1, 1, 2, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };
  
  int h_count = 17;
  int v_count = 15;
  
  float rect_width;
  float rect_height;

  HeartControl() {
    angle = 45f;
    step = 0.1f;
    
    rect_width = (float)width / (float)h_count;
    rect_height = (float)height / (float)v_count;
  }
  
  HeartControl(float a) {
    angle = a;
    step = 0.1f;
    
    rect_width = (float)width / (float)h_count;
    rect_height = (float)height / (float)v_count;
  }
  
  HeartControl toOpaque() {
    isToOpaque = true;
    angle = 0;
    return this;
  }
  
  HeartControl(float a, float s) {
    angle = a;
    step = s;
    
    rect_width = (float)width / (float)h_count;
    rect_height = (float)height / (float)v_count;
  }
  
  public void draw() {
    for (int y = 0; y < v_count; y ++) {
      for (int x = 0; x < h_count; x ++) {
        int v = heart[x + y * h_count];
        if (v != 0) {
          rotateY(radians(angle));
          if (v == 1)
            fill(random(100, 200), 0, 0, opaque);
          else
            fill(random(90, 99), 0, 0, opaque);
          rect(x * rect_width, y * rect_height, rect_width, rect_height);
        }
      }
    }

    if (angle > 0) {
      angle -= step;
    }
    else {
      angle = 0.0f;
    }
    
    if (isToOpaque)
      opaque --;
  }
  
  boolean stillMoving() {
    if (isToOpaque) {
      return opaque >= 0;
    }
    else {
      return angle != 0.0f;
    }
  }
  
  boolean isEnded() {
    return !stillMoving();
  }
}