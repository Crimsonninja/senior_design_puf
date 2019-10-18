`timescale 1ns/1ps

module tb_race_arbiter();
  reg en, fin1, fin2; // instantiating inputs to race arbiter
  wire out;           // instantiating output to race arbiter

  race_arbiter dut(.finished1(fin1), .finished2(fin2), .enable(en), .out(out)); // instantiating race arbiter DUT

  initial begin
    $display("Start of Race Arbiter Test");
    $monitor("Output of Race Arbiter: %d \t Time: %d", out, $time);
    
    // Initialization with ordering
    fin1 = 1;
    fin2 = 1;
    en = 0;
    #50;
    
    $finish;
  end

  always #5 en = !en;

endmodule
