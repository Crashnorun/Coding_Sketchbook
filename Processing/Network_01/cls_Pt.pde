

class cls_Pt {

  int x, y, index1, index2, rad;
  color col;
  boolean display;

  cls_Pt(int x, int y, int index1, int index2, color col, int rad ) {
    this.x = x;
    this.y = y;
    this.index1 = index1;
    this.index2 = index2;
    this.col = col;
    this.rad = rad;
    display = false;
  }

  void Render() {
    fill(col);
    ellipse(x, y, rad, rad);
  }
}