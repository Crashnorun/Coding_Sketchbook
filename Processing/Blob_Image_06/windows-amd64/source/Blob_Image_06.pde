import processing.video.*;
import blobDetection.*;
import processing.opengl.*;

//----GLOBAL VARIABLES----
Capture video;
BlobDetection theBlobDetection;
PImage img;
PImage img2;
PImage img3;

int blobCount = 0;
int imgCount = 0;
int seqCount = 0;
color c = color(0, 0, 0, 5);
float threshold;

String path;
//----GLOBAL VARIABLES----


//----SETUP----
void setup() {
  path = sketchPath("");
  CreateFolders(path + "Cam_Images");
  CreateFolders(path + "Blob_Images");
  CreateFolders(path + "Sequence_Images");

  //size(1280, 960, P2D);
  //size(1280, 720, P2D);
  size(1920, 1080, P2D);
  
  frameRate(9);
 
  theBlobDetection = new BlobDetection(width, height);
  theBlobDetection.setPosDiscrimination(true);
  
  background(0);
  smooth();
  CameraInfo();
  
  //video = new Capture(this, width, height);
  //video = new Capture(this, Capture.list()[9]);
  //video = new Capture(this, width, height, "name=Logitech HD Pro Webcam C910,size=1280x720,fps=5");
  video = new Capture(this, width, height, "Integrated Camera #1");
  video.start();
  println("CAMERA STARTED");
}    // close setup
//----SETUP----



//----DRAW----
void draw() {
  if (video.available()) {

    // ---- READ CAMERA ----
    if (second() % 5 ==0) {                                           // every 5 seconds save the image

      video.read();                                                   // read the web cam
      image(video, 0, 0);                                             // create an image from the camera
      video.save(path + "\\Cam_Images\\Cam_" + imgCount + ".jpg");        // save camera image
      img2 = loadImage(path + "\\Cam_Images\\Cam_" + imgCount + ".jpg");  // load the saved image
      imgCount++;

      if (imgCount >= 100) imgCount = 0;
    }
    // ---- READ CAMERA ----


    // ---- DRAW BLOBS ----
    if (img2 != null) {                                              // when there is an image saved
      fill(c);
      rect(0, 0, width, height);                                     // redraw the background

      theBlobDetection.setThreshold(threshold);
      theBlobDetection.computeBlobs(img2.pixels);                  // computes the blobs in the image
      drawBlobsAndEdges(false, true, 255);                         // first bolean is rectangle, second bolean is blob edge
    }
    // ---- DRAW BLOBS ----


    // ---- SAVE BLOBS ----
    if (threshold <= 0) {                                          // counter for threshold
      // println("SAVING IMAGE: " + path + "\\Blob_Images\\Blob_" + blobCount + ".jpg");
      save(path + "\\Blob_Images\\Blob_" + blobCount + ".jpg");
      blobCount++;
      threshold= 0.95;
    } else {
      threshold = threshold - 0.0125;
    }
    // ---- SAVE BLOBS ----


    // ---- SAVE OUTLINES ----
    if (second() % 10 == 0) {                                      // save the blob image every 10
      //println("SAVING IMAGE: " + path + "\\Sequence_Image\\Image_" + count + ".jpg");
      save(path + "\\Sequence_Images\\Seq_" + seqCount + ".jpg");

      seqCount++;
      if (seqCount >=400) {                          // save 400 final images for record keeping
        seqCount = 0;
      }
    }
    // ---- SAVE OUTLINES ----
    //
    //
  }    // close IF available
}    // close draw
//----DRAW----




//----BLOB EDGES----
void drawBlobsAndEdges(boolean drawBlobs, boolean drawEdges, int MN)
{
  noFill();
  //fill(threshold);
  Blob b;
  EdgeVertex eA, eB;
  stroke(MN);


  for (int n = 0; n < theBlobDetection.getBlobNb (); n++) {  // theBlobDetection.getBlobNb - returns the nuber of blobs in an image
    b=theBlobDetection.getBlob(n);                           // returns the blob whose index is n in the list of blobs

    if (b!=null) {
      // Edges
      if (drawEdges) {
        strokeWeight(0.5);

        for (int m=0; m<b.getEdgeNb (); m= m + 1) {
          eA = b.getEdgeVertexA(m);                          // each edge of a blob is made of two points and a line
          eB = b.getEdgeVertexB(m);

          if (eA !=null && eB !=null)
            line(eA.x*width, eA.y*height, eB.x*width, eB.y*height);
        }
      }
      // Blobs
      if (drawBlobs) {
        strokeWeight(0.5);
        stroke(255, 0, 0);
        rect(
          b.xMin*width, b.yMin*height,
          b.w*width, b.h*height
          );
      }
    }
  }
}//----BLOB EDGES----






//----CAMERA INFO----
//this prints out the information for the web cam
void CameraInfo() {
  //Capture cam;
  String[] cameras = Capture.list();

  for (int i = 0; i < cameras.length; i++) {
    println(cameras[i]);
  }
}//----CAMERA INFO----



//-------------------------------------------------------------------------------
// Create the appropiate file paths
private void CreateFolders(String FilePath) {

  File folder = new File(FilePath);
  if (!folder.exists()) {                            //check if file path exists
    println("creating directory: " + FilePath);
    folder.mkdir();                                  //make the file path
  } else {
    println("Path: '" + FilePath + "' already exists");
  }
}
