`timescale 1ns/1ps

/*
* Company: Santa Clara University
* Engineer: Jonathan Trinh
*
* Create Date: 10/10/2019 03:22:41 PM
* Design Name:
* Module Name: ring_osc
* Project Name: Implementation of Delay Based Physical Unclonable Function
* Target Devices: Intel Max 10, Xilinx Spartan 7
* Tool Versions:
* Description: The ring_osc module is a ring oscillator with 14 inverters that loop
* back into the Nand Gate effectively making 15 inverters in total.
*
* Dependencies:
*
* Revision:
* Revision 0.01 - File Created
* Additional Comments:
*
*/

module ring_osc(enable, out);
  output out;
  input enable;

  (* dont_touch = "yes" *) wire w1;
  (* dont_touch = "yes" *) wire w2;
  (* dont_touch = "yes" *) wire w3;
  (* dont_touch = "yes" *) wire w4;
  (* dont_touch = "yes" *) wire w5;
  (* dont_touch = "yes" *) wire w6;
  (* dont_touch = "yes" *) wire w7;
  (* dont_touch = "yes" *) wire w8;
  (* dont_touch = "yes" *) wire w9;
  (* dont_touch = "yes" *) wire w10;
  (* dont_touch = "yes" *) wire w11;
  (* dont_touch = "yes" *) wire w12;
  (* dont_touch = "yes" *) wire w13;
  (* dont_touch = "yes" *) wire w14;
  (* dont_touch = "yes" *) wire w15;

  assign w15 = ~(enable & w14);
  assign w14 = ~ w13;  // w14 is the output we are interested in
  assign w13 = ~ w12;
  assign w12 = ~ w11;
  assign w11 = ~ w10;
  assign w10 = ~ w9;
  assign w9 = ~ w8;
  assign w8 = ~ w7;
  assign w7 = ~ w6;
  assign w6 = ~ w5;
  assign w5 = ~ w4;
  assign w4 = ~ w3;
  assign w3 = ~ w2;
  assign w2 = ~ w1;
  assign w1 = ~ w15;

  assign out = w14;

endmodule
