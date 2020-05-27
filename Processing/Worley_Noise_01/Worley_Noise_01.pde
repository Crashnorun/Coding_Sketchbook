PVector[] pts = new PVector[7];

void setup() {
  size(400, 400);
  for (int i = 0; i < pts.length; i++) {
    PVector pt = new PVector(random(width), random(height)); 
    pts.add(pt);
  }
}



void draw() {


  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x * width + y;
      pixels[index] = color(random(255));
    }
  }
  updatePixels();

  for (int i = 0; i < pts.length; i++) {
    PVector pt = new PVector(random(width), random(height)); 
    pts.add(pt);
  }
}
