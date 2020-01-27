`timescale 1ns/1ps
`include "puf_scheme_parrallel_block.v"

module puf_scheme_parallel(enable, challenge, race_arbiter_out,clock,reset);
  output reg [7:0] race_arbiter_out;
  input [7:0] challenge;
  input [31:0] enable;
  input clock,reset;

  block0 puf_scheme_parallel_block(enable[31:0], challenge[7:0], race_arbiter_out[0],clock,reset);
  block1 puf_scheme_parallel_block(enable[31:0], challenge[7:0], race_arbiter_out[1],clock,reset);
  block2 puf_scheme_parallel_block(enable[31:0], challenge[7:0], race_arbiter_out[2],clock,reset);
  block3 puf_scheme_parallel_block(enable[31:0], challenge[7:0], race_arbiter_out[3],clock,reset);
  block4 puf_scheme_parallel_block(enable[31:0], challenge[7:0], race_arbiter_out[4],clock,reset);
  block5 puf_scheme_parallel_block(enable[31:0], challenge[7:0], race_arbiter_out[5],clock,reset);
  block6 puf_scheme_parallel_block(enable[31:0], challenge[7:0], race_arbiter_out[6],clock,reset);
  block7 puf_scheme_parallel_block(enable[31:0], challenge[7:0], race_arbiter_out[7],clock,resets);
end module 
