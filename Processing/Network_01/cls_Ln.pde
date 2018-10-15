

class cls_Ln {

  cls_Pt stpt, endpt;
  color col;

  cls_Ln() {
  }
  
  
  
  cls_Ln(cls_Pt stpt, cls_Pt endpt, color col) {
    this.stpt = stpt;
    this.endpt= endpt;
    this.col = col;
  }


  void Render() {
    stroke(col);
    strokeWeight(1);
    line(stpt.x, stpt.y, endpt.x, endpt.y);
  }
}