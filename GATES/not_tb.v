module not_tb();
	reg a;
	wire y;
	
	not_gate uut(a,y);
	
	initial begin
		//Test Cases
		a = 1'b0;
		#5;
		a = 1'b1;
		#5;
		$finish;
	end
	
	initial
		$monitor("time = %0t \t a = %0b \t y = %0b", $time, a, y);
endmodule
		
