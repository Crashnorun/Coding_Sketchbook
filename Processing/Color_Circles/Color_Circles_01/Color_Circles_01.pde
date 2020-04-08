import java.util.Comparator;
import java.util.Collections;

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

  for (int i = 0; i < 10; i++) {
    start  = random(PI);
    stop = start + random(0.5);
    stroke = int(random(width * 0.2, width * 0.5));
    rad = int(random((width/2) * 0.8, width/2));

    for (int j = 0; j < arcs.size(); j++) {
      //if ((rad + stroke) > arcs.get(j).radius - arcs.get(j).stroke && 
      //  (rad + stroke) < arcs.get(j).radius + arcs.get(j).stroke ) {
       // rad = int(findNonDuplicate(rad-(rad * 0.25), stroke, (width/2) * 0.5, width));
         rad = int(random((width/2) * 0.8, width/2));
      //}
    }
    
    int c = int(random(10, 255));
    col = color(c, c, 255);
   
    arcs.add(new cls_Arc(start, stop, stroke, rad, col));
  }
  
  Collections.sort(arcs, new ArcSorter());
  Collections.reverse(arcs);
 //ArrayList.sort(arcs);
  
}
//----------------------------------------


void draw() {
  background(0);
  println("Count: " + count);

  for (int i = 0; i < arcs.size(); i++) {
    arcs.get(i).render();      // draw ther ars

    // arcs.get(i).debug();
    if (count % 10 < 5) {
      arcs.get(i).start +=0.1; 
      arcs.get(i).stop +=0.3;
    } else {
      arcs.get(i).start +=0.3;
      arcs.get(i).stop +=0.1;
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
    println(" - New Num: " + num + " - Val: " + val);
  return num;
}
//----------------------------------------
