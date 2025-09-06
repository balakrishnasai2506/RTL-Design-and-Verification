module ps(input pin, input clk, input rst, output reg pout);
  reg [1:0] count;

  always @(posedge clk) begin
    if (!rst) begin
      pout  <= 1'b0;
      count <= 2'b0;
    end
    else begin
      if (pin) begin
        count <= 2'b11;
      end
      else if (count != 0) begin
        count <= count - 1'b1;
      end

      pout <= (count != 0);
    end
  end
endmodule
