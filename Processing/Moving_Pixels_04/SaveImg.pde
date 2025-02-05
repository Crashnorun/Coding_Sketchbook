import processing.video.*;

class SaveImg implements Runnable {
  //----GLOBAL VARIABLES---------------------------------------------------------------------------------
  String path; // path here image will be saved
  Capture cam;
  int w, h;
  boolean camAvailable;
  PImage currentImg;
  //----GLOBAL VARIABLES---------------------------------------------------------------------------------


  SaveImg(PApplet app, int W, int H, String PATH) {
    path = PATH;
    w = W;
    h = H;

    String[] cameras = Capture.list(); // get camera list

    if (cameras == null) { // if the camera is nothing
      println("FAILED TO RETRIEVE LIST OF AVAILABLE CAMERAS");
      cam = new Capture(app, w, h);
    } else {

      if (cameras.length == 0) { // if there are no cameras
        println("THERE ARE NO CAMERAS AVAILABLE");
        exit();
      } else { // if there are cameras
        println("AVAILABLE CAMERAS: ");
        for (int i = 0; i < cameras.length; i++) {
          println(cameras[i]);
        } //close for

        //cam = new Capture(app, cameras[172]);                                    // get the first camera
        //cam = new Capture(app, w, h, 30);
        //cam = new Capture(app, w, h, "name=Logitech HD Pro Webcam C910,size=640x480,fps=5");
        cam = new Capture(app, cameras[0]);
        delay(1000);
        cam.start(); // start the camera
        delay(1000);
        println("Here = " + cam.available());
        //println("Selected camera = " + cameras[172]);
        println("CAMERA HAS STARTED");
      } //close if
    }
  } // close constructor

  //----RUN THREAD---------------------------------------------------------------------------------
  // NAME is the name of the file
  void run(int NAME) {
    SaveImages(NAME);
  }
  //----RUN THREAD---------------------------------------------------------------------------------

  //----RUN THREAD---------------------------------------------------------------------------------
  void run() {
    //empty method
  }
  //----RUN THREAD---------------------------------------------------------------------------------
} // close class
