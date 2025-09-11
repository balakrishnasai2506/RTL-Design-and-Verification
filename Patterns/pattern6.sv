//Mirror pattern : Array size 9. First half random, second half is mirror of first half (palindrome-like array).
class pattern;
  rand int a[];
  constraint size_a{a.size == 9;}
  constraint a_val{foreach(a[i]) a[i] inside {[1:10]};}
  constraint pattern_gen{foreach(a[i])
    if (i < a.size/2)
        a[a.size-1 - i] == a[i];}
endclass

pattern p;

module test;
  initial begin
  	p = new;
  	p.randomize();
  	$display("%p",p.a);
  end
endmodule
