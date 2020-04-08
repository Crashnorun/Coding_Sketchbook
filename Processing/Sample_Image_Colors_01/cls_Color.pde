

class cls_Color implements Comparable<cls_Color> {

  int Red, Green, Blue;
  int count;
  color Color;
  ArrayList<PVector> Locations;

  cls_Color(color col) {

    Locations = new ArrayList<PVector>();

    Color = col;
    Red = (int) col >> 16 & 0xFF;
    Green = (int) col >> 8 & 0xFF;
    Blue = (int) col & 0xFF;
  }

  cls_Color(color col, int Xloc, int Yloc) {
    PVector loc = new PVector(Xloc, Yloc);
    Locations = new ArrayList<PVector>();
    Locations.add(loc);

    Color = col;
    Red = (int) col >> 16 & 0xFF;
    Green = (int) col >> 8 & 0xFF;
    Blue = (int) col & 0xFF;
  }

  void AddLocation(int Xloc, int Yloc) {
    PVector loc = new PVector(Xloc, Yloc);
    Locations.add(loc);
  }

  int compareTo(cls_Color other) {
    if (other.Locations.size() > Locations.size()) {
      return 1;
    } else if (other.Locations.size() < Locations.size()) {
      return -1;
    } else {
      return 0;
    }
  }
}

/*
class ColorSorter implements Comparator<cls_Color> {
  int compare(cls_Color one, cls_Color another) {
    int returnVal = 0;

    if (one.Locations.size() < another.Locations.size()) {
      returnVal =  -1;
    } else if (one.Lcoations.size() > another.Locations.size()) {
      returnVal =  1;
    } else if (one.Locations.size() == another.Location.size()) {
      returnVal =  0;
    }
    return returnVal;
  }
}*/