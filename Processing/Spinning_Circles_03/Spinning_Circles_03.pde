 //<>//
int w = 600, h = 600;
color colBack = color(0, 25);
color colFill = color(100, 100, 150);
ArrayList<Circle> circles = new ArrayList<Circle>();
int maxCircles = 20;


void settings() {
  size(w, h);
}


void setup() {
  frameRate(30);
  background(0);
  noStroke();

  for (int i = 0; i < maxCircles; i++) {
    float r1 = random(2, 15);                  // ellipse radius
    float r2 = random(75, 150);                // circle radius
    color col = color(200);
    circles.add(new Circle(r1, r2, col));
  }
}


void draw() {
  fill(colBack);
  rect(0, 0, width, height);

  //translate(width/3, height/2);
  for (int i = 0; i < maxCircles; i++) {

    if (circles.get(i).dir > 0) { 
      pushMatrix();
      translate(width/3, height/2);
      circles.get(i).Render();
      popMatrix();
    } else {
      pushMatrix();
      translate(2*width/3, height/2);
      circles.get(i).Render();
      popMatrix();
    }
  }
}