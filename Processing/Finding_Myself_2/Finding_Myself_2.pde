//-------------------------------------------------
// ---- GLOBAL VARIABLES ----
boolean debug = true;
boolean drawGrid = true;

PFont font;
String name;
int startAscii = 32;
int endAscii = 254;
ArrayList<ArrayList<String>> letters = new ArrayList<ArrayList<String>>();

int canvasSize = 800;
int minNumGridX, minNumGridY;
int maxNumGridX, maxNumGridY;

ArrayList<ArrayList<Cell>> cells = new ArrayList<ArrayList<Cell>> ();



//-------------------------------------------------
void settings() {

  size(canvasSize, canvasSize, P2D);
}



//-------------------------------------------------
void setup() {
  background(0);
  frameRate(10);

  fill(0, 100, 150);
  noStroke();

  font = createFont("Arial-BoldMT-48.vlw", 20);
  textFont(font);
  textAlign(CENTER, CENTER);
  text("Testing", width/2, height/2);
  name = "CHARLIE";


  minNumGridX = minNumGridY = 10;
  maxNumGridX = maxNumGridY = minNumGridX + 10;

  GridSetup();
}




//-------------------------------------------------
void draw() {

  if (drawGrid) {
    LocateTextInGrid();
    DrawGrid();
  }
}


void GridSetup() {

  if (minNumGridX < name.length()) {
    minNumGridX = minNumGridY = name.length() + 2;
    maxNumGridX = minNumGridY = minNumGridY + 10;
  }

  int w = width / maxNumGridX;
  int h = height / maxNumGridY;

  for (int i = 0; i < maxNumGridX; i++) {
    ArrayList<Cell> tempCells = new ArrayList<Cell>();
    for (int j = 0; j < maxNumGridY; j++) {
      Cell tc = new Cell(i * w, j * h);
      tempCells.add(tc);
    }
    cells.add(tempCells);
  }

  println("Input text is of length: " + name.length());
  println("Minimum grid X: " + minNumGridX + " Maximum grid X: " + maxNumGridX + " | Minimum grid Y: " + minNumGridY + " Maximum grid Y: " + maxNumGridY);
}


void LocateTextInGrid() {
  int locX = floor(random(0, maxNumGridX - name.length()));
  int locY = floor(random(0, maxNumGridY - name.length()));
  int textOrientation = floor(random(0, 2));      // 0 = horizontal, 1 = vertical

  for (int i = 0; i < cells.size(); i++) {
    ArrayList<String> tempLet = new ArrayList<String>();
    for (int j = 0; j < cells.get(i).size(); j++) {
      int num = int(random(startAscii, endAscii));
      String letter = String.valueOf(char(num));
      tempLet.add(letter);
    }
    letters.add(tempLet);
  }

  if (textOrientation == 0) {                                   // if text is horizontal
    for (int i = locX; i < name.length() + locX; i++) {
      letters.get(i).set(locY, String.valueOf(name.charAt(i - locX))); // = String.valueOf(name[i - locX]);
    }
  } else {                                                     // if text is vertical
    for (int i = locY; i < name.length() + locY; i++) {
      letters.get(locX).set(i, String.valueOf(name.charAt(i - locY))) ;
    }
  }
}




void DrawGrid() {

  background(0);
  int w = width / maxNumGridX;
  int h = height / maxNumGridY;
  println("Box width: " + w + " Box height: " + h);

  textSize(w * 0.66);
  fill(0, 100, 150);

  for (int i = 0; i < maxNumGridX; i++) {
    for (int j = 0; j < maxNumGridY; j++) {
      text(letters.get(i).get(j), (i + 0.25) * w, (j + 0.75) * h);
    }
  }
}
