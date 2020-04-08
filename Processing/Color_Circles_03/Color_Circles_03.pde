
//----GLOBAL VARIABLES--------------------
int rad;              // radius
color col;            // color
float start;          // start angle
float stop;           // stop angle
float end;    
int stroke;           // stroke width
float count = 0;
ArrayList <cls_Arc> arcs = new ArrayList<cls_Arc>();
//----------------------------------------


void setup() {
  size(1000, 1000);

  for (int i = 0; i < 20; i++) {
    start  = random(PI);                                               // random start angle
    stop = start + random(0.5);                                        // random stop angle
    stroke = int(random(width * 0.01, width * 0.05));                  // random width
    rad = int(random((width/2) * 0.5, width));                         // random radius

    for (int j = 0; j < arcs.size(); j++) {                            // try to avoid arcs of the same radius value
      if ((rad + stroke) > arcs.get(j).radius - arcs.get(j).stroke && 
        (rad + stroke) < arcs.get(j).radius + arcs.get(j).stroke ) {
        rad = int(findNonDuplicate(rad, stroke, (width/2) * 0.5, width));
      }
    }

    int c = int(random(10, 255));                                     // random blue color
    col = color(c, c, 255);
    
    arcs.add(new cls_Arc(start, stop, stroke, rad, col));
    arcs.get(arcs.size()-1).debug();
   /* println("Arc " + (i+1) + " - Radius: " + rad + " | Color: " + col + " | Stroke: " + stroke + " | Start: " + start 
      + " | Stop: " + stop); */
  }
}
//----------------------------------------


void draw() {
  background(0);

  for (int i = 0; i < arcs.size(); i++) {
    arcs.get(i).render2();      // draw the ars

    // arcs.get(i).debug();
    if (count % 10 < 5) {                                            // speed up / slow down arc rotation
      arcs.get(i).start +=random(0.01, 0.03); 
      arcs.get(i).stop +=random(0.05, 0.08);
    } else {
      arcs.get(i).start +=random(0.05, 0.08);
      arcs.get(i).stop +=random(0.01, 0.03);
    }
  }

  count+= 0.1;
}
//----------------------------------------


/*---------------------------------------
 Try to identify arcs of the same radius value
 val = current radius
 Start = start angle
 Stop = stop angle
 */
float findNonDuplicate(float val, float Start, float Stop ) {
  float num = random(Start, Stop);
  while (val == num) {
    num = random(Start, Stop);
  }
  return num;
}
//----------------------------------------


/*---------------------------------------
 Try to identify arcs of the same radius value
 val = radius
 range = stroke width
 Start = start angle to operate within
 Stop = stop angle to operate within
 */
float findNonDuplicate(float val, float range, float Start, float Stop ) {
  float num = random(Start, Stop);
  //println("Num: " + num + " - Val: " + val + " - Range: " + (val - range) + " : " + (val + range));

  while (num > val - range && num < val + range) {
    num = random(Start, Stop);
  }
  //println(" - New Num: " + num);
  return num;
}
//----------------------------------------