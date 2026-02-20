module mux_tb;
  reg [3:0]in;
  reg [1:0] sel;
  wire out;
  
  mux4x1 uut(in, sel, out);
  
  initial begin
    sel = 2'b00; in = 4'b1010;
    #10;
    sel = 2'b01;
    #10;
    sel = 2'b10;
    #10;
    sel = 2'b11;
    #10;
    $finish;
  end
  
  initial
    $monitor("Sel = %0b, OUTPUT = %0b", sel, out);
endmodule
