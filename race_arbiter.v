`timescale 1ns/1ps

/*
* Company: Santa Clara University
* Engineer: Jonathan Trinh
* 
* Create Date: 10/17/2019 02:15:09 PM
* Design Name:
* Module Name: race_arbiter
* Project Name: Implementation of Delay Based Physical Unclonable Function
* Target Devices: Intel Max 10, Xilinx Spartan 7
* Tool Versions:
* Description: The race_arbiter determines which signal finished first. If
* finished1 is asserted first, then the output is 1. If finished2 is asserted
* first, then output is 0. If both are 1, then behavior is unknown.
* 
* Dependencies:
* 
* Revision:
* Revision 0.01 - File Created
* Additional Comments:
* 
*/

module race_arbiter(finished1, finished2, enable, out);
  output reg out;
  input enable, finished1, finished2;
  wire cnt1_done, cnt2_done, winner;


  assign cnt1_done = (finished1 & ~ cnt2_done) === 1'b1;
  assign cnt2_done = (finished2 & ~ cnt1_done) === 1'b1;
  assign winner = cnt1_done | ~ cnt2_done;

  always@(negedge enable) begin
    out <= winner;
  end

endmodule
