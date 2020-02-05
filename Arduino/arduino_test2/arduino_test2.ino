// Buffer to store incoming commands from serial port
String inData;

int count = 0;
int data;
int challenge[8];
int cPins[8] = {12, 11, 10, 9, 8, 7, 6, 5};

void setup() {
  Serial.begin(57600);
  for (int i = 0; i < 8; i++) {
    pinMode(cPins[i], OUTPUT);
  }
  //  /*Comment this*/pinMode(3, OUTPUT);
  //  /*Comment this*/pinMode(4, OUTPUT);
  Serial.println("Initializing...");
  //  digitalWrite(4, HIGH);
  //  delayMicroseconds(700);
  //  digitalWrite(4, LOW);
}

void sendChallenge(int challenge[]) {
  for (int i = 0; i < 8; i++) {
    digitalWrite(cPins[i], challenge[i]);
  }
}

void loop() {
  while (1) {
    if (Serial.available()) {
      count = 0;
      char recieved = Serial.read();
      inData += recieved;
      count++;

      // Process message when new line character is recieved
      if (recieved == '\n') {
        //        Serial.print("Arduino Received: ");
        //        Serial.print(inData.substring(0, 8));
        for (int i = 0; i < 8; i++) {
          if (inData[i] == '0') {
            challenge[i] = 0;
          } else {
            challenge[i] = 1;
          }
        }
        sendChallenge(challenge);
        inData = ""; // Clear received buffer
        //        digitalWrite(3, HIGH);
        //        delayMicroseconds(700);
        //        digitalWrite(3, LOW);
      }
    }
  }
}
