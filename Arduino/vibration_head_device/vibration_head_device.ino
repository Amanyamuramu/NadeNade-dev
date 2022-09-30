const int vib_motor_pin = 3;
const int vib_motor_pin2 = 5;
const int vib_motor_pin3 = 6;
const int vib_motor_pin4 = 9;
const int vib_motor_pin5 = 10;

const int vib_time = 250;
int delay_time = 100;

void setup() {
//  pinMode(9,OUTPUT);
}

void loop()
{
  move(vib_motor_pin2,vib_time,delay_time);
  move(vib_motor_pin2,vib_time,delay_time);
  move(vib_motor_pin3,vib_time,delay_time);
  move(vib_motor_pin4,vib_time,delay_time);
  move(vib_motor_pin5,vib_time,delay_time);
  
}

void move(int i, int p, int s){
  analogWrite(i, 200);
  delay(p);
  analogWrite(i, 0);
  delay(s);
  
}
