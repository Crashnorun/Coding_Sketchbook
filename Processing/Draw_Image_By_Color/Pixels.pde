

class Pixel implements Comparable
{

  int x;
  int y;
  color colRGB;
  color colLong;
  int r, g, b;


  Pixel(int x, int y, color colLong) {
    this.x = x;
    this.y = y;
    this.colLong = colLong;
    
  }

  String toString() {
    return ("X: " + x + " | Y: " + y + " | colLong: " + colLong);
  }

  int compareTo(Object obj) {
    Pixel pix = (Pixel) obj;

    if (this.colLong < pix.colLong) { 
      return -1;
    } else if (this.colLong > pix.colLong) {
      return 1;
    } else { 
      return 0;
    }
  }
}