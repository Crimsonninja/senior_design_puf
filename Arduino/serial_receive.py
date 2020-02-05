import serial
import time
import csv
from datetime import datetime

timeString = datetime.now().strftime("%Y-%m-%d___%I_%M_%S%p")
output_file_name = 'rTxt___' + timeString +'.csv'

ser = serial.Serial('/dev/cu.usbmodem1411',57600, timeout=None)  # parameters need to change depending on computer
print("Name of Port: %s" %(ser.name))


loop_count = 0  # want it to go to 1000
max_loop_count = 1000
count = 0

with open(output_file_name, 'w') as csvfile:
    file_writer = csv.writer(csvfile, delimiter=',')
    file_writer.writerow(['R', 'Set', 'Count', 'R[0]', 'R[1]', 'R[2]', 'R[3]', 'R[4]', 'R[5]', 'R[6]', 'R[7]'])

response = ser.readline()

while True:
    response = str(ser.readline())
    # print(response)

    if 'loop' in response:
        loop_count = loop_count + 1
        count = 0
        print('R', count, ': ',response)  # for convenience
        with open(output_file_name, 'a') as csvfile:
            file_writer = csv.writer(csvfile, delimiter=',')
            file_writer.writerow(['R start', loop_count, 'N/A'])
    else:
        response = response[2:len(response)-6]  # chop off the \b and \n stuff
        print('R', count, ': ',response)  # for convenience
        with open(output_file_name, 'a') as csvfile:
            file_writer = csv.writer(csvfile, delimiter=',')
            file_writer.writerow(['R', loop_count, count] + response.split(","))
        count = count + 1

    if loop_count > max_loop_count:
        break
