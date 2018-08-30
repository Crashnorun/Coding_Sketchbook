 //<>// //<>//
/*
1. sukply an image
 2. classify all pixels by color
 3. sort pixels by color
 4. draw the image by the sorted colors
 5. start from lightest to darkest
 5.1 start from darkest to lightest
 */

import java.util.Collections;

PImage img, newImg;
int w, h;
ArrayList<Pixel> myPix;
int count;

void settings() {
  img = loadImage("small.jpg");
  w = img.width;
  h = img.height;
  println("Image Size: width " + w + " | height " + h);

  myPix = new ArrayList<Pixel>();
  newImg = loadImage("small.jpg");
  //newImg = createImage(w, h, RGB);
  newImg.loadPixels();

  for (int i = 0; i < img.pixels.length; i++) {
    int x = i / w;
    int y = i / h;
    Pixel pix = new Pixel(x, y, img.pixels[i]);
    myPix.add(pix);

    // newImg.pixels[i] = color(0 );
    // newImg.updatePixels();
  }

  Collections.sort(myPix);

  size(w, h);
  count = 0;
}

void setup() {
  frameRate(5000);
}



void draw() {
  loadPixels();
  newImg.pixels[count] = myPix.get(count).colLong;
  newImg.updatePixels();
  image(newImg, 0, 0);

  if (count < newImg.pixels.length-1 || count < 0) { 
    count++;
  } else {
    count = 0;
  }
}


void mouseClicked() {
  save("sorted_Image.jpg");
  println("Saved image");
}