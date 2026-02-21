module det_101_tb();
    reg in, clk, rst;
    wire out;
    
    det_101 uut(.x(in), .clk(clk), .rstn(rst), .y(out));
    
    //Clock Generation
    initial clk = 0;
    always #5 clk = ~clk;

    //Task to Reset
    task reset();
        begin
            rst = 1'b0;
            #10;
            rst = 1'b1;
        end    
    endtask
    
    // Inputs Task
    task input_apply(input data);
        begin
            in = data;
            #10;
        end
    endtask
    
    //Stimulus
    initial begin
        reset();
        input_apply(1);
        input_apply(0);
        reset();
        input_apply(1);
        input_apply(0);
        input_apply(0);
        input_apply(1);
        input_apply(0);
        input_apply(1);
        
        #20;
        $finish;
    end
    
    initial
        $monitor("TIME = %0d\t|\tINPUT = %0b\t|\tOUTPUT = %0b", $time, in, out);  
endmodule
