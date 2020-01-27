import serial
import time

ser = serial.Serial('/dev/cu.usbmodem1421',38400, timeout=None)  # parameters need to change depending on computer
print("Name of Port: %s" %(ser.name))

challengesFile = open('cTxt.txt', 'r')  # open file in read format
responsesFile = open('rTxt.txt', 'w')  # open file in write format
challenges = challengesFile.readlines()
count = 0

for challenge in challenges:
  print('C', count, ': ', challenge)
  byte_formatted_challenge = challenge.encode()
  ser.write(byte_formatted_challenge)
  response = ser.readline()
  print('R', count, ': ',response.decode("utf-8"))
  count = count + 1
  time.sleep(2)  # time in seconds
