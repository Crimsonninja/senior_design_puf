`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2020 12:29:24 PM
// Design Name: 
// Module Name: lfsr_tb
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


module lfsr_tb();

    wire [0:7] out_chall;
    reg [0:7] in_chall;
    reg reset, incr;

    LFSR_8bit lfsr_dut(.input_challenge(in_chall), .output_challenge(out_chall), .increment(incr), .reset(reset));
    
    integer i;
    integer init_chall = 2; //initial value for the challenge
    
    initial begin
        $display("LFSR testing");
        $monitor("chall_out: %d", out_chall);
        
        in_chall = init_chall;
        reset = 1;
        #5
        reset = 0; //toggling reset 'loads' the initial challenge into the LFSR
        
        for(i = 0; i < 40; i = i+1) begin //runs through first i numbers in the LFSR after the initial value
            #5
            incr = 1;
            #5
            incr = 0;
        end
        
        #10 reset = 1; //loads in init_challenge again
        #5 reset = 0;
        
        in_chall = 68;
        
        #10 reset = 1; //tests if different challenge can be loaded in
        #5 reset = 0;
    end
            

endmodule
