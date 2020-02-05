import serial
import time
import csv

output_file_name = 'rTxt.csv'

ser = serial.Serial('/dev/cu.usbmodem1411',38400, timeout=None)  # parameters need to change depending on computer
print("Name of Port: %s" %(ser.name))


loop_count = 0  # want it to go to 1000
max_loop_count = 1000
count = 0

with open(output_file_name, 'w') as csvfile:
    file_writer = csv.writer(csvfile, delimiter=',')
    file_writer.writerow(['R', 'Set', 'Count', 'C[0]', 'C[1]', 'C[2]', 'C[3]', 'C[4]', 'C[5]', 'C[6]', 'C[7]'])

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
        response = response[2:len(response)-6]
        print('R', count, ': ',response)  # for convenience
        with open(output_file_name, 'a') as csvfile:
            file_writer = csv.writer(csvfile, delimiter=',')
            file_writer.writerow(['R', loop_count, count] + response.split(","))
        count = count + 1

    if loop_count > max_loop_count
        break
