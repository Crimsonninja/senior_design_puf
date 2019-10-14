module race_arbiter(finished1, finished2, enable, out);
  output reg out;
  input enable, finished1, finished2;

  wire cnt1_done, cnt2_done, winner;

  assign cnt1_done = finished1 & ~ cnt2_done;
  assign cnt2_done = finished2 & ~ cnt1_done;
  assign winner = cnt1_done | ~ cnt2_done;

  always@(negedge enable) begin
    out <= winner;
  end
endmodule
