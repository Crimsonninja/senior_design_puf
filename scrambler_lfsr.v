`timescale 1ns / 1ps

// Uses the linear 8-bit LFSR module and adds an element of nonlinearity to it.
//////////////////////////////////////////////////////////////////////////////////
module scrambler_lfsr(input [7:0] chall_in, output [7:0] chall_out,
                      input reset, input increment);
    
    wire [0:7] lfsr_challenge; //output of the LFSR, internal to the scrambler
    LFSR_8bit LFSR(.input_challenge(chall_in), .increment(increment),
                     .reset(reset), .output_challenge(lfsr_challenge));
                      
    reg [0:7] init_chall;
    reg state; //will keep track of if we've incremented yet
    
    always @(reset) begin
        init_chall <= chall_in;
        state <= 0; //stores first lfsr position and marks it as first
        end
    
    assign chall_out = state ? lfsr_challenge^init_chall : init_chall;
    //output is always init_chall, but sometimes XORed with the lsfr
    
    always @(posedge increment) begin
        state <= 1;
        end // mark the new state as having been incremented
    
endmodule
