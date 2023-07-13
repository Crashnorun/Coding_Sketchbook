import processing.video.*;

class SaveImg implements Runnable
{

  //----GLOBAL VARIABLES---------------------------------------------------------------------------------
  String path;             // path here image will be saved
  Capture cam;              
  int w, h;
  boolean camAvailable;
  PImage currentImg;
  //----GLOBAL VARIABLES---------------------------------------------------------------------------------


  //----CONSTRUCTOR---------------------------------------------------------------------------------
  SaveImg(PApplet app, int W, int H, String PATH) {
    path = PATH;
    w = W;
    h = H;

    String[] cameras = Capture.list();                                         // get camera list

    if (cameras == null) {                                                   // if the camera is nothing
      println("FAILED TO RETRIEVE LIST OF AVAILABLE CAMERAS");
      cam = new Capture(app, w, h);
    } else {

      if (cameras.length == 0) {                                                 // if there are no cameras
        println("THERE ARE NO CAMERAS AVAILABLE");
        exit();
      } else {                                                                   // if there are cameras
        println("AVAILABLE CAMERAS: ");
        for (int i = 0; i < cameras.length; i++) {                        
          println(cameras[i]);
        }  //close for

        //cam = new Capture(app, cameras[172]);                                    // get the first camera
        //cam = new Capture(app, w, h, 30);
        //cam = new Capture(app, w, h, "name=Logitech HD Pro Webcam C910,size=640x480,fps=5");
        cam = new Capture(app, cameras[1]);
        delay(1000);
        cam.start();                                                             // start the camera
        delay(1000);
        println("Here = " + cam.available());
        //println("Selected camera = " + cameras[172]);
        println("CAMERA HAS STARTED");
      }                                                                          //close if
    }
  }
  //----CLOSE CONSTRUCTOR---------------------------------------------------------------------------------


  //----IS CAMERA AVAILABLE---------------------------------------------------------------------------------
  boolean CamAvailable() {
    if (cam.available() == true) {
      camAvailable = true;
      return true;
    } else {
      return false;
    }
  }  
  //----CLOSE IS CAMERA AVAILABLE---------------------------------------------------------------------------------


  //----SAVE IMAGES---------------------------------------------------------------------------------
  void SaveImages(int NAME) {
    if (camAvailable == true) {
      cam.read();                                                            // read the camera
      currentImg = cam;                                                      // set current image
      try {
        currentImg.save("Cam_Images\\" + NAME + ".jpg");                     // save image to folder
      }
      finally {
      }
    }
  }  
  //----SAVE IMAGES---------------------------------------------------------------------------------


  //----SHOW IMAGE ON SCREEN---------------------------------------------------------------------------------
  void ShowImage() {
    set(0, 0, currentImg);
  }  
  //----SHOW IMAGE ON SCREEN---------------------------------------------------------------------------------


  //----SHOW PIXELATED IMAGE ON SCREEN---------------------------------------------------------------------------------
  void ShowImage2() {
    loadPixels();

    for (int i = 0; i < currentImg.pixels.length; i++) {
      int x = i % (w);                                                    // get the X value
      int y = i / (w);                                                    // get the Y value

      pushMatrix();
      translate(x*4, y*4);
      fill(currentImg.pixels[i]);
      noStroke();
      rect(0, 0, 4, 4);
      popMatrix();
    }
  }
  //----SHOW IMAGE ON SCREEN---------------------------------------------------------------------------------


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
} //----CLOSE CLASS---------------------------------------------------------------------------------
