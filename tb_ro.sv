`timescale 1ns/1ps
module tb_ro();

  wire out;

  reg en;
  
  ro ro0(.enable(en), .w15(out));

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
    //forever begin
    //  #100 en = ~en;
    //end
  end

endmodule
