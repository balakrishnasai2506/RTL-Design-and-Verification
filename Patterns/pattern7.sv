//Random 0 insertion : Array size 10. All even indices fixed at 0, odd indices random between 1–50.
class pattern;
  rand int a[];
  constraint size_a{a.size == 10;}
  constraint valid_a{foreach(a[i])
    					if(i%2 == 0) a[i] == 0;
                     	else a[i] inside {[1:50]};}
endclass

pattern p;

module test;
  initial begin
  	p = new;
  	p.randomize();
  	$display("%p",p.a);
  end
endmodule
