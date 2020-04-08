// --get image //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
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
import java.util.Comparator;
//import java.awt.Color;
//import java.lang.Object;


//----GLOBAL VARIABLES-------------------------------------
int Width, Height;                                // height and width of the sketch
boolean debug = false;
PImage image;
String FileName;
IntList Colors;
//ArrayList<Color > Colors;
ArrayList<cls_Color> UniqueColors;
int circleCount = 15;
int radius;
int colorTolerance = 50;
//----GLOBAL VARIABLES-------------------------------------

void settings() {
  CreateFolderPath();                            // create folder path

  image.resize(800, 0);                          // resize imagge
  Width = image.width;
  Height = image.height;
  radius = Height / circleCount;                 // calc radius of circle
  size(Width + radius, Height + radius);         // set size of canvas
  if (debug) println("Width: " + Width + " | Height: " + Height + " | Radius: " + radius);
}
//-----------------------------------------


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
        if (abs(val) < colorTolerance) {              // if color is similar, skip it
          skip = true;
          break;
        }
      }

      if (!skip) {
        Colors.append(col);                                           // save the color
        cls_Color tempCol = new cls_Color(col, i/Width, i/Height);    // save the color, Xloc and Yloc
        UniqueColors.add(tempCol);                                    // save unique color
      }
    } else {                                                          // if color does exist, add count
      int index = Colors.index(col);                                  // get the index of the duplicate value
      UniqueColors.get(index).AddLocation( i/Width, i/Height);        // save Xloc and Yloc of duplicate value
    }

    int rowNumber = i / Width;                        // get row number

    if (rowNumber % radius == 0 && i % Width == 0 && i!=0) {
      // println(rowNumber);
      // println("Sorting");
      int index = UniqueColors.size();
      if (debug) {
        println("Original First value: " + UniqueColors.get(0).Locations.size() + 
          " Last value: " + UniqueColors.get(index - 1).Locations.size());
      }
      Collections.sort(UniqueColors, new ColorSorter());                      // sort values
      Collections.reverse(UniqueColors);

      // println("Finished Sorting");

      index = UniqueColors.size();

      if (debug) {
        println("Sorted First value: " + UniqueColors.get(0).Locations.size() + 
          " Last value: " + UniqueColors.get(index - 1).Locations.size());

        println("Row Number: " + rowNumber);
      }
      DrawCircle(rowNumber);                               // draw circle   

      //UniqueColors.clear();                                // clear values
      //Colors.clear();
      UniqueColors = new ArrayList<cls_Color>();
      Colors = new IntList();
    }
  }

  // need go iterate through all the pixels vertically to create columns 
  DrawColumns();

  if (debug) {
    println("Unique Colors: " + Colors.size());
    println("Number of pixels: " + image.pixels.length);

    for (int i = 0; i < UniqueColors.size(); i++) {
      println("UniqueColor Amount: " + UniqueColors.get(i).Locations.size() + " Color: " + UniqueColors.get(i).Color +
        " R: " + UniqueColors.get(i).Red);
    }
  }
  println("DONE");
}
//-----------------------------------------



void draw() {
}
//-----------------------------------------




// draw the column of circles on the right of the image
void DrawCircle(int rowNumber) {
  //println("Drawing Circle");

  int x = Width + (radius/2);
  int y = rowNumber - (radius/2);

  //int index = UniqueColors.size()/ circleCount;
  //fill(UniqueColors.get(i * index).Color);
  fill(UniqueColors.get(0).Color);
  ellipse(x, y, radius, radius);
}
//-----------------------------------------


// draw a row of circles at the bottom of the image
void DrawCircle2(int columnNumber) {

  int x = (columnNumber * radius) + (radius/2);
  int y = Height + (radius/2);
  fill(UniqueColors.get(0).Color);
  ellipse(x, y, radius, radius);
}
//-----------------------------------------


void DrawColumns() {
  UniqueColors.clear();                                // clear values
  Colors.clear();
  UniqueColors = new ArrayList<cls_Color>();
  Colors = new IntList();
  int numCircles = Width / radius;                    // number of circles

  for (int i = 0; i < numCircles; i++) {              // go through the number of horizontal circles

    // go through all the pixels
    for (int j = 0; j < Height; j++) {                // go throught the height of the image

      int start = (i * radius) + (j * Width);
      int end = start + radius;
      if (debug) println("Start: " + start + " | End: " + (end-1));

      for (int k = start; k < end; k++) {
        color col = image.pixels[k];                  // get the current pixel color
        if (!Colors.hasValue(col)) {                  // does this color exist already

          // compare against tolerance
          boolean skip = false;
          for (int m = 0; m < Colors.size(); m++) {
            int val = col - Colors.get(m);
            if (abs(val) < colorTolerance) {          // if color is similar, skip it
              skip = true;
              break;
            }        // close IF
          }          // close M loop

          if (!skip) {
            Colors.append(col);                                          // save the color
            cls_Color tempCol = new cls_Color(col, k/Width, j);          // save the color, Xloc and Yloc
            UniqueColors.add(tempCol);                                   // save unique color
          }
        } else {
          int index = Colors.index(col);                                  // get the index of the duplicate value
          UniqueColors.get(index).AddLocation( i/Width, i/Height);        // save Xloc and Yloc of duplicate value
        }       // close If has color
      }          // close K loop
    }            // close J loop

    // println("Sorting");
    int index = UniqueColors.size();
    if (debug) {
      println("Number of values: " + UniqueColors.size());
      println("Original Column First value: " + UniqueColors.get(0).Locations.size() + 
        " Last value: " + UniqueColors.get(index - 1).Locations.size());
    }
    Collections.sort(UniqueColors, new ColorSorter());                      // sort values
    Collections.reverse(UniqueColors);
    //println("Drawing Circle2");

    index = UniqueColors.size();
    if (debug) {
      println("Sorted Column First value: " + UniqueColors.get(0).Locations.size() + 
        " Last value: " + UniqueColors.get(index - 1).Locations.size());
    }
    DrawCircle2(i);                                      // draw circles
    UniqueColors = new ArrayList<cls_Color>();
    Colors = new IntList();
  }            // close I loop
}              // close function




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
  if (files.length > 0) {
    int num = files.length;

    FileName = files[0].getName();

    image = loadImage(FileName);             // load the image
    println("Image file name: " + FileName);
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


void mousePressed() {
  if (mouseButton ==LEFT) {
    String[] splitName = split(FileName, '.');
    String prefix = ConvertIntToString(year()) + ConvertIntToString(month()) + ConvertIntToString(day()) + 
      "_" + ConvertIntToString(hour()) + ConvertIntToString(minute()); 

    String fileName =  prefix + "_" + splitName[0] + ".jpg"; 
    save(fileName); 
    println("----SAVED FILE: " + fileName + "----");
  }
}
//-----------------------------------------


String ConvertIntToString(int value) {
  if (value < 10) {
    return "0" + Integer.toString(value);
  } else {
    return Integer.toString(value);
  }
}
//-----------------------------------------