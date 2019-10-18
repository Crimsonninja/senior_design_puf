`timescale 1ns/1ps
/*
* This up counter starts at some initial value. If reset is set to 1, it will
* go back to the inital value.
*/
module up_counter    (
out     ,  // Output of the counter
enable  ,  // enable for counter
in      ,  // starting value of counter
clk     ,  // clock Input
reset      // reset Input
);
//----------Output Ports--------------
  output reg [7:0] out;
//------------Input Ports--------------
  input enable, clk, reset;
  input [7:0] in;
//-------------Code Starts Here-------
  always @(posedge clk) begin
    if (reset) begin
      out <= in;
    end else if (enable) begin
      out <= out + 1;
    end
  end

endmodule
