

class cls_Pxl {


  //----GLOBAL VARIABLES---------------------------------------------------------------------------------
  color col;
  int R, G, B;
  int colorDelta = 20;
  String groupName;
  int posX;
  int posY;
  PVector location;
  PVector velocity; 
  PVector acceleration;
  float dist;
  //----GLOBAL VARIABLES---------------------------------------------------------------------------------


  //----CONSTRUCTOR------------------------------------------------------------------
  cls_Pxl(int X, int Y, color C) {

    posX = X;
    posY = Y;
    location = new PVector(X, Y);
    col = C;
    ConvertColor();
    FindGroupName();
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
  }  //close constructor
  //----CONSTRUCTOR------------------------------------------------------------------


  //----CONVERT COLOR TO RGB------------------------------------------------------------------
  void ConvertColor() {
    R = int(red(col));
    G = int(green(col));
    B = int(blue(col));
  }
  //----CONVERT COLOR TO RGB------------------------------------------------------------------


  //----MOVE PIXEL------------------------------------------------------------------
  void MovePixel(PVector cent) {
    acceleration = new PVector(cent.x, cent.y);
    acceleration.sub(location);                  //vector from pixel to cent
    acceleration.setMag(0.15);
    //println(acceleration.x + " - " + acceleration.y);

    velocity.add(acceleration);

    /*if ((velocity.x <= 0) || (velocity.x >= width)) {                      // if X or Y value is out of bounds, reverse it
      velocity.x = velocity.x * -1;
    }

    if ((velocity.y <= 0) || (velocity.y >= height)) {
      velocity.y = velocity.y * -1;
    }*/

    location.add(velocity);
    velocity.limit(5);

    /*if ((location.x <= 0) || (location.x >= width)) {                      // if X or Y value is out of bounds, reverse it
      location.x = location.x * -1;
    }

    if ((location.y <= 0) || (location.y >= height)) {
      location.y = location.y * -1;
    }*/

    //println("LOC X = " + posX + " LOC Y = " + posY + " LENGTH = " + dist + " COLOR = " + col);   
    //println("LOC X = " + posX + " LOC Y = " + posY + " | NlocX = " + location.x + " NlocY = " + location.y + " COLOR = " + R  + ", " + G + ", " + B);
    posX = int(location.x);
    posY = int(location.y);


    /*if (groupName == "W") {
      col =  color(255);
    } else if (groupName == "B") {
      col =  color(0, 0, 255);
    } else if (groupName == "G") {
      col =  color(0, 255, 0);
    } else if (groupName == "R") {
      col =  color(255, 0, 0);
    }*/

    fill(col);
    stroke(col);
    
    rect(posX, posY, 4, 4);
  }
  //----MOVE PIXEL------------------------------------------------------------------


  //----GET DIST FROM CENT TO PIXEL------------------------------------------------------------------
  float FindLength(PVector Cent) {
    float x = Cent.x - posX;
    float y = Cent.y - posY;
    PVector temp = new PVector(x, y);
    dist = temp.mag();

    //println( "LOC X = " + posX + " LOC Y = " + posY + " LENGTH = " + dist + " COLOR = " + col);
    return dist;
  }
  //----GET DIST FROM CENT TO PIXEL------------------------------------------------------------------


  //----------------------------------------------------------------------
  void FindGroupName2() {
    int deltaRG = abs(R - G);                  // find pixels of similar color
    int deltaRB = abs(R - B);

    if ((deltaRG <= colorDelta) && (deltaRB <= colorDelta)) {  // if the colors are close to one another
      groupName = "W";
    } else {                                              // colors are not close to one another
      if ((R >= G) && (R >= B)) {            // if red is greater then green and blue
        groupName = "R";
      } else  if ((G > R) && (G >= B)) {     // if green is greater then red and blue
        groupName = "G";
      } else if ((B > R) && (B > G)) {      // if blue is greater then red and green
        groupName = "B";
      }
     // println("DELTARG: " + deltaRG + " DELTARB: " + deltaRB + " R: " + R + " G: " + G + " B: " + B + " GROUPNAME: " + groupName);
    }
  }    //close groupname
  //----------------------------------------------------------------------



  void FindGroupName3() {

    int deltaRG = abs(R - G);                  // find pixels of similar color
    int deltaRB = abs(R - B);
    float avg = (R+G+B)/3;

    if (avg <= colorDelta) {   // || (R == G && R ==B)) {    //if average below threshold or grey
      groupName = "W";
    } else {
      groupName = "R";
    }
  }








  //----------------------------------------------------------------------
  void FindGroupName() {
    int deltaRG = abs(R - G);                  // find pixels of similar color
    int deltaRB = abs(R - B);
    float avg = (R+G+B)/3;

    if (avg <= colorDelta) {
      groupName = "W";
    } else {

      if (R == G && R == B) {              // if all three values are the same
        groupName = "W";                   // group white
      } else {
        if (R >= avg && G >= avg) {        // if r and g are above average
          if (R > G) {
            groupName = "R";
          } else if (G > R) {
            groupName = "G";
          } else {
            groupName = "G";
          }
        } else if (R >= avg && B >= avg) {    // if r and b are above average
          if (R > B) {
            groupName = "R";
          } else if (B > R) {
            groupName = "B";
          } else {
            groupName = "B";
          }
        } else if (B >= avg && G >= avg) {
          if (B > G) {
            groupName = "B";
          } else if (G>B) {
            groupName = "G";
          } else {
            groupName = "G";
          }
        } else if (R >= avg) {
          groupName = "R";
        } else if (G >= avg) {
          groupName = "G";
        } else if (B >= avg) {
          groupName = "B";
        } else {
          groupName  = "W";
        }
      }
    }
    //print(groupName + " ");
    //println(groupName);
    //println("AVG: " + avg + " R: " + R + " G: " + G + " B: " + B + " GROUPNAME: " + groupName);
    if (groupName ==null) {
      println("PIXEL DOES NOT HAVE A GROUP NAME: AVG: " + avg + " R: " + R + " G: " + G + " B: " + B + " GROUPNAME: " + groupName);
    }
  }    //close groupname
  //----------------------------------------------------------------------
}  //close class