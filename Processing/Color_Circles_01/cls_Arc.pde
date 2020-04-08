


class cls_Arc implements Comparable<cls_Arc> {

  float start, stop;
  int stroke, radius;
  color col;
  //----------------------------------------

  cls_Arc() {
  }
  //----------------------------------------

  cls_Arc(float Start, float Stop, int Stroke, int Radius, color Col) {
    start = Start;
    stop = Stop;
    stroke = Stroke;
    radius = Radius;
    col = Col;
  }
  //----------------------------------------

  void render() {
    stroke(col);
    strokeWeight(stroke);
    noFill();
    arc(width/2, height/2, radius, radius, start, stop);
    println("Start: " + start);
  }
  //----------------------------------------

  void debug() {
    println("Center X: " + width/2 + " - Center Y: " + height/2 + 
      " - Start: " + start + " - Stop: " + stop + 
      " - Radius: " + radius + " - Stroke: " +
      stroke + " - Color: " + col);
  }

  int compareTo(cls_Arc otherArc) {

    if (otherArc.stroke > this.stroke) {
      return 1;
    } else if (otherArc.stroke < this.stroke) {
      return -1;
    } else {
      return 0;
    }
  }
  
}

class ArcSorter implements Comparator<cls_Arc> {

  int compare(cls_Arc arc1, cls_Arc arc2) {

    if (arc1.stroke < arc2.stroke) {
      return -1;
    } else if (arc1.stroke > arc2.stroke) {
      return 1;
    } else {
      return 0;
    }
  }
}
