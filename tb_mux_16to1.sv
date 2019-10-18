`timescale 1ns/1ps

module mux_test();

reg d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16;
reg [3:0] sel;
wire out;

mux_16to1 test(d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, sel, out);

// 'initial' means just to do it once (unlike 'always')
initial
begin
    d1 = 0;
    d2 = 1;
    d3 = 0;
    d4 = 1;
    d5 = 0;
    d6 = 1;
    d7 = 0;
    d8 = 1;
    d9 = 0;
    d10 = 1;
    d11 = 0;
    d12 = 1;
    d13 = 0;
    d14 = 1;
    d15 = 0;
    d16 = 1;
    sel = 2'b00;
    
    // wait 50 nanoseconds, so we can see the change!
    #50;
    
    sel = 4'b0001;
    #50;
    
    sel = 4'b0010;
    #50;
    
    sel = 4'b0011;
    #50;
    
    $finish;
end
endmodule
