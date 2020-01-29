bool loopFlag = true;
bool readFlag = true;
int rPins[8] = {5, 6, 7, 8, 9, 10, 11, 12};  // this is big endian

void setup() {
  Serial.begin(38400);
  pinMode(13, INPUT); // loop end condition pin
  pinMode(3, INPUT); // loop end condition pin

  for (int i = 0; i < 8; i++) {
    pinMode(rPins[i], INPUT);
  }

}

void loop() {

  //
  if (digitalRead(3) && readFlag) {
    readFlag = false;
    for (int i = 0; i < 8; i++) {
      Serial.print(digitalRead(rPins[i]));
      Serial.print(',');
    }
    Serial.println("");
  }
  if (!digitalRead(3) && !readFlag) {
    readFlag = true;
  }






  // End condition
  if (digitalRead(13) && loopFlag) {
    Serial.println("loop"); // see python script for loop condition
    loopFlag = false;
  }
  if (!digitalRead(13) && !loopFlag) {
    loopFlag = true;
  }

}
