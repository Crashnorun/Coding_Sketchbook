// ---- GLOBAL VARIABLES ----
boolean fullScreen = false;
PFont font;
int num;
ArrayList<Pix> dots;
int count = 0;
color backgroundColor;


// ---- GLOBAL SETTINGS ----
void settings() {

  if (fullScreen)
    fullScreen(P2D, SPAN);
  else
    size(1920, 1080);

  //font =  loadFont("Arial-BoldMT-48.vlw");
  font =  loadFont("ArialMT-50.vlw");
}


// ---- SETUP ----
void setup() {

  background(0);
  //frameRate(10);
  backgroundColor = color(0, 50);

  textAlign(LEFT, CENTER);
  textFont(font, 100);
  text("Teach", 100, height/2);

  loadPixels();

  num = 0;
  dots = new ArrayList<Pix>();

  // identify all the white pixels
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int index = x + (y * width);

      if (red(pixels[index]) >= 0.1) {
        double ang = RandomAngle();

        Pix p = new Pix(x, y, pixels[index], ang);
        dots.add(p);
      }
    }
  }
  println("Num dots: " + dots.size());
  // TestFindingWhiteText();
}


// ---- DRAW ----
void draw() {
  SaveFrame(count);
  if (count ==1500) exit();

  if (count ==0) delay(2000);
  count++;

  fill(backgroundColor);
  rect(0, 0, width, height);

  for (int i = 0; i < dots.size(); i++) {
    dots.get(i).MoveVector();
    dots.get(i).Redraw();
  }

  // start moving the pixels
  // for (int i = 0; i < pixs.size(); i++) {
  //    pix p = pixs.get(i);
  //  }


  /*
  TestFindingWhiteText(num);
   num ++;
   */
}



// find random angle
double RandomAngle() {
  // return random(0, 2*PI);            // option 3
  // return random(PI*0.25, PI*0.75);      // option 4
   return (PI/2);                        // option 5
}



// Test finding the white text
// this is used in the SETUP function
void TestFindingWhiteText() {

  stroke (255, 0, 0);

  // identify all the white pixels
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int index = x + (y * width);

      if (red(pixels[index]) >= 0.1) {
        double ang = RandomAngle();

        Pix p = new Pix(x, y, pixels[index], ang);
        dots.add(p);
        //println(x + " , " + y + " | " + red(pixels[index]));
        point(x, y);
      }
    }
  }
}


// Test finding the white text
// this is used in the DRAW function
void TestFindingWhiteText(int num) {

  stroke (255, 0, 0);

  if (num < pixels.length) {
    int x = num % width;
    int y = num / width;
    if (red(pixels[num]) > 0.1) {
      println(x + " , " + y + " | " + red(pixels[num]) + " | " + num);
      point(x, y);
    }
  }
}

void SaveFrame(int count) {
  String prefix = "000";

  if (count < 10) prefix = "000";
  else if (count>=10 && count < 100) prefix = "00";
  else if (count >=100 && count < 1000) prefix = "0";
  else if (count>=1000) prefix =  "";

  save(prefix + count + ".jpg");
}
