`timescale 1ns/1ps

module tb_ring_osc();

  wire out;

  reg en;
  
  ring_osc ro0(.enable(en), .w14(out));

  initial begin
    $display("Starting Ring Oscillator Test");
    $monitor("Output of ro0: %d\t Time: %d",out, $time);
    en = 1;
    #10;
    en = 0;
    #20;
    en = 1;
    #200;
    $finish;
  end

endmodule
