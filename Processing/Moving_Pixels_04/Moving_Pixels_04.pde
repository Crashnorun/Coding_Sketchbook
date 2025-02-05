import processing.video.*;

//----GLOBAL VARIABLES------------------------------------------------------------------
Capture cam;                     // gets the web cam
SaveImg cam1;
// cls_Collection collection;
int imgCount;
PImage currentImg ;              // saves the current image from the web cam
Thread t1, t2;                   // used for multi threading
boolean bool;
String path;                     // this will hold the file path of the sketch
//----GLOBAL VARIABLES------------------------------------------------------------------

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
}


void draw() {
}





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
