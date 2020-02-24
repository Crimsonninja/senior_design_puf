// This module serves as an obfuscator to use in a serial PUF scheme. 
// It maintains linear behavior, but is harder to break into than a
// straight counter. 
// We plan on adding nonlinearity in later, but ver. 1.0 has no extra 
// behavior. 

`timescale 1ns/1ps

module LFSR_8bit(input_challenge, increment, reset, output_challenge)
	output reg [7:0] output_challenge;
	input [7:0] input_challenge, increment, reset;
	reg new_bit;
	integer i;

	always @(reset) begin
		output_challenge <= input_challenge;
	end

	always @(increment) begin
		new_bit = output_challenge[1] ^ output_challenge[2] ^ output_challenge[3] ^ output_challenge[7];
		for(i = 7; i > 0; i = i - 1) begin
			output_challenge[i] = output_challenge[i-1];
		end
		output_challenge[0] = new_bit;
	end

endmodule