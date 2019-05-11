// load data
Table table;
int numCols;
int numRows;


void setup() {
  size(1000, 600);
  table = loadTable("MortgageVals_02.csv", "header");
  numCols = table.getColumnCount();
  numRows = table.getRowCount();
  println("Number of columns: " + numCols);
  println("Number of rows: " + numRows);
  graphics();
  layoutAxis();
}


void draw() {
}


void graphics() {
  background(0);
  strokeWeight(1);
  stroke(0, 255, 255);
}

void layoutAxis() {
  int paddingH = 50;
  int paddingV = 50;
  stroke(255);

  // horizontal axis
  line(paddingH, height - paddingV, width-paddingH, height - paddingV);
  // vertical axis
  line(paddingH, height - paddingV, paddingH, paddingV);

  strokeWeight(0.25);

  int w = width - (paddingH * 2);            // length of horizontal axis
  println("Horizontal Axis Length: " + w);
  int space = w/(numCols * 12);               // tick mark spacing
  println(space);
  textSize(12);
  TableRow row = table.getRow(0);

  for (int i = paddingH; i < w; i+=3) {
    if (i-paddingH % 12 == 0) {                     // draw long line
      line(i, height - paddingV, paddingH + (i * w), paddingV);
      //  translate(paddingH + (i * w), height - paddingV + 12);
      //  rotate(PI/4);
      // text(row.getColumnTitle(i / (numCols*12)), 0, 0);
      // rotate(-PI/4);
      // translate(-(paddingH + (i * w)), -(height - paddingV + 12));
    } else {                              // draw short line
      line(paddingH + (i * w), height-paddingV, paddingH + (i * w), height-(paddingV*2));
    }
  }
}
