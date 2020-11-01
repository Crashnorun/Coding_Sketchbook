
int NumArcs;
ArrayList<ARC> Arcs = new ArrayList<ARC>();
int MinRadius = 10;
int MaxRadius = 600;
color RectColor;

void setup() {

  size(600, 600, P2D);
  background(50);
  stroke(200);
  strokeWeight(1);
  smooth(8);
  // rectMode(CENTER);
  RectColor = color(50, 5);

  NumArcs = (int)random(10, 30);

  for (int i = 0; i < NumArcs; i++) {
    float radius = random(MinRadius, MaxRadius);
    float start = random(0, 180);
    float angle = random(start + 10, 360);
    float speed = random(0.5);
    float temp = random (1.1);
    boolean filled = temp > 0.5 ? true : false;
    temp = random(1.1);
    boolean clockwise = temp > 0.5 ? true : false;
    float thickness = random(10, 20);

    ARC arc = new ARC(radius, start, angle, speed, filled, clockwise, thickness);
    Arcs.add(arc);
  }
}



void draw() {
  // background(50);
  fill(RectColor);
  rect(0, 0, width, height);
  translate(width/2, height/2);
  for (int i = 0; i < NumArcs; i++) {
    Arcs.get(i).Render();
    Arcs.get(i).Update();
  }
}
