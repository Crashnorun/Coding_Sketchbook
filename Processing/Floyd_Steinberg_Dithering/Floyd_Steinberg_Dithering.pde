

PImage img;
int imgWidth, imgHeight;


void settings() {
  img = loadImage("IMG_2171_A.jpg");           // load image
  imgWidth = img.width;                        // get image dimensions
  imgHeight = img.height;
  img.resize(imgWidth/5, 0);                  // scale image down
  imgWidth = img.width;                        // get new image dimensions
  imgHeight = img.height;

  size(imgWidth, imgHeight*2);                 // set canvas
}

void setup() {
  // img.filter(GRAY);
  image(img, 0, 0);
}



void draw() {

  loadPixels();
  for (int y = 0; y < img.height-1; y++) {
    for (int x = 0; x < img.width-1; x++) {

      int i = index(x, y);
      color col = img.pixels[i];

      float r = red(col);
      float g = green(col);
      float b = blue(col);

      int factor = 1;

      int oldR = round(factor * r / 255) * (255 / factor);
      int oldG = round(factor * g / 255) * (255 / factor);
      int oldB = round(factor * b / 255) * (255 / factor);
      img.pixels[i] = color(oldR, oldG, oldB);

      float errR = r - oldR;
      float errG = g - oldG;
      float errB = b - oldB;

      int index = index(x+1, y);
      color c = img.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 7/16.0;
      g = g + errG * 7/16.0;
      b = b + errB * 7/16.0;
      img.pixels[index] = color(r, g, b);


      index = index(x - 1, y + 1);
      c = img.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 3/16.0;
      g = g + errG * 3/16.0;
      b = b + errB * 3/16.0;
      img.pixels[index] = color(r, g, b);


      index = index(x, y + 1);
      c = img.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 5/16.0;
      g = g + errG * 5/16.0;
      b = b + errB * 5/16.0;      
      img.pixels[index] = color(r, g, b);


      index = index(x + 1, y + 1);
      c = img.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 1/16.0;
      g = g + errG * 1/16.0;
      b = b + errB * 1/16.0;    
      img.pixels[index] = color(r, g, b);
    }
  }
  img.updatePixels();
  image(img, 0, img.height);
}


int index(int x, int y) {
  int index = x + (y * img.width);
  return index;
}
