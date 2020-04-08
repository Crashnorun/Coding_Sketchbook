
//----GLOBAL VARIABLES--------------------
int rad;
color col;
float start;
float stop;
float end;
int stroke;
float count = 0;
ArrayList <cls_Arc> arcs = new ArrayList<cls_Arc>();
//----------------------------------------


void setup() {
  size(1000, 1000);

  for (int i = 0; i < 20; i++) {
    start  = random(PI);
    stop = start + random(0.5);
    stroke = int(random(width * 0.01, width * 0.05));
    rad = int(random((width/2) * 0.5, width));

    for (int j = 0; j < arcs.size(); j++) {
      if ((rad + stroke) > arcs.get(j).radius - arcs.get(j).stroke && 
        (rad + stroke) < arcs.get(j).radius + arcs.get(j).stroke ) {
        rad = int(findNonDuplicate(rad, stroke, (width/2) * 0.5, width));
      }
    }

    int c = int(random(10, 255));
    col = color(c, c, 255);
    println("Here " + i);
    arcs.add(new cls_Arc(start, stop, stroke, rad, col));
  }
}
//----------------------------------------


void draw() {
  background(0);

  for (int i = 0; i < arcs.size(); i++) {
    arcs.get(i).render();      // draw the ars

    // arcs.get(i).debug();
    if (count % 10 < 5) {
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

float findNonDuplicate(float val, float Start, float Stop ) {
  float num = random(Start, Stop);
  while (val == num) {
    num = random(Start, Stop);
  }
  return num;
}
//----------------------------------------

float findNonDuplicate(float val, float range, float Start, float Stop ) {
  float num = random(Start, Stop);
  println("Num: " + num + " - Val: " + val + " - Range: " + (val - range) + " : " + (val + range));

  while (num > val - range && num < val + range) {
    num = random(Start, Stop);
  }
  println(" - New Num: " + num);
  return num;
}
//----------------------------------------
