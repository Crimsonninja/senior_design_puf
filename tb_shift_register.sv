module tb_shift_register();
  reg clk, in;  // Instantiating inputs of shift register
  wire out;     // Instantiating output of shift register
  
  shift_register dut(.clk(clk), .in(in), .out(out)); // Instantiating shift register dut

  initial begin
    clk = 0;
    in = 0;
    #6;
    in = 1;
    #20;
    in = 0;
    #70;
    $finish;
  end
  
  always #5 clk = !clk;

endmodule
