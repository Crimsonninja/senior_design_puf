`timescale 1ns/1ps

/*
* Company: Santa Clara University
* Engineer: Jonathan Trinh
* 
* Create Date: 10/14/2019 01:33:48 PM
* Design Name:
* Module Name: up_counter
* Project Name: Implementation of Delay Based Physical Unclonable Function
* Target Devices: Intel Max 10, Xilinx Spartan 7
* Tool Versions:
* Description: The up_counter module is an 8-bit counter that takes in an 8-bit input as
* its starting value. If the reset of the counter is set to 1, then it will go
* back to that starting value
* 
* Dependencies:
* 
* Revision:
* Revision 0.01 - File Created
* Additional Comments:
* 
*/

module up_counter    (
out     ,  // Output of the counter
enable  ,  // enable for counter
start   ,  // starting value of counter
clk     ,  // clock Input
reset      // reset Input
);
//----------Output Ports--------------
  output reg [7:0] out;
//------------Input Ports--------------
  input enable, clk, reset;
  input [7:0] start;
//-------------Code Starts Here-------
  always @(posedge clk) begin
    if (reset) begin
      out <= start;
    end else if (enable) begin
      out <= out + 1;
    end
  end

endmodule
