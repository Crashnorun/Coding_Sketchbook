// ---- PIXEL CLASS ----
class Pix {

  // ---- PROPERTIES ----
  int xLoc;
  int yLoc;
  color col;
  PVector loc;
  PVector target;
  float ang;
  float velocity;


  // ---- CONSTRUCTOR ----
  Pix(int x, int y, color c, double angle) {
    xLoc = x;
    yLoc = y;
    col = c;
    loc = new PVector(x, y);
    ang = (float)angle;
     velocity = random(5);    // option 1
    // velocity = 3;          // option 2

    calculateTarget();
  }


  // ---- MOVE VECTOR ----
  void MoveVector() {
    loc = loc.add(target);
  }


  // ---- REDRAW PIXELS ----
  void Redraw() {
    stroke(255);
    point(loc.x, loc.y);
  }



  // ---- CALCULATE TARGET VECTOR ----
  void calculateTarget() {
    // calculate furthest distance
    // this will be the radius
    double dist = CalcDist();

    // asign a target x and target y
    double x = dist * cos(ang);
    double y = dist * sin(ang);

    // create random vector off the screen
    target = new PVector((int)x, (int)y);
    target = target.normalize();
    target = target.setMag(velocity);
  }


  // ---- CALCULATE DISTANCE ----
  // make a circle larger then the canvas
  double CalcDist() {

    // draw an imaginarey circle around the canvas
    double dist = sqrt(pow(width, 2) + pow(height, 2));

    // scale the circle slightly for some variation
    dist = dist *random(1, 1.25);
    return dist;
  }

  String ToString() {
    return loc.x + " " + loc.y;
  }
}
