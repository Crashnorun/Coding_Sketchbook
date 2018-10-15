/*
split into a grid
 create a line class
 create a circle class
 start from random points
 and radiate about
 */

color col = color(0, 0, 0, 12);            // background color
color dots =  color(150, 0, 0);
int spacing = 25;            
ArrayList<ArrayList<cls_Pt>> Grid; 
ArrayList<PVector> Active;
ArrayList<cls_Ln> ActiveLns;
int radius = 5;
int count = 0;
// list of current active points
// list of current active lines

void setup() {
  size(600, 600);
  background(0);
  frameRate(5);
  Active = new ArrayList<PVector>();

  CreateGrid();
  Spawn();
}

void draw() {
  fill(col);
  rect(0, 0, width, height);

  Respawn();

  for (int i = 0; i< Active.size(); i++) {
    PVector vect = Active.get(i);
    Grid.get((int)vect.x).get((int)vect.y).Render();

    if (!ActiveLns.get(i).ignore) {
      ActiveLns.get(i).Render();
    }
  }
}




// create grid of points
void CreateGrid() {
  Grid = new ArrayList<ArrayList<cls_Pt> >();
  for (int i = 0; i <= height; i+= spacing) {
    ArrayList<cls_Pt> temp = new ArrayList<cls_Pt>();
    for (int j = 0; j <= width; j+= spacing) {
      temp.add(new cls_Pt(i, j, i/spacing, j/spacing, dots, radius));
    }
    Grid.add(temp);
  }
}


// randomly pick a series of points to spawn from 
void Spawn() {
  int tempNum = (int)random(7, 10);
  int count = 0;

  // randomly pick from grid
  while (count <= tempNum) {                         // while loop to avoid repeated pts
    int w = (int) random(0, Grid.size());
    int h = (int) random(0, Grid.size());
    if (Grid.get(w).get(h).display == false) {
      // Grid.get(w).get(h).display = true;
       Grid.get(w).get(h).Render();
      Active.add(new PVector(w, h));
      count++;
    }
  }
}


// 0 = up, 1 = right; 2 = down; 3 = left
void Respawn() {

  ActiveLns = new ArrayList<cls_Ln>();              // reset list
  boolean ignore = false;

  for (int i  = 0; i < Active.size(); i++) {
    cls_Ln templn = new cls_Ln();
    templn.col = dots;
    templn.stpt = Grid.get((int)Active.get(i).x).get((int)Active.get(i).y);

    int num = (int) random(0, 4);                  // pick a direction

    switch (num) {
    case 0:
      if (Active.get(i).y == 0) {
        Active.get(i).y = Grid.size()-1;
        ignore = true;
      } else {
        Active.get(i).y--;
      }
      break;
    case 1:
      if (Active.get(i).x == Grid.size()-1) {
        Active.get(i).x = 0;
        ignore = true;
      } else {
        Active.get(i).x++;
      }
      break;
    case 2:
      if (Active.get(i).y == Grid.get(0).size()-1) {
        Active.get(i).y = 0;
        ignore = true;
      } else {
        Active.get(i).y++;
      }
      break;
    case 3:
      if (Active.get(i).x == 0) {
        Active.get(i).x = Grid.size()-1;
        ignore = true;
      } else {
        Active.get(i).x--;
      }
      break;
    }

    if (!ignore) {
      templn.endpt = Grid.get((int)Active.get(i).x).get((int)Active.get(i).y);
    } else {
      templn.ignore = ignore;
    }
    ignore = false;
    ActiveLns.add(templn);
  }
}