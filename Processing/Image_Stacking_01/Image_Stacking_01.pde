// load jpgs
// resize images
// find the brightest pixels
// make new image

String Folder = "F:\\Desktop\\Hold\\camera images\\2020_10_09_Pennsylvania_Sky\\";
int imgStart = 4478;
int totImgs = 79;
ArrayList<PImage> Imgs = new ArrayList<PImage>();
int ImgWidth, ImgHeight;



void settings() {

  // load jpgs
  println("Loading Images");
  for (int i = imgStart; i < imgStart + totImgs; i++) {
    PImage img = loadImage( Folder + "IMG_" + i + "_A.jpg");
     img.resize(2000, 0);
    img.loadPixels();
    Imgs.add(img);
  }

  ImgWidth = Imgs.get(0).width;
  ImgHeight = Imgs.get(0).height;
  println("Width: " + ImgWidth + " | Height: " + ImgHeight + " | Total Pixels: " + ImgWidth * ImgHeight);
  size(ImgWidth, ImgHeight);
}

void setup() {

  println("Creating Image");
  PImage newImg = createImage(ImgWidth, ImgHeight, RGB);
  newImg.loadPixels();


  for (int i = 0; i < newImg.pixels.length; i++) {

    float b = Float.MAX_VALUE;
    color c = Imgs.get(0).pixels[i];

    for (int j = 1; j < Imgs.size(); j++) {
      float imgB = saturation(Imgs.get(j).pixels[i]);
      if (imgB > b) {
        c =  Imgs.get(j).pixels[i];
        b = imgB;
      }
    }
    newImg.pixels[i] = c;
  }

  image(newImg, 0, 0);
  println("DONE");
}

void draw() {
}
