`timescale 1ns/1ps
`include "ring_osc.v"
`include "mux_16to1.v"
`include "post_mux_counter.v"
`include "race_arbiter.v"

module puf_scheme_parallel_block(enable, challenge, race_arbiter_out, clock, reset);
  output reg race_arbiter_out;
  input [7:0] challenge;
  input [31:0] enable;
  input clock, reset;

//  wire [7:0] challenge_counter_out;
  wire [31:0] ro_out;
  wire first_mux_out, second_mux_out;
  wire fin1, fin2, out;



  //up_counter challenge_counter(challenge_counter_out, start_counter_enable, challenge, start_counter_clk, start_counter_reset);
//   shift_register shift_reg(start_counter_clk, challenge_counter_out, out_shift_reg);


  ring_osc first_ro[15:0] (enable[15:0], ro_out[15:0]); // An array of ring oscillators
  ring_osc second_ro[15:0] (enable[31:16], ro_out[31:16]); // An array of ring oscillators

  mux_16to1 first_mux(ro_out[0], ro_out[16], ro_out[1], ro_out[17], ro_out[2], ro_out[18], ro_out[3], ro_out[19], ro_out[4], ro_out[20], ro_out[5], ro_out[21], ro_out[6], ro_out[22], ro_out[7], ro_out[23], challenge[3:0], first_mux_out);
  mux_16to1 second_mux(ro_out[24], ro_out[8], ro_out[25], ro_out[9], ro_out[26], ro_out[10], ro_out[27], ro_out[11], ro_out[28], ro_out[12], ro_out[29], ro_out[13], ro_out[30], ro_out[14], ro_out[31], ro_out[15], challenge[7:4], second_mux_out);

  post_mux_counter pmc1(pmc1_out, fin1, enable[0], clock, reset);
  post_mux_counter pmc2(pmc2_out, fin2, enable[0], clock, reset);

  race_arbiter arb(fin1, fin2, enable[0], out);
  
 


endmodule
