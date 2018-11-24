
int w = 600, h = 600;
float x = 0, y = 0;
float rad1 = 20;
float rad2 = 100;
color colBack = color(0, 10);
color colFill = color(100, 100, 150);
boolean visible = false;

void settings() {
  size(w, h);
}


void setup() {
  background(0);
  noStroke();
}


void draw() {
  fill(colBack);
  rect(0, 0, width, height);

  fill(colFill);
  translate(width/3, height/2);
  if (visible) {
    ellipse(sin(x) * rad2, cos(y) * rad2, rad1, rad1);
    x += 0.1;    // option 02 - move these two lines out of the if statement
    y += 0.1;
  }

  if (!visible) {
    translate(width/3, 0);
    ellipse(-sin(x) * rad2, -cos(y) * rad2, rad1, rad1);
    x -= 0.1;    // option 02 - comment these two lines out
    y -= 0.1;
  }

  if ((cos(y) * rad2) > -5 && (cos(y) * rad2) < 5) {
    if (sin(x) > 0.5 ) {
      //noLoop();
      visible = !visible;
    }
  }
}