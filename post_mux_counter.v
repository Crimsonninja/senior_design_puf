module post_mux_counter    (
out     ,  // Output of the counter
finished,  //
enable  ,  // enable for counter
clk     ,  // clock Input
reset      // reset Input
);

parameter GOAL = 512;

//----------Output Ports--------------
  output finished;
  output reg [10:0] out;
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

  always @(posedge clk) begin
    if(out == GOAL) begin
      finished = 1;
    end else begin
      finished = 0;
    end
  end

endmodule
