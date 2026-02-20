module sync_dp_ram(output reg [7:0] dout, input clk, rst, wr_en, rd_en, [3:0] wr_addr, [3:0] rd_addr, [7:0] din);
    reg [7:0] ram [15:0];
    integer i;
    
    always@(posedge clk) begin
        if(!rst) begin
            for(i=0; i<16; i = i+1)
                ram[i] <= 0;
            dout <= 0;
        end
        else begin
            if(wr_en)
                ram[wr_addr] <= din;
            if(rd_en)
                dout <= ram[rd_addr];
        end
    end
endmodule
