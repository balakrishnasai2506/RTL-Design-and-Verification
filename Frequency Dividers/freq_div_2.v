//Frequency Division by 2 (25% Duty Cycle)
module freq_div_2(input clk, rst, output reg out_d, q, output clk_out);

    wire w1;
    
    always@(posedge clk or negedge rst) begin
        if(!rst)
            out_d <= 0;
        else
            out_d <= ~out_d;
    end
    
    assign w1 = out_d;
    
    always@(negedge clk or negedge rst) begin
        if(!rst)
            q <= 0;
        else
            q <= w1;
    end
    
    
    assign clk_out = w1 && q;
    
endmodule
