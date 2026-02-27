//Assert that a `req` pulse is followed by `ack` within 2 cycles.

module assert1;
        bit clk;
        logic req, ack;


        property p1;
                @(posedge clk) $rose(req) |-> ##[0:2] ack;
        endproperty

        assert property (p1)
                $display("Assertion Passed");
        else
                $display("Assertion Failed");

        cover property (p1);

endmodule
