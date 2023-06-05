import processing.opengl.*;
import processing.video.*;
import blobDetection.*;



// Variable for capture device
Capture video;
BlobDetection theBlobDetection;
PImage img;
PImage img2;
PImage img3;
int count = 0;
int imgcount = 0;
color c = color(0, 0, 0, 5);
float threshold;

void setup() {

  //size(640*2, 480*2, OPENGL);
  //size(640*2, 480*2, P2D);
  size(1920, 1080, P2D);

  frameRate(30);
  video = new Capture(this, width, height, 30);                                      // Uses the default video input, see the reference if this causes an error
  theBlobDetection = new BlobDetection(width, height);                               //class constructor BlobDection(int, int)
  background(0);
  smooth();
}




void draw() {

  //video.read();
  image(video, 0, 0);
  img = createImage(width, height, RGB);
  img = video;

  theBlobDetection.setPosDiscrimination(true);                                         //this method detects bright(true) or dark(false) blobs
  theBlobDetection.setThreshold(threshold);                                                //defines a threshold, higher value less pixels are selected

  //if ( millis()% 50 == 0) {
  if ( second()%5 == 0) {
    img.save(str(imgcount) + ".jpg");                                                  //save the image
    img2 = loadImage(str(imgcount) + ".jpg");                                          //load the image
    //image(img2,width/2, height);
    imgcount++;                                                                        //counter for image name

    if (imgcount >=100) {                                                              //never let it get above 100
      imgcount = 0;
    }
  }


  if (second() % 20 == 0) {                                                              //save 400 final images for record keeping
    save("Image_" + count + ".jpg");

    count++;
    if (count >=400) {
      count = 0;
    }
  }


  if (img2 != null) {                                                                  //when there is an image saved
    fill(c);
    rect(0, 0, width, height);                                                        //redraw the background

    theBlobDetection.computeBlobs(img2.pixels);                                         //computes the blobs in the image
    drawBlobsAndEdges(false, true, 255);                                                //first bolean is rectangle, second bolean is blob edge
  }


  if (threshold <= 0) {                                                                 //counter for threshold
    threshold= 0.95;
  } else {
    threshold = threshold - 0.0125;
  }
}




void drawBlobsAndEdges(boolean drawBlobs, boolean drawEdges, int MN)
{
  noFill();
  //fill(threshold);
  Blob b;
  EdgeVertex eA, eB;
  stroke(MN);


  for (int n = 0; n < theBlobDetection.getBlobNb(); n++) {                                     //theBlobDetection.getBlobNb - returns the nuber of blobs in an image
    b=theBlobDetection.getBlob(n);                                                               //returns the blob whose index is n in the list of blobs

    if (b!=null) {
      // Edges
      if (drawEdges) {
        strokeWeight(0.5);

        for (int m=0; m<b.getEdgeNb(); m= m + 1) {
          eA = b.getEdgeVertexA(m);                                                            //each edge of a blob is made of two points and a line
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
}


/*void captureEvent(Capture c) {
  c.read();
}*/
