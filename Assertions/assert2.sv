//Signal `start` must be high for exactly 3 consecutive cycles when asserted.

module assert2;
  bit clk;
  logic start;

  property start_assert;
    @(posedge clk) $rose(start) |-> (start == 1'b1)[*3] ##1 (start == 1'b0);
  endproperty

  assert property (start_assert)
    $display("ASSERTION PASSED");
  else
    $display("ASSERTION FAILED");

    cover property (start_assert);

endmodule
