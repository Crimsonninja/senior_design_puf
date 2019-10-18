`timescale 1ns/1ps

/*
* Company: Santa Clara University
* Engineer: Jonathan Trinh
* 
* Create Date: 10/14/2019 12:18:17 PM
* Design Name:
* Module Name: mux_16to1
* Project Name: Implementation of Delay Based Physical Unclonable Function
* Target Devices: Intel Max 10, Xilinx Spartan 7
* Tool Versions:
* Description: The mux_16to1 is a multiplexer that selects between 16 inputs and passes through only one. It follows that the select line is a 4-bit bus.
* 
* Dependencies:
* 
* Revision:
* Revision 0.01 - File Created
* Additional Comments:
* 
*/

module mux_16to1(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, sel, out);

  input a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p;
  input [3:0] sel;
  output reg out;

  always@(*) begin
    case (sel)
      4'b0000: out = a;
      4'b0001: out = b;
      4'b0010: out = c;
      4'b0011: out = d;
      4'b0100: out = e;
      4'b0101: out = f;
      4'b0110: out = g;
      4'b0111: out = h;
      4'b1000: out = i;
      4'b1001: out = j;
      4'b1010: out = k;
      4'b1011: out = l;
      4'b1100: out = m;
      4'b1101: out = n;
      4'b1110: out = o;
      4'b1111: out = p;
    endcase
  end

endmodule
