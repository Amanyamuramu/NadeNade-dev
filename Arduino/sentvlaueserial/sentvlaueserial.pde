import processing.serial.*;
Serial myPort;
int sentvalue = 0;

void setup(){
  myPort = new Serial(this, "COMX", 9600);
}

void draw(){
  background(0);
  sentvalue = (int)map(mouseX,0,width,0,255);
  myPort.write((char)sentvalue);
  delay(100);
}
    
