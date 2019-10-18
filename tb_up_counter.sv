`timescale 1ns/1ps

module up_counter_test();
  reg en, clk, rst; // instantiating inputs to the counter
  reg [7:0] start;  
  wire [7:0] out;   // instantiating output to the counter

  up_counter dut(.out(out), .enable(en), .in(start), .clk(clk), .reset(rst));

  initial begin
    $display("Start of Up Counter Test");
    $monitor("Output of counter: %d \t Time: %d", out, $time);
    
    // Initialization
    clk = 0;
    start = 8'hFA;
    en = 0;
    rst = 1;
    #6; // Wait 6 time cycles because need to wait for the clock to initialize
    rst = 0;
    en = 1;
    #40;

    // Testing the reset. Should go back to "start" value and keep resetting back to that start value for the next 20 time cycles
    rst = 1;
    #20;

    // Start counting again
    rst = 0;
    #50;

    // Counter should stop counting at this point since enable signal is 0
    en = 0;
    #15;
    
    // Start counting again
    en = 1;
    #250;
    $finish;
  end
  
  always #5 clk = !clk;

endmodule
