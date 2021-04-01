
class Pix implements Comparable<Pix> {

  color col;
  int index;
  int x;
  int y;

  Pix(color col, int x, int y, int index) {
    this.col = col;
    this.x = x;
    this.y = y;
    this.index = index;
  }

  float getBrightness() {
    //return round(hue(this.col) * 10);
    return this.col;
    /*float r = red(this.col);
     float g = green(this.col);
     float b = blue(this.col);
     float h = hue(this.col);
     float br = brightness(this.col);
     float s = saturation(this.col);
     return (r+g+b+br+s+h)/6;*/
  }


  int compareTo(Pix other) {
    if (other == null) return 0;
    //return Integer.compare(this.getBrightness(),other.getBrightness());
    return Float.compare(this.getBrightness(), other.getBrightness());
    // https://stackoverflow.com/questions/14178539/can-i-use-compareto-to-sort-integer-and-double-values
  }
}
