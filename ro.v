`timescale 1ns/1ps

/*
* Company: Santa Clara University
* Engineer: Jonathan Trinh
* 
* Create Date: 10/10/2019 03:22:41 PM
* Design Name:
* Module Name: ro
* Project Name: Implementation of Delay Based Physical Unclonable Function
* Target Devices: Intel Max 10, Xilinx Spartan 7
* Tool Versions:
* Description: The ro module is a ring oscillator with 15 inverters that loop
* back into the Nand Gate.
* 
* Dependencies:
* 
* Revision:
* Revision 0.01 - File Created
* Additional Comments:
* 
*/

module ro(enable, w15);
  output w15;
  input enable;

  wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16;

  assign #1 w16 = enable & w15;
  assign #1 w15 = ~ w14; // w15 is the output we are interested in
  assign #1 w14 = ~ w13;
  assign #1 w13 = ~ w12;
  assign #1 w12 = ~ w11;
  assign #1 w11 = ~ w10;
  assign #1 w10 = ~ w9;
  assign #1 w9 = ~ w8;
  assign #1 w8 = ~ w7;
  assign #1 w7 = ~ w6;
  assign #1 w6 = ~ w5;
  assign #1 w5 = ~ w4;
  assign #1 w4 = ~ w3;
  assign #1 w3 = ~ w2;
  assign #1 w2 = ~ w1;
  assign #1 w1 = ~ w16;

endmodule
