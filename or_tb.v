module or_tb();
	reg a,b;
	wire y;
	
	or_gate uut(a,b,y);
	
	initial begin
		//Test Cases
		{a,b} = 2'b00;
		#5;
		{a,b} = 2'b01;
		#5;
		{a,b} = 2'b10;
		#5;
		{a,b} = 2'b11;
		#5;
		$finish;
	end
	
	initial
		$monitor("time = %0t \t a = %0b \t b = %0b \t y = %0b", $time, a, b, y);
endmodule
		
