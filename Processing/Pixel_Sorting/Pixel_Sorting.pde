import java.util.Collections; //<>// //<>//

String imageName = "IMG_2725_A.jpg"; 
PImage img, newImg;
ArrayList<Pix> currentPix, newPix;
int imgWidth, imgHeight;
int index;

/**
 Load the image, resize it, set the canvas width and height
 */
void settings() {
  println("Entering SETTINGS");
  img = loadImage(imageName);                    // load image
  img.resize(300, 0);                            // resize image
  imgWidth = img.width;
  imgHeight = img.height;

  size(imgWidth*2, imgHeight);                    // set canvas size
}


/**
 Create new image and set all pixels to black
 */
void setup() {
  println("Entering SETUP");
  
  image(img, 0, 0);

  newImg = createImage(imgWidth, imgHeight, RGB);  // create new image
  newPix = new ArrayList<Pix>();

  for (int i = 0; i < img.pixels.length; i++) {
    newImg.pixels[i] = 0;                          // set default pixels to be black

    newPix.add(new Pix(img.pixels[i], i%((i%imgWidth)+1), i/imgWidth, i));
  }
  image(newImg, imgWidth, 0);

  Collections.sort(newPix);
}


/**
 Draw each row of pixels
 */
void draw() {

  if (index < newImg.pixels.length) {
    for (int i = 0; i < imgWidth; i++) {
      newImg.pixels[index] = newPix.get(index).col;
      //newImg.pixels[index] = img.pixels[index];
      index++;
    }

    newImg.updatePixels();
    image(newImg, imgWidth, 0);
  }
}
