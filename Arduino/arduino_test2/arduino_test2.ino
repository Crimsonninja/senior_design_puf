// Buffer to store incoming commands from serial port
String inData;

int count = 0;
int data;
int challenge[8];
int some_pins[8] = {3, 12, 11, 10, 9, 8, 7, 6};
int rPins[8] = {28, 30, 32, 34, 36, 38, 40, 42};

void setup() {
  Serial.begin(38400);
  for (int i = 0; i < 8; i++) {
    pinMode(some_pins[i], OUTPUT);
  }
  Serial.println("Initializing...");
  for (int i = 0; i < 8 ; i++) {
    pinMode(rPins[i], INPUT);
  }
}

void sendChallenge(int challenge[]) {
  for (int i = 0; i < 8; i++) {
    digitalWrite(some_pins[i], challenge[i]);
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
      }

    }
    // Listen for response and write to serial monitor
    for (int i = 0; i < 8; i++) {
      data = digitalRead(rPins[i]);
      Serial.print(data);

      //        if (data == 0) {
      //          Serial.print("0");
      //        } else {
      //          Serial.print("1");
      //        }
    }
    Serial.println("");
  }
}
