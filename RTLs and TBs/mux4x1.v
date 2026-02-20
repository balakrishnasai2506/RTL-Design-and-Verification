module mux4x1(input [3:0] i, [1:0] s, output y);
  wire w1, w2;
  
  mux2x1 m1(.out(w1), .i0(i[0]), .i1(i[1]), .s(s[0]));
  mux2x1 m2(.out(w2), .i0(i[2]), .i1(i[3]), .s(s[0]));
  mux2x1 m3(.out(y), .i0(w1), .i1(w2), .s(s[1]));
  
endmodule


//MUX 2X1
module mux2x1(input i0, i1, s, output out);
  assign out = s ? i1 : i0;
endmodule
