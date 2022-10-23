import processing.serial.*;
import controlP5.*;

Serial serial;
ControlP5 cp5;

Slider Strongness;
Slider index;

void setup() {
  // シリアルポートの番号と通信速度は適宜修正してください。
  size(400,400);
  
  cp5 =  new ControlP5(this);
  Strongness = cp5.addSlider("vib strongness")
  .setPosition(20,20)
  .setRange(0,255)
  .setSize(width/5,height/15)
  .setValue(0);
  
  cp5 =  new ControlP5(this);
  index = cp5.addSlider("vib index")
  .setPosition(20,20+20)
  .setRange(1,5)
  .setSize(width/5,height/15)
  .setValue(1);
  
}
void draw() {
  background(0);
  println(Strongness.getValue());
  println(index.getValue());
}
