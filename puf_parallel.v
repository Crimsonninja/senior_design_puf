`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 02/10/2020 05:01:25 PM
// Design Name:
// Module Name: puf_parallel
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module puf_parallel(
    enable,
    challenge,
    out,
    all_done,
    clock,
    computer_reset
    );
  output [7:0] out;
  wire [7:0] done;
  output all_done;
  input [7:0] challenge;
  input [31:0] enable;
  input clock,computer_reset;

  assign all_done = done[0] && done[1] && done[2] && done[3] && done[4] && done[5] && done[6] && done[7];

  (* dont_touch = "yes" *) puf_parallel_subblock block0(enable[31:0], challenge[7:0], out[0], done[0], clock,computer_reset);
  (* dont_touch = "yes" *) puf_parallel_subblock block1(enable[31:0], challenge[7:0], out[1], done[1], clock,computer_reset);
  (* dont_touch = "yes" *) puf_parallel_subblock block2(enable[31:0], challenge[7:0], out[2], done[2], clock,computer_reset);
  (* dont_touch = "yes" *) puf_parallel_subblock block3(enable[31:0], challenge[7:0], out[3], done[3], clock,computer_reset);
  (* dont_touch = "yes" *) puf_parallel_subblock block4(enable[31:0], challenge[7:0], out[4], done[4], clock,computer_reset);
  (* dont_touch = "yes" *) puf_parallel_subblock block5(enable[31:0], challenge[7:0], out[5], done[5], clock,computer_reset);
  (* dont_touch = "yes" *) puf_parallel_subblock block6(enable[31:0], challenge[7:0], out[6], done[6], clock,computer_reset);
  (* dont_touch = "yes" *) puf_parallel_subblock block7(enable[31:0], challenge[7:0], out[7], done[7], clock,computer_reset);


endmodule
