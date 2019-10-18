`timescale 1ns / 1ps
module tb_inverter();
  wire out;
  reg in;
  inverter inv1(.out(out),.in(in));
  
  initial begin
    in = 1'b0;
    forever begin
      #20 in = ~in;
    end
  end
endmodule
