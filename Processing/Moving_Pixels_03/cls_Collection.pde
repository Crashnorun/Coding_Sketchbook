

class cls_Collection implements Runnable {

  //----GLOBAL VARIABLES----
  cls_Group RGroup, GGroup, BGroup, WGroup ;
  PImage myImg;
  cls_Pxl[] pxls = {
  };          // collection of pixels
  //----GLOBAL VARIABLES----


  //----CONSTRUCTOR------------------------------------------------------------------
  cls_Collection() {
    println("EMPTY CONSTRUCTOR");
  }
  //----CONSTRUCTOR------------------------------------------------------------------


  //----CONSTRUCTOR------------------------------------------------------------------
  cls_Collection(PImage img) {

    RGroup = new cls_Group("R");
    GGroup = new cls_Group("G");
    BGroup = new cls_Group("B");
    WGroup = new cls_Group("W");

    println("CREATING COLLECTION: pixels.length = " + img.pixels.length);
    myImg = img;
    loadPixels();
    pxls = new cls_Pxl[img.pixels.length];

    for (int i = 0; i < img.pixels.length; i++) {
      int x = i % myImg.width;                                              // get the X value
      int y = i / myImg.width;                                              // get the Y value
      color c = img.pixels[i];                                              // get the color
      cls_Pxl newPix = new cls_Pxl(x*4, y*4, c);                            // populate new cls_Pxl
      pxls[i] = newPix;                                                     // save new pixel
      GroupPxls(pxls[i]);                                                   // find pixel group
      //println("X = " + newPix.posX + " - Y = " + newPix.posY + " - COLOR = " + newPix.col + " Group = " + newPix.groupName);
    }  //close for

    //println("RGroup: " + RGroup.Length + " GGroup: " + GGroup.Length + " BGroup: " + BGroup.Length + " WGroup: " + WGroup.Length);

    RGroup.FindCent();                                                    // find cents oe each group
    GGroup.FindCent();
    BGroup.FindCent();
    WGroup.FindCent();

    
    for (int i = 0; i < pxls.length; i++) {                            // find length from cent
      if (pxls[i].groupName == "W") {
        pxls[i].FindLength(WGroup.cent);
        pxls[i].velocity= new PVector(WGroup.cent.x, WGroup.cent.y);
      } else if (pxls[i].groupName == "R") {
        pxls[i].FindLength(RGroup.cent);
        pxls[i].velocity= new PVector(RGroup.cent.x, RGroup.cent.y);
      } else if (pxls[i].groupName == "G") {
        pxls[i].FindLength(GGroup.cent);
        pxls[i].velocity= new PVector(GGroup.cent.x, GGroup.cent.y);
      } else if (pxls[i].groupName == "B") {
        pxls[i].FindLength(BGroup.cent);
        pxls[i].velocity= new PVector(BGroup.cent.x, BGroup.cent.y);
      }
    }
      
  }    //close constructor
  //----CONSTRUCTOR------------------------------------------------------------------


  //----CREATE GROUPS------------------------------------------------------------------
  // group each pixel
  void GroupPxls(cls_Pxl Pixel) {

    if (Pixel.groupName == "W") {
      WGroup.Append(Pixel);
    } else if (Pixel.groupName == "R") {
      RGroup.Append(Pixel);
    } else if (Pixel.groupName == "G") {
      GGroup.Append(Pixel);
    } else if (Pixel.groupName == "B") {
      BGroup.Append(Pixel);
    } else {
      println("PIXEL NOT GROUPED");
    }
    // find the goups
  }
  //----CREATE GROUPS------------------------------------------------------------------


  //----UPDATE INFO------------------------------------------------------------------
  void Update() {
    // WGroup.FindCent();
    // RGroup.FindCent();
    // GGroup.FindCent();
    // BGroup.FindCent();
  }
  //----UPDATE INFO------------------------------------------------------------------

  //----------------------------------------------------------------------
  void Test() {

    //  println("Pxls.length = " + pxls.length);
    //background(0);
    for (int i = 0; i <pxls.length; i++) {

      //if (pxls[i].col <= -15000000) {
      if (pxls[i].R > 150 && pxls[i].G > 150 && pxls[i].B > 150) {
        println("here");
        //draw a point and move it
        //fill(pxls[i].col);
        fill(255, 0, 0);
        stroke(255, 0, 0);
        rect(pxls[i].posX, pxls[i].posY, 1, 1);
      }
    }
  }
  //----------------------------------------------------------------------





  //----RUN THREAD----
  void run() {
    //empty method
  }  //----RUN THREAD----
}    //close class

