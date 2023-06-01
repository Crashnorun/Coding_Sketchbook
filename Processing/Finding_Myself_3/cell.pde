


class Cell {

  // location of the cell 
  int X, Y;
  String letter;
  boolean fixed = false;

  Cell(int x, int y) {
    X = x;
    Y = y;
  }
  
  Cell(int x, int y, String let){
   X = x;
   Y = y;
   letter = let;
   fixed = true;
  }
}
