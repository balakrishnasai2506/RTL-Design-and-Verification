module freq_div_2_tb();
    reg clk, rst;
    wire out_d, q, clk_out;
    
    freq_div_2 uut (clk, rst, out_d, q, clk_out);
    
    initial clk = 0;
    always #5 clk = ~clk;
    
    initial begin
        rst = 1'b0;
        #10;
        rst = 1'b1;
        #100;
        $finish;
    end
        
endmodule
