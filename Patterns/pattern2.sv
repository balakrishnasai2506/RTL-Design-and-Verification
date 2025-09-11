class pattern;
  rand int a[];
  constraint size_a{a.size == 10;}
  constraint pattern_gen{foreach(a[i])
    						a[i] == i/2 + 1;}
endclass

pattern p;
 
module test;
  initial begin
    p = new;
    p.randomize();
    $display("%p",p);
  end
endmodule

//OUTPUT : 1122334455
