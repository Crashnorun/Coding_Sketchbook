// --get image
// --draw canvas bigger then image
// --display image
// --calculate each pixel color
// --catalogue each pixel color
// draw a rectangle for the top 10 similar colors.
/*
 list of all unique colors save all the unique colors
 list of lists
 color - rgb, list of locations, count 
 */

import java.io.File;
import java.util.Collections;
//import java.awt.Color;
//import java.lang.Object;


//----GLOBAL VARIABLES-------------------------------------
int Width, Height;                                // height and width of the sketch
boolean debug = false;
PImage image;
IntList Colors;
//ArrayList<Color > Colors;
ArrayList<cls_Color> UniqueColors;
int circleCount = 20;
int colorTolerance = 0;
//----GLOBAL VARIABLES-------------------------------------


void setup() {
  background(255);
  noStroke();

  Colors = new IntList();
  UniqueColors = new ArrayList<cls_Color>();

  image(image, 0, 0);                                  // display image
  image.loadPixels();                                  // get the image pixels

  for (int i = 0; i < image.pixels.length; i++) {      
    color col = image.pixels[i];                      // get the current pixel color
    if (!Colors.hasValue(col)) {                      // does this color exist already

      // compare against tolerance
      boolean skip = false;
      for (int j = 0; j < Colors.size(); j++) {
        int val = col - Colors.get(j);
        if (abs(val) < colorTolerance) {
          skip = true;
          break;
        }
      }

      if (!skip) {
        Colors.append(col);                              // save the color
        cls_Color tempCol = new cls_Color(col, i/Width, i/Height);          // save the color
        UniqueColors.add(tempCol);
      }
    } else {                                          // if color does exist, add count
      int index = Colors.index(col);                  // get the index of the duplicate value
      UniqueColors.get(index).AddLocation( i/Width, i/Height);
    }

    if (debug && i % Width == 0) {
      println("Row: " + i / Width);
    }
  }

  println("Sorting");
  Collections.sort(UniqueColors);
  println("Finished Sorting");
  DrawCircles();


  if (debug) {

    println("Unique Colors: " + Colors.size());
    println("Number of pixels: " + image.pixels.length);

    for (int i = 0; i < UniqueColors.size(); i++) {
      println("UniqueColor Amount: " + UniqueColors.get(i).Locations.size() + " Color: " + UniqueColors.get(i).Color +
        " R: " + UniqueColors.get(i).Red);
    }
  }
}
//-----------------------------------------



void draw() {
}
//-----------------------------------------


void settings() {
  CreateFolderPath();

  image.resize(500, 0);
  Width = image.width;
  Height = image.height;
  size(Width, Height + (Width / 10));
}
//-----------------------------------------


void DrawCircles() {
  int radius = Width / circleCount;                             // get center point

  //Collections.reverse(UniqueColors);
  for (int i = 0; i < circleCount; i++) {
    int x = radius/2 + (i * radius);
    int y = Height + radius/2;
    int index = UniqueColors.size()/ circleCount;
    //fill(UniqueColors.get(i * index).Color);
    fill(UniqueColors.get(i).Color);
    ellipse(x, y, radius, radius);
  }
}
//-----------------------------------------

void CreateFolderPath() {
  String SketchName = getClass().getSimpleName();         // get the sketch name
  String SketchPath = sketchPath(SketchName);             // get the sketch file path
  File path = new File(SketchPath);
  String parent = path.getParent();                       // the sketch folder path

  String DataFolder = "data";                             // folder name for data files  
  String directoryName = parent + "\\" + DataFolder;      // data directory

  File directory = new File(directoryName);  
  if (! directory.exists()) {                            // does the directory exist
    boolean makeDirectory = directory.mkdir();            // make the data directory
    if (makeDirectory) {      
      println("Data Directory Created");
    } else {
      println("COULD NOT CREATE DATA DIRECTORY");
    }
  } else {
    println("Data Directory Already Exists");
  }


  File[] files = directory.listFiles();                  // get the list of files in the directory
  if (files.length> 0) {
    image = loadImage(files[0].getName());             // load the image
  }  


  if (debug) {
    println("Sketch Name is: " + SketchName);
    println("Sketch Path is: " + SketchPath);
    println("Sketch Parent Path: " + parent);
    println("Data directory: " + directoryName);
    println("Number of files in the directory: " + files.length);
    println("Image file name: " + files[0].getName());
  }
}
//-----------------------------------------