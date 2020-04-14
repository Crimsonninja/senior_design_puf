`timescale 1ns / 1ps

/*
* Company: Santa Clara University
* Engineer: Abby Aguirre
*
* Create Date: 02/10/2020 03:39:47 PM
* Design Name:
* Module Name: puf_parallel_subblock
* Project Name: Delay-based Physical Unclonable Function Implementation
* Target Devices: Digilent S7-25, S7-50 (Xilinx Spartan 7)
* Tool Versions:
* Description: A subblock that takes an 8-bit input, runs a race between two ring
*              oscillators, and outputs 1-bit that is random
*
* Dependencies:
*
* Revision:
* Revision 0.01 - File Created
* Additional Comments:
*
*/


module puf_parallel_subblock(
    enable,
    challenge,
    out,
    done,
    clock,
    reset
    );
  output out, done;
  input [7:0] challenge;
  input [31:0] enable;
  input clock, reset;

  (* dont_touch = "yes" *) wire [31:0] ro_out;  // a 32 bit bus: each stems from the output of each ro
  (* dont_touch = "yes" *) wire first_mux_out, second_mux_out;  // output of muxes that go into the counters
  (* dont_touch = "yes" *) wire fin1, fin2;     // outputs of the counters that go into the race arbiter
  (* dont_touch = "yes" *) wire [21:0] pmc1_out, pmc2_out;  // for debug, output of the counters

  (* dont_touch = "yes" *) ring_osc first_ro[15:0] (enable[15:0], ro_out[15:0]);    // An array of 16 ring oscillators that go into the first mux
  (* dont_touch = "yes" *) ring_osc second_ro[15:0] (enable[31:16], ro_out[31:16]); // An array of 16 ring oscillators that go into the second mux

  (* dont_touch = "yes" *) mux_16to1 first_mux(ro_out[0], ro_out[1], ro_out[2], ro_out[3], ro_out[4], ro_out[5], ro_out[6], ro_out[7], ro_out[8], ro_out[9], ro_out[10], ro_out[11], ro_out[12], ro_out[13], ro_out[14], ro_out[15], challenge[3:0], first_mux_out);
  (* dont_touch = "yes" *) mux_16to1 second_mux(ro_out[16], ro_out[17], ro_out[18], ro_out[19], ro_out[20], ro_out[21], ro_out[22], ro_out[23], ro_out[24], ro_out[25], ro_out[26], ro_out[27], ro_out[28], ro_out[29], ro_out[30], ro_out[31], challenge[7:4], second_mux_out);

  (* dont_touch = "yes" *) post_mux_counter pmc1(pmc1_out, fin1, enable[0], first_mux_out, reset);

  (* dont_touch = "yes" *) post_mux_counter pmc2(pmc2_out, fin2, enable[0], second_mux_out, reset);

  (* dont_touch = "yes" *) race_arbiter arb(fin1, fin2, reset, out, done);

endmodule
