unsigned char index;
unsigned char command;
const int vib_motor_pin = 3;

const int vib_time = 250;
int delay_time = 100;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
//  command = "0";
}

void loop() {
  int val[2] = {0};
  if(Serial.available() > 0){
    for(int i = 0; i < 2; i++){
      val[i] = Serial.parseInt();
      }
    analogWrite(val[0], val[1]);
    Serial.flush();
    delay(100);
  }
//  move(vib_motor_pin,vib_time,delay_time,command);
}

void move(int i, int p, int s,char power){
  analogWrite(i, power);
  delay(p);
  analogWrite(i, 0);
  delay(s);
  
}
