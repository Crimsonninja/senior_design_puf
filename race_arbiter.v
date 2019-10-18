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
* Description: The race_arbiter determines which signal finished first
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

  assign cnt1_done = finished1 & ~ cnt2_done;
  assign cnt2_done = finished2 & ~ cnt1_done;
  assign winner = cnt1_done | ~ cnt2_done;

  always@(negedge enable) begin
    out <= winner;
  end

endmodule
