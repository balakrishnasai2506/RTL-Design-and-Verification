module sync_dp_ram_tb;

    reg clk;
    reg rst;
    reg wr_en, rd_en;
    reg [3:0] wr_addr, rd_addr;
    reg [7:0] din;
    wire [7:0] dout;

    // Instantiate DUT
    sync_dp_ram dut (
        .dout(dout),
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .wr_addr(wr_addr),
        .rd_addr(rd_addr),
        .din(din)
    );

    // Clock generation
    always #5 clk = ~clk;

    // -----------------------------
    // TASKS
    // -----------------------------

    task reset_dut;
    begin
        rst = 0;
        wr_en = 0;
        rd_en = 0;
        #10;
        rst = 1;
        #10;
    end
    endtask


    task write_mem(input [3:0] addr, input [7:0] data);
    begin
        @(posedge clk);
        wr_en = 1;
        rd_en = 0;
        wr_addr = addr;
        din = data;
        
        @(posedge clk);
        wr_en = 0;
    end
    endtask


    task read_mem(input [3:0] addr);
    begin
        @(posedge clk);
        rd_en = 1;
        wr_en = 0;
        rd_addr = addr;

        @(posedge clk);
        $display("Read Addr=%0d Data=%0h", addr, dout);
        rd_en = 0;
    end
    endtask


    task rw_same_addr(input [3:0] addr, input [7:0] data);
    begin
        @(posedge clk);
        wr_en = 1;
        rd_en = 1;
        wr_addr = addr;
        rd_addr = addr;
        din = data;

        @(posedge clk);
        $display("Same Addr RW: Addr=%0d Read=%0h (Old Value Expected)", addr, dout);

        wr_en = 0;
        rd_en = 0;
    end
    endtask

    // -----------------------------
    // TEST SEQUENCE
    // -----------------------------

    initial begin
        clk = 0;
        reset_dut();

        // Test 1: Write and Read
        write_mem(4'd7, 8'hAA);
        read_mem(4'd7);

        // Test 2: Different address RW
        write_mem(4'd3, 8'h55);
        read_mem(4'd3);

        // Test 3: Boundary
        write_mem(4'd0, 8'h11);
        read_mem(4'd0);

        write_mem(4'd15, 8'hFF);
        read_mem(4'd15);

        // Test 4: Same Address RW
        rw_same_addr(4'd7, 8'h77);

        #20;
        $finish;
    end

endmodule
