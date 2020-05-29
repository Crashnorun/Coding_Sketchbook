PVector[] pts = new PVector[150];            // attractor points
int n  = 3;
int frame = 0;

void setup() {
  size(400, 400);
  for (int i = 0; i < pts.length; i++) {    // set all pixel colors
    PVector pt = new PVector(random(width), random(height)); 
    pts[i] = pt;
  }
}

void draw() {

  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {

      float[] distances = new float[pts.length];
      for (int i = 0; i < pts.length; i++) {
        float d = dist(x, y, pts[i].x, pts[i].y);
        distances[i] = d;
      }
      float[] sorted = sort(distances);
      float noise = map(sorted[n], 0, width*.15 , 0, 255);
      int index = x + y * width;
      pixels[index] = color(noise);
    }
  }
  updatePixels();

  /* for (int i = 0; i < pts.length; i++) {
   stroke(0, 0, 255);
   strokeWeight(8);
   //point(pts[i].x, pts[i].y);
   pts[i].x += random(-10, 10);
   pts[i].y += random(-10, 10);
   }*/
}

void mouseClicked() {
  save("Image_" + frame + ".jpg");
  frame++;
}
