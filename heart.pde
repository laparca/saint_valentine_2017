// Full HD
//int r_width  = 1920;
//int r_height = 1080;
// HD Ready
int r_width  = 1280;
int r_height =  720;

AnimationChain chain = new AnimationChain();

void settings() {
  size(r_width, r_height, P3D);
  orientation(LANDSCAPE);
}

void setup() {
  fullScreen(P3D);
  frameRate(60);
  stroke(0);

  chain
    .add(new HeartControl(45.0f, 0.2f))
    .add(new ParallelAnimation()
      .add(new MoveBack(new HeartControl().toOpaque(), 0, 300))
      .add(new AnimationChain()
        .add(new Delay(256))
        .add(new MoveBack(new TextWars(), 200, 300, 1, 50))));
}

void draw() {
  background(0);
  chain.draw();
}