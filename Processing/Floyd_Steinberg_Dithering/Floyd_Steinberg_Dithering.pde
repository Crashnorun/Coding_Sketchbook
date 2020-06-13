

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

  image(img, 0, 0);
}



void draw() {

  loadPixels();
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      int index = x + (y * img.width);
      color col = img.pixels[index];

      float r = red(col);
      float g = green(col);
      float b = blue(col);

      int newR = round(4 *r / 255) * (255/4);
      int newG = round(4* g / 255) * (255/4);
      int newB = round(4*b / 255) * (255/4);

      img.pixels[index] = color(newR, newG, newB);
    }
  }
  img.updatePixels();
  image(img, 0, img.height);
}
