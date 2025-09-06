module tb;
  reg pin, clk, rst;
  wire pout;
  
  ps dut (.pin(pin), .clk(clk), .rst(rst), .pout(pout));
  
  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk; // 10ns period clock
  
  // Reset task
  task reset;
    begin
      rst = 1'b0;
      #10;        // hold reset low for >1 clock
      rst = 1'b1;
    end
  endtask
  
  initial begin
    // Initialize
    pin = 0;
    rst = 1;
    // Apply reset
    reset();
    // Apply a 1-cycle pulse on pin
    @(posedge clk);
    pin = 1;
    @(posedge clk);
    pin = 0;
    // Wait some cycles to observe stretched pulse
    repeat(10) @(posedge clk);
    $finish;
  end

  // VCD dump for EPWave
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
  end
endmodule
