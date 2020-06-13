

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
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {

      int i = index(x, y);
      color col = img.pixels[i];

      float r = red(col);
      float g = green(col);
      float b = blue(col);

      int factor = 4;

      int newR = round(factor * r / 255) * (255 / factor);
      int newG = round(factor * g / 255) * (255 / factor);
      int newB = round(factor * b / 255) * (255 / factor);
      img.pixels[i] = color(newR, newG, newB);

      float errR = r - newR;
      float errG = g - newG;
      float errB = b - newB;

      img.pixels[index(x+1, y)] =
        img.pixels[index(x-1, y+1)] =
        img.pixels[index(x, y+1)] = 
        img.pixels[index(x+1, y+1)] =
    }
  }
  img.updatePixels();
  image(img, 0, img.height);
}


int index(int x, int y) {
  int index = x + (y * img.width);
  return index;
}
