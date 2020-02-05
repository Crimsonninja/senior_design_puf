bool loopFlag = true;
bool readFlag = true;
int rPins[8] = {29, 28, 27, 26, 25, 24, 23, 22};
int loopPin = 30;
int readyPin = 31;

void setup() {
  Serial.begin(57600);
  pinMode(loopPin, INPUT); // loop end condition pin
  pinMode(readyPin, INPUT); // loop end condition pin

  for (int i = 0; i < 8; i++) {
    pinMode(rPins[i], INPUT);
  }
}

void loop() {

  //
  if (digitalRead(readyPin) && readFlag) {
    readFlag = false;
    for (int i = 0; i < 8; i++) {
      Serial.print(digitalRead(rPins[i]));
      Serial.print(',');
    }
    Serial.println("");
  }
  if (!digitalRead(readyPin) && !readFlag) {
    readFlag = true;
  }


  // End condition
  if (digitalRead(loopPin) && loopFlag) {
    Serial.println("loop"); // see python script for loop condition
    loopFlag = false;
  }
  if (!digitalRead(loopPin) && !loopFlag) {
    loopFlag = true;
  }

}
