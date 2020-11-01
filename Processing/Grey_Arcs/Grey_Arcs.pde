
int NumArcs;
ArrayList<ARC> Arcs = new ArrayList<ARC>();
int MinRadius = 10;
int MaxRadius = 600;

void setup() {

  size(600, 600, P2D);
  background(50);
  stroke(200);
  strokeWeight(2);
  // smooth(2);
  
  NumArcs = (int)random(10, 50);

  for (int i = 0; i < NumArcs; i++) {
    float radius = random(MinRadius, MaxRadius);
    float angle = noise(radius) * 360;
    float speed = random(1);
    float temp = random (1.1);
    boolean filled = temp > 0.5 ? true : false;
    temp = random(1.1);
    boolean clockwise = temp > 0.5 ? true : false;

    ARC arc = new ARC(radius, angle, speed, filled, clockwise);
    Arcs.add(arc);
  }
}



void draw() {
  translate(width/2, height/2);
  for(int i = 0; i < NumArcs; i++){
  Arcs.get(i).Render();  
    
    
  }
  
  
  
}
