
// read camera
// save image
// get pixels from image
// make cls_pxl list
// start moving pixels


//----GLOBAL VARIABLES------------------------------------------------------------------
import processing.video.*;
Capture cam;                     // gets the web cam
SaveImg cam1;
cls_Collection collection;
int imgCount;
PImage currentImg ;              // saves the current image from the web cam
Thread t1, t2;                   // used for multi threading
boolean bool;
String path;                     // this will hold the file path of the sketch
//----GLOBAL VARIABLES------------------------------------------------------------------


//----SET UP------------------------------------------------------------------
void setup() {
  bool = false;
  frameRate(30);
  path = sketchPath("");                                                      // get the file path of the sketch
  CreateFolder(path + "Cam_Images");                                          // create file path for camera images
  CreateFolder(path + "Pixel_Images");                                        // create file path for pixel images
  //println("SKETCH PATH: " + path);

  background (0);                                                             // set background to black
  size (640, 480);                                                            // set size
  //size(800, 600);
  imgCount = 0;
  cam1 = new SaveImg(this, width/4, height/4, path + "Cam_Images");
  t1 = new Thread(cam1);                                                     // put the camera on t1
  t1.start();
  cam1.run();

  collection = new cls_Collection();
  t2 = new Thread(collection);
  t2.start();
  collection.run();
  println("EXITED SETUP");
  println("Camera Available? = " + cam1.CamAvailable());
  if (cam1.CamAvailable() == false) {
    println("CAMERA NOT AVAILABLE FOR SOME REASON");
    exit();
  }
}  // close setup
//----SET UP------------------------------------------------------------------



//----DRAW------------------------------------------------------------------
void draw() {

  if (cam1.CamAvailable()==true) {

    int time = second();                                                 // get the second number from the time
    if (time % 59 == 0) {                                                // every 10 seconds
      bool = false;
      cam1.SaveImages(time);                                             // save image to folder
      currentImg = cam1.currentImg;
      //cam1.ShowImage();                                                // set image to display on screen
      cam1.ShowImage2();                                                 // set image to display on screen

      collection = new cls_Collection(currentImg);                       // create new collection of pxls
    }   //close IF

    // println("TIME: " + time + " | TIME % 59 + " + time % 59);


    if (time % 59 == 3) {
      bool = true;
    }

    if (bool == true) {
      background(0);
      //println(bool);

      for (int i = 0; i < collection.pxls.length; i++) {                  // move pixels
        if (collection.pxls[i].groupName == "W") {
          collection.pxls[i].MovePixel(collection.WGroup.cent);
          //println(collection.WGroup.cent.x + " , " + collection.WGroup.cent.y);
        } else if (collection.pxls[i].groupName == "R") {
          collection.pxls[i].MovePixel(collection.RGroup.cent);
        } else if (collection.pxls[i].groupName == "G") {
          collection.pxls[i].MovePixel(collection.GGroup.cent);
        } else if (collection.pxls[i].groupName == "B") {
          collection.pxls[i].MovePixel(collection.BGroup.cent);
        }

        // SOMEWHERE THE CENTER VALUES ARE CHANGING 
        //println(collection.WGroup.cent.x + " , " + collection.WGroup.cent.y);
      }

      if (second() % 2 == 0) {
        save(path + "Pixel_Images/" + imgCount + ".jpg");            // save image
        imgCount++;
      }

      if (imgCount > 500) {
        imgCount = 0;
      }
    }
  }      //close IF camera is availale

  System.gc();      // house cleaning
}    //close draw
//----DRAW------------------------------------------------------------------



//----CREATE FOLDER DIRECTORY------------------------------------------------------------------
// Creates a folder path
// Requires a string
// http://docs.oracle.com/javase/7/docs/api/java/io/File.html
private void CreateFolder(String FilePath) {

  File folder = new File(FilePath);                                // create a new file
  if (!folder.exists()) {                                           // if path doesn't exist, create it
    println("CREATING DIRECTORY: " + FilePath);
    try {
      folder.mkdir();                                              // make directory
    } 
    catch (SecurityException exe) {                               // catch any exceptions
      println("COULDN'T MAKE FOLDER DIRECTORY: " + FilePath);
      println(exe);
    }
  } else {                                                          // if path exists
    println("PATH: '" + FilePath + "' ALREADY EXISTS");
  }  // close if
}
//----CREATE FOLDER DIRECTORY------------------------------------------------------------------



void keyPressed() {
  println("Writing values");
  PrintWriter output = createWriter("Values.txt");
  for (int i = 0; i < collection.pxls.length; i++) {
    output.println(collection.pxls[i].posX + "," + collection.pxls[i].posY  + "," + collection.pxls[i].groupName  + "," + collection.pxls[i].col);
  }
  output.flush();
  output.close();
  println("Written file");
}


void ExportVals() {
  PrintWriter output = createWriter("Values.txt");
  for (int i = 0; i < collection.pxls.length; i++) {
    output.println(collection.pxls[i].posX + "," + collection.pxls[i].posY  + "," + collection.pxls[i].col);
  }
}
