`timescale 1ns / 1ps
// 
//////////////////////////////////////////////////////////////////////////////////
module scrambler_tb();
    wire [0:7] out;
    reg [0:7] in;
    reg increment;
    reg reset;
    
    scrambler_lfsr dut(.chall_in(in), .chall_out(out), .reset(reset), .increment(increment));
    
    integer i = 1;
    integer init = 2;
    
    initial begin
        in = init;
        #5
        reset = 1;
        #5
        reset = 0;
        #10
        for(i = 0; i<8; i= i + 1) begin
            #5
            increment = 1;
            #5
            increment = 0;
        end
        
        
    end


endmodule
