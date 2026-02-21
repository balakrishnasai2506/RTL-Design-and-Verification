module siso#(parameter N = 4)(input din, clk, rstn, output out);
    reg[N-1:0] q;
    
    always@(posedge clk) begin
        if (!rstn)
            q <= 'b0;
        else
            q <= {din, q[N-1:1]};
    end

    assign out = q[0];
endmodule
