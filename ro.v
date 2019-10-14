module ro(enable, w16);

  input enable;
  output w16;

  wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15;

  assign w16 = enable & w15;
  assign w15 = ~ w14; // w15 is the output we are interested in
  assign w14 = ~ w13;
  assign w13 = ~ w12;
  assign w12 = ~ w11;
  assign w11 = ~ w10;
  assign w10 = ~ w9;
  assign w9 = ~ w8;
  assign w8 = ~ w7;
  assign w7 = ~ w6;
  assign w6 = ~ w5;
  assign w5 = ~ w4;
  assign w4 = ~ w3;
  assign w3 = ~ w2;
  assign w2 = ~ w1;
  assign w1 = ~ w16;

endmodule
