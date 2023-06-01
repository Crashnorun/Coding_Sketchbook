import processing.video.*;
import java.lang.reflect.*;


Capture video;
Capture cam;

void setup() {
  size(1920, 1080);
  String[] cameras = Capture.list();

  if (cameras.length ==0) {
    println("There are no cameras available");
    exit();
  } else {

    println("Available cameras:");
    printArray(Capture.list());


    // get all the fields
    /* for (int i = 0; i < cameras.length; i++) {
     println("     " + cameras[i] );
     
     Capture cam = new Capture(this, cameras[i]);
     println(cam.toString());
     //println(cam.device());
     
     Field[] fields = cam.getClass().getDeclaredFields();
     getFieldNames(fields);
     }*/


    cam = new Capture(this, width, height);
    cam.start();
  }

  /* ArrayList<String> configList = new ArrayList<String>();
   for (String device: devices) {
   ArrayList<String> resolutions = listResolutions(sourceName, propertyName,
   device);
   if (0 < resolutions.size()) {
   for (String res: resolutions) {
   configList.add("name=" + device + "," + res);
   }
   } else {
   configList.add("name=" + device);
   }
   }*/
}


void draw() {
  image(cam, 0, 0);
}

private static ArrayList<String> getFieldNames(Field[] fields) {
  ArrayList<String> fieldNames = new ArrayList<>();
  for (Field field : fields) {
    fieldNames.add(field.getName());
    println(field.getName());
  }
  return fieldNames;
}


void captureEvent(Capture c) {
  c.read();
}



/*
Available cameras:
 Integrated Camera #1
 USB2.0 PC CAMERA #1
 Integrated Camera #2
 USB2.0 PC CAMERA #2
 
 https://www.youtube.com/watch?v=WH31daSj4nc
 */
