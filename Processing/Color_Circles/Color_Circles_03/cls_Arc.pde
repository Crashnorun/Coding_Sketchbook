

class cls_Arc {

  // properties
  float start, stop;            // start and stop angle of the arc
  int stroke, radius;           // stroke width and radius
  color col;                    // arc color
  float x1, y1, x2, y2;         // start and stop pts for the end line
  //----------------------------------------


  /*----------------------------------------
   Blank constructor
   */
  cls_Arc() {
  }
  //----------------------------------------


  /*----------------------------------------
   Start = start angle
   Stop = stop angle
   Stroke = stroke width
   Radius = radius
   Col = color
   */
  cls_Arc(float Start, float Stop, int Stroke, int Radius, color Col) {
    start = Start;      // start angle
    stop = Stop;        // stop angle
    stroke = Stroke;    // width
    radius = Radius;    // radius
    col = Col;          // color
  }
  //----------------------------------------


  void render() {
    stroke(col);                 // set stroke color
    strokeWeight(stroke);        // set stroke width
    noFill();                    // no fill
    arc(width/2, height/2, radius, radius, start, stop);
  }
  //----------------------------------------


  void render2() {
    stroke(col);
    strokeWeight(2);
    noFill();

    // center pt X,Y | radius, angle angle
    //arc(width/2, height/2, radius-(stroke/2), radius-(stroke/2), start, stop);
    //arc(width/2, height/2, radius+(stroke/2), radius+(stroke/2), start, stop);

    // draw horizontal line that is of length = stroke and at radius away from origin
    x1 =  radius + (stroke/2.0);
    y1 = 0;
    x2 = radius - (stroke/2.0);
    y2 = 0;
    // rotate line
  

    pushMatrix();
    translate((width/2), (height/2));
    arc(0, 0, radius-(stroke/2.0), radius-(stroke/2.0), start, stop);
    arc(0, 0, radius+(stroke/2.0), radius+(stroke/2.0), start, stop);

    rotate(start);
    line(x1, y1, x2, y2);
    rotate(stop);
    line(x1, y1, x2, y2);
    popMatrix();
  }
  //----------------------------------------


  void debug() {
    println("Center X: " + width/2 + " - Center Y: " + height/2 + 
      " - Radius: " + radius + " - Stroke: " +  stroke +
      " - Start: " + start + " - Stop: " + stop + 
      " - Color: " + col);
    println("Ln1 : " + x1 + " : " + y1 + " Length: " + (x1+x2));
  }
  //----------------------------------------
}