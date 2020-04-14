`timescale 1ns/1ps

module tb_post_mux_counter();
  reg en, clk, rst; // Instantiating inputs to post mux counter
  wire fin;         // Instantiating outputs to post mux counter
  wire [7:0] out;

  post_mux_counter dut(.out(out), .finished(fin), .enable(en), .clk(clk), .reset(rst)); // Instantiating Post-mux Counter dut
  
  initial begin
    $display("Start of Post-mux Counter");
    $monitor("Output of counter: %d \t Finished Val: %d \t Time: %d", out, fin, $time);

    // Initialization
    clk = 0;
    en = 0;
    rst = 1;
    #6;

    rst = 0;
    en = 1;
    #8000;
    
    $finish;
  end

  always #5 clk = !clk;
endmodule
