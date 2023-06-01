import processing.video.*;

Capture video;
PImage imgCam;
int count = 0;

void setup() {
  CameraInfo();
    //size(1920, 1080, P2D);
    size(640, 480, P2D);

  frameRate(30);
  video = new Capture(this, width, height, 30);                                      // Uses the default video input, see the reference if this causes an error
  video.start();

  background(0);
  smooth();

  exit();
  imgCam = createImage(width, height, RGB);
}


void draw() {

  image(video, 0, 0);
  video.save("/z_cam/" + count + ".jpg");                                                  //save the image

  /*if (count % 5 == 0) {
   imgCam = video;
   imgCam.save("/z_cam/img_" + count + ".jpg");                                                  //save the image
   //video.save("/z_cam/vid_" + count + ".jpg");                                                  //save the video
   }
   count++;*/
}


// this is an event that reads the image once it's available
// the camera may have a different framerate then the processing sketch
// ex. if the skecth is 60fps and the camera is 30fps, then the read() method
// would be called multiple times for no reason.
void captureEvent(Capture c) {
  c.read();
  // c.save("/z_cam/" + count + ".jpg");                                                  //save the image

  count++;

  //imgCam = createImage(width, height, RGB);
  //imgCam = c;
}

//----CAMERA INFO----
//this prints out the information for the web cam
void CameraInfo() {
  //Capture cam;
  String[] cameras = Capture.list();

  for (int i = 0; i < cameras.length; i++) {
    println(cameras[i]);
  }
}//----CAMERA INFO----
