module siso_tb;
  reg data, clk, rst;
  wire out;
  
  siso uut(data, clk, rst, out);
  
  //Clock Generation
  initial clk = 0;
  always #5 clk = ~clk;
  
  //Task Reset
  task reset();
    begin
      rst = 0;
      repeat(2) @(posedge clk);;
      rst = 1;
    end
  endtask
  
  //Task enter data
  task data_in(input d);
    begin
      @(negedge clk);
      data = d;
    end
  endtask
  
  //Stimulus
  initial begin
    reset();
    data_in(1'b1);
    data_in(1'b0);
    data_in(1'b1);
    data_in(1'b0);
    repeat(6) @(posedge clk);
    $finish;
  end
  
  //Monitor outputs
  initial
    $monitor($time, "IN = %0b, OUT = %0b", data, out);
endmodule
