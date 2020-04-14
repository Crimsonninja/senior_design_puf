`timescale 1ns/1ps

/*
* Company: Santa Clara University
* Engineer: Jonathan Trinh
*
* Create Date: 10/16/2019 07:40:38 PM
* Design Name:
* Module Name: post_mux_counter
* Project Name: Delay-based Physical Unclonable Function Implementation
* Target Devices: Digilent S7-25, S7-50 (Xilinx Spartan 7)
* Tool Versions:
* Description: The post_mux_counter module counts to a predetermined goal and
*              once reached, drives the finished signal to 1. The finished signal is 0 all
*              other times (even after the cycle after reaching the goal).
*
* Dependencies:
*
* Revision:
* Revision 0.01 - File Created
* Additional Comments:
*
*/

module post_mux_counter    (
out     ,  // Output of the counter
finished,  // Output finished signal
enable  ,  // enable for counter
clk     ,  // clock Input
reset      // reset Input
);
`ifdef SIMONLY
  parameter N = 6;  // For simulation use N=6
`else
  parameter N = 23;  // Otherwise use N=23
`endif

//----------Output Ports--------------
  output reg finished;
  output reg [N-1:0] out;
//------------Input Ports--------------
  input enable, clk, reset;
//-------------Code Starts Here-------
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      out <= {N{1'b0}};
      finished <= 0;
    end
    else if (out[N-1]==1) begin
        finished <= 1'b1;
    end
    else if (enable && (!finished)) begin
      out <= out + 1;
    end
  end

endmodule
