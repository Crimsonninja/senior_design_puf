`timescale 1ns / 1ps

/*
* Company: Santa Clara University
* Engineer: Michael Hall
*
* Create Date: 03/28/2020 04:22:23 PM
* Design Name:
* Module Name: LFSR_8bit
* Project Name: Delay-based Physical Unclonable Function Implementation
* Target Devices: Digilent S7-25, S7-50 (Xilinx Spartan 7)
* Tool Versions:
* Description: This module serves as an obfuscator to use in a serial PUF scheme
*              It maintains linear behavior, but is harder to break into than a
*              a straight counter.
*
* Dependencies:
*
* Revision:
* Revision 0.01 - File Created
* Additional Comments:
*
*/

module LFSR_8bit(input_challenge, output_challenge, clock, reset, increment);
  output reg [7:0] output_challenge;
  input [7:0] input_challenge;
  input clock, increment, reset;

  wire new_bit= output_challenge[1] ^ output_challenge[2] ^ output_challenge[3] ^ output_challenge[7];
  always @(posedge clock or posedge reset) begin
    if (reset) begin
        output_challenge <= input_challenge;
    end
    else
    if (increment) begin
        output_challenge <= {output_challenge[6:0], new_bit};
    end
  end

endmodule
