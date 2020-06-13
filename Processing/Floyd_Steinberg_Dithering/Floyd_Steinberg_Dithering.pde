

PImage img;
int imgWidth, imgHeight;


void settings() {
  img = loadImage("IMG_2171_A.jpg");           // load image
  imgWidth = img.width;                        // get image dimensions
  imgHeight = img.height;
  img.resize(imgWidth/10, 0);                  // scale image down
  imgWidth = img.width;                        // get new image dimensions
  imgHeight = img.height;

  size(imgWidth, imgHeight*2);                 // set canvas
}

void setup() {
  
  image(img,0,0);
  
}



void draw() {
}
