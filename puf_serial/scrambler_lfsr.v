`timescale 1ns / 1ps

/*
* Company: Santa Clara University
* Engineer: Michael Hall
*
* Create Date: 03/28/2020 04:24:00 PM
* Design Name:
* Module Name: scrambler_lfsr
* Project Name: Delay-based Physical Unclonable Function Implementation
* Target Devices: Digilent S7-25, S7-50 (Xilinx Spartan 7)
* Tool Versions:
* Description: scrambler_lfsr builds on top of the existing LFSR module and adds
*              an element on nonlinearity to it making it harder to predict.
*
* Dependencies: LFSR_8bit
*
* Revision:
* Revision 0.01 - File Created
* Additional Comments:
*
*/

module scrambler_lfsr(chall_in, chall_out, clock, reset, increment);
    input [7:0] chall_in;
    input clock, reset, increment;
    output reg [7:0] chall_out;

    wire [7:0] lfsr_challenge; //output of the LFSR, internal to the scrambler

    LFSR_8bit LFSR(
      .input_challenge(chall_in),
      .output_challenge(lfsr_challenge),
      .clock(clock),
      .reset(reset),
      .increment(increment)
    );

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            chall_out <= lfsr_challenge;
        end
        else if (increment) begin
            chall_out <=  lfsr_challenge ^ chall_in;
        end
    end

endmodule
