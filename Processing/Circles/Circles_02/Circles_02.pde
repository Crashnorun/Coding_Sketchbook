int count = 0;
color c;
color boxC= color(0,0,0,10);
int radius = 50;

void setup(){
  size(800, 400);                                      //window size
  smooth();
  frameRate(10);
  background(0);                                      //background color;
  noStroke();
}

void  draw(){
  fill(boxC);
  rect(0,0,width, height);
  //color c = color(255,0,0,count);          //alpha = the smaller the number the more transparent it is
 
 if (mousePressed == true){
  c = color (0,0,255); 
 }else{
   c = color (0,255,255); 
 }
 
 
  fill(c);
  ellipse(mouseX, mouseY,radius,radius);
  
  if (radius <=0){
    radius = 50;
  }
  else{
    radius --;
  }


  if (count>=255){
    count = 0;
  }
  else{
    count ++;
  }
}








