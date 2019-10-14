module up_counter    (
out     ,  // Output of the counter
enable  ,  // enable for counter
clk     ,  // clock Input
reset      // reset Input
);
//----------Output Ports--------------
  output reg [7:0] out;
//------------Input Ports--------------
  input enable, clk, reset;
//-------------Code Starts Here-------
  always @(posedge clk) begin
    if (reset) begin
      out <= 8'b0 ;
    end else if (enable) begin
      out <= out + 1;
    end
  end

endmodule
