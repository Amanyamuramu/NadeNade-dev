import processing.serial.*;
Serial myPort;
int sentvalue = 0;
int sentindex = 3;

void setup(){
  myPort = new Serial(this, "COM9", 9600);
  size(400,400);
  
}

void draw(){
  background(0);
  sentvalue = (int)map(mouseX,0,width,0,255);
  myPort.write((char)sentindex);
  myPort.write((char)sentvalue);
  println(sentvalue);
  delay(100);
}
    
