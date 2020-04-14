`timescale 1ns/1ps

/*
* Company: Santa Clara University
* Engineer: Jonathan Trinh
*
* Create Date: 10/17/2019 02:15:09 PM
* Design Name:
* Module Name: race_arbiter
* Project Name: Delay-based Physical Unclonable Function Implementation
* Target Devices: Digilent S7-25, S7-50 (Xilinx Spartan 7)
* Tool Versions:
* Description: The race_arbiter determines which signal finished first. If
*              finished1 is asserted first, then the output is 1. If finished2 is asserted
*              first, then output is 0. If both are 1, then behavior is a latch.
*
* Dependencies:
*
* Revision:
* Revision 0.01 - File Created
* Additional Comments:
*
*/

module race_arbiter(finished1, finished2, reset, out, done);
  input reset, finished1, finished2;
  output out;
  output done;

  wire cnt1_done, cnt2_done;
  assign cnt1_done = (finished1 & ~ cnt2_done);
  assign cnt2_done = (finished2 & ~ cnt1_done);
  wire winner = cnt1_done | ~ cnt2_done;
  assign done = (finished1 | finished2) & ~reset;
  assign out  = winner & ~reset;

endmodule
