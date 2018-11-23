 //<>//
int w = 600, h = 600;
float x = 0, y = 0;
float rad1 = 20;
float rad2 = 100;
color colBack = color(0, 50);
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
    float r1 = random(3, 10);
    float r2 = random(50, 100);
    color col = color(200);
    circles.add(new Circle(r1, r2, col));
  }
}


void draw() {
  fill(colBack);
  rect(0, 0, width, height);

  //translate(width/3, height/2);
  for (int i = 0; i < maxCircles; i++) {

    translate(width/3, height/2);

    if (circles.get(i).dir >0) 
      translate(width/3, 0);

    circles.get(i).Render();
    translate(-width/3, -height/2);
    if (circles.get(i).dir >0) 
      translate(-width/3, -0);
  }


  //fill(colFill);
  //ellipse(sin(x) * rad2, cos(y)*rad2, rad1, rad1);
  //x+=0.1;
  //y+=0.1;

  //translate(width/3, 0);
  //ellipse(-sin(x) * rad2, -cos(y)*rad2, rad1, rad1);
}