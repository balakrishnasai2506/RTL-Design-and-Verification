module bit_reverse #(parameter DATA_WIDTH=32) (input  [DATA_WIDTH-1:0] din, output logic [DATA_WIDTH-1:0] dout);

  reg [DATA_WIDTH-1:0]temp;

  integer i;

  always@(*) begin
    temp = din;
    for(i = 0; i < DATA_WIDTH; i = i + 1) begin
      dout[i] = temp[DATA_WIDTH-1-i];
    end
  end
  
endmodule
