module det_101(output y, input x, clk, rstn);
    
    parameter   S0 = 2'b00,
                S1 = 2'b01,
                S2 = 2'b10;
                
    reg [1:0] state, next_state;
    
    //Present State Logic
    always@(posedge clk) begin
        if(!rstn)
            state <= S0;
        else
            state <= next_state;
    end
    
    //Next state logic
    always@(state or x) begin
        next_state = S0;
        case(state)
            S0 : if(x) next_state = S1;
                 else next_state = S0;
            S1 : if(x) next_state = S1;
                 else next_state = S2;
            S2 : if(x) next_state = S1;
                 else next_state = S0;
            default : next_state = S0;
        endcase
    end
    
    //Output Logic
    assign y = (state == S2) && x;
endmodule
