module tb_ro();
  reg en;

  wire out;

ro ro0(en, out);

initial
begin
  $display(“Start of Ring Oscillator Test”);
  $monitor("Output of ro0: %d",out);
  en=1;
  #60;
  en=0;
  #10;

  $finish;
end

endmodule

endmodule
