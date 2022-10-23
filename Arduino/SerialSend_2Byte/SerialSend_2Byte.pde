import processing.serial.*;
import controlP5.*;

Serial serial;
ControlP5 cp5;

Slider Strongness;
Slider index;

int sentvalue = 0;

void setup() {
  // シリアルポートの番号と通信速度は適宜修正してください。
  size(400,400);
  serial = new Serial(this, "COM9", 9600);  
  
  cp5 =  new ControlP5(this);
  Strongness = cp5.addSlider("vib strongness")
  .setPosition(20,20)
  .setRange(0,255)
  .setSize(width/5,height/15)
  .setValue(0);
  
  cp5 =  new ControlP5(this);
  index = cp5.addSlider("vib index")
  .setPosition(20,20+22)
  .setRange(1,5)
  .setSize(width/5,height/15)
  .setValue(1);
  
}
void draw() {
  background(0);
  println(Strongness.getValue());
  sendIntData((int)Strongness.getValue(),(int)index.getValue());
  delay(100);
}
void mousePressed() { 
  sendIntData((int)Strongness.getValue(),(int)index.getValue());
}

void sendIntData(int value,int index) {
  serial.write('H');  // ヘッダの送信
  serial.write((char)index); // 上位バイトの送信
  serial.write((char)value);  // 下位バイトの送信
}

// Arduino側できちんと受信・復元できたかを確認するために
// データを文字列として送り返してもらって、それをコンソールに表示。
// （Processingとの通信中にシリアルモニタが使えないので）
// データの受信
void serialEvent(Serial port) {
  if ( port.available() > 0 ) {
    String data = trim(port.readStringUntil('\n'));
    if ( data != null ) {
      println("data =", data);
    }
  }
}
