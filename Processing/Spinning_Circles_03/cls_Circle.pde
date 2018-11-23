 //<>// //<>//

// ellipse radius
// circle radius
// color
// position


class Circle {

  float CentX, CentY;
  float rad1, rad2;    // circle radius, ellipse radius
  color colFill;
  float rot;
  int dir;
  float x = 0, y = 0;


  Circle(float rad1, float rad2, color colFill) {
    
    this.rad1 = rad1;
    this.rad2 = rad2;
    this.colFill = colFill;
    this.rot = random(0, PI/4);

    if (random(1) > 0.5) {
     this.dir = 1;
    } else {
      this.dir = -1;
    }
  }


  void Render() {
    rotate(this.rot);
    fill(colFill);
   
    ellipse(sin(x) * rad2, cos(y) * rad2, rad1, rad1);
    x += 0.1; 
    y += 0.1;
  }


  void Debug() {
    println("X: " + x + " | Y: " + y + " | rad1: " + rad1 + " | rad2: " + rad2);
  }
}