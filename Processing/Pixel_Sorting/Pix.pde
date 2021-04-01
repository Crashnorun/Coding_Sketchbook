
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

  int getBrightness() {
    return round(brightness(this.col) * 10);
  }


  int compareTo(Pix other) {
    if (other == null) return 0;
    return Integer.compare(this.getBrightness(),other.getBrightness());
    // https://stackoverflow.com/questions/14178539/can-i-use-compareto-to-sort-integer-and-double-values
  }
}
