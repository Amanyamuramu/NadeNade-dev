void setup() {
  Serial.begin(9600);
  //半だがいまいちなので、振動しの強さにばらつきが発生している
}

void loop() {
  if ( Serial.available() >= 3 ) {
    if ( Serial.read() == 'H' ) {
      unsigned char high = Serial.read();
      unsigned char low  = Serial.read();
      int recv_data = high;
      // 受信確認のために、数値を文字列で送り返す
      if(high%5 == 1){
        analogWrite(10, 0);
        analogWrite(3, low);
        analogWrite(5, low/3);
        }
      if(high%5 == 2){
        analogWrite(3, 0);
        analogWrite(5, low);
        analogWrite(6, low/3);
        }
      if(high%5 == 3){
        analogWrite(5, 0);
        analogWrite(6, low*1.5);
        analogWrite(9, low/3);
        }
      if(high%5 == 4){//弱い
        analogWrite(6, 0);
        analogWrite(9, low);
        analogWrite(10, low/3);
        }
      if(high%5 == 0){
        analogWrite(9, 0);
        analogWrite(10, low);
        }
      Serial.println(recv_data);
      delay(100);
    }
  }
}
