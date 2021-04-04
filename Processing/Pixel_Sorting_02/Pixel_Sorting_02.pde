import java.util.Collections; //<>// //<>//

int gridSize = 5;
String imageName = "IMG_2725_A.jpg"; 
PImage img, newImg;
ArrayList<Pix> newPix;
int imgWidth, imgHeight;
int index;
int[] xVals, yVals;

/**
 Load the image, resize it, set the canvas width and height
 */
void settings() {
   
  println("Entering SETTINGS");
  img = loadImage(imageName);                    // load image
  img.resize(500, 0);                            // resize image
  imgWidth = img.width;
  imgHeight = img.height;

  size(imgWidth*2, imgHeight);                    // set canvas size
}


/**
 Display original image.
 Create new image and set all pixels to black
 Sort pixels
 */
void setup() {
  println("Entering SETUP");

  image(img, 0, 0);

  xVals = CalcGrid(imgWidth);
  yVals = CalcGrid(imgHeight);

  newImg = createImage(imgWidth, imgHeight, RGB);  // create new image
  newPix = new ArrayList<Pix>();


  for (int i = 0; i < img.pixels.length; i++) {
    newImg.pixels[i] = 0;                          // set default pixels to be black

    newPix.add(new Pix(0, i%((i%imgWidth)+1), i/imgWidth, i));
  }

  for (int i = 0; i < yVals.length-1; i++) {
    for (int j = 0; j < xVals.length-1; j++) {

      // make a temp array
      ArrayList<Pix> tempPix= new ArrayList<Pix>();

      for (int y = yVals[i]; y < yVals[i+1]; y++) {
        for (int x = xVals[j]; x < xVals[j+1]; x++) {
          int index = x + (y * imgWidth);
          tempPix.add(new Pix(img.pixels[index], x, y, index));
        }
      }

      Collections.sort(tempPix);

      for (int k = 0; k < tempPix.size(); k++) {
        //int index =k%gridSize + ((int)(k/gridSize) * imgWidth);
        int row =  ((int)(k/gridSize) + yVals[i]) * imgWidth;
        int col = k % gridSize + xVals[j];
        int index = row + col;
        newPix.set(index, tempPix.get(k));
      }

      tempPix.clear();
    }
  }

  image(newImg, imgWidth, 0);

  //Collections.sort(newPix);
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


/*
Take the width of the image and find 
 all the index values for each cell
 */
int[]  CalcGrid(int imgDimension) {
  int numCells =  ceil(((float)imgDimension/gridSize)+1) ;
  int pixCount = imgDimension/ (numCells-1);
  int[] vals = new int[numCells];
  int count = 0;
  println("Number of Cells: " + numCells);

  /*for (int i = 0; i <= imgDimension; i+=gridSize) {
    vals[count] =  i;
    count++;
  }*/
  
   for (int i = 0; i < vals.length; i++) {
    vals[count] =  i * pixCount;
    count++;
  }

  return vals; //<>//
}
