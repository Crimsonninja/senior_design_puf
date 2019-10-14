module shift_register (clk, in, out);
  input clk, in;
  output [7:0] out;
  reg [7:0] tmp;

  always @(posedge clk) begin
    //tmp = tmp << 1;
    //tmp[0] = SI;
    tmp = {tmp[6:0],in}
  end

  assign out  = tmp;
endmodule
