unsigned char command;


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  if(Serial.available() > 0){
    command = Serial.read();
    print(command);
    Serial.flush();
    delay(100);
  }

}
