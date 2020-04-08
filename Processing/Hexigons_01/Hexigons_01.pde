
int w, h;
float radius;
PShape hex;
float maxDist;
ArrayList<PShape> shapes = new ArrayList<PShape>();
ArrayList<PVector> gridPts = new ArrayList<PVector>();
//-----------------------------------


void setup() {
  radius = 30;
  size(400, 400);
  w = width;
  h = height;
  maxDist = sqrt(sq(w) + sq(h));
  background(0);
  CreateGrid();

  for (int i = 0; i < gridPts.size(); i++) {
    shapes.add(CreateHex(radius/2, gridPts.get(i).x, gridPts.get(i).y));
  }
}
//-----------------------------------


void draw() {
  background(0);
  PVector pos = new PVector(mouseX, mouseY);

  for (int i = 0; i < shapes.size(); i++) {
    float dist = pos.dist(gridPts.get(i));
    println("Dist = " + dist + " - Scale Factor = " + ( dist / maxDist));

    pushMatrix();
    translate(gridPts.get(i).x, gridPts.get(i).y);
    scale(dist/maxDist);
    //shape(shapes.get(i), gridPts.get(i).x, gridPts.get(i).y);
    shape(shapes.get(i), 0, 0);
    popMatrix();
  }
}
//-----------------------------------


void CreateGrid() {
  int iCount = 0;
  int start;
  float Hspacing = cos(PI/6) * radius;

  for (int i = 0; i < w; i = int(i + (0.75*radius))) {

    if (iCount % 2 == 0) {
      start = 0;
    } else {
      start = int(radius/2);
    }

    for (int j = start; j <= h; j = int(j + Hspacing)) {
      gridPts.add(new PVector(i, j));
    }
    iCount ++;
  }
}



// create a hexigon shape
PShape CreateHex(float radius, float x, float y) {
  PVector vect = new PVector(radius, 0);

  PShape a = createShape();
  a.beginShape();
  a.fill(0, 100, 250);

  for (int i = 0; i < 6; i ++) {
    a.vertex(vect.x, vect.y);
    vect.rotate(PI/3);
  }
  a.endShape(CLOSE);
  return a;
}
//-----------------------------------