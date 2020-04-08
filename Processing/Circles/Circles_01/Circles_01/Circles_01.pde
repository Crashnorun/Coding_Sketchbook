int count = 0;
color c;
color boxC= color(0,0,0,10);

void setup(){
  size(400, 400);                                      //window size
  smooth();
  frameRate(10);
  background(0);    //background color;
}

void  draw(){
  fill(boxC);
  rect(0,0,width, height);
  //color c = color(255,0,0,count);          //alpha = the smaller the number the more transparent it is
  c = color(0,0,255);
  fill(c);
  ellipse(mouseX, mouseY,50,50);
  //ellipse(width/2, height/2,100,100);

  if (count>=255){
    count = 0;
  }
  else{
    count ++;
  }
}








