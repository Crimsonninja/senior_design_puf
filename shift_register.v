`timescale 1ns/1ps

/*
* Company: Santa Clara University
* Engineer: Jonathan Trinh
* 
* Create Date: 10/16/2019 04:12:23 PM
* Design Name:
* Module Name: shift_register
* Project Name: Implementation of Delay Based Physical Unclonable Function
* Target Devices: Intel Max 10, Xilinx Spartan 7
* Tool Versions:
* Description: The shift_register shifts the bits right synchronously
* 
* Dependencies:
* 
* Revision:
* Revision 0.01 - File Created
* Additional Comments:
* 
*/

module shift_register (clk, in, out);
  input clk, in;
  output [7:0] out;
  reg [7:0] tmp;

  always @(posedge clk) begin
    //tmp = tmp << 1;
    //tmp[0] = SI;
    tmp = {tmp[6:0],in};
  end

  assign out  = tmp;
endmodule
