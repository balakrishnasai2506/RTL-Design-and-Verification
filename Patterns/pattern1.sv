class pattern;
  rand int a[];
  constraint a_size{a.size == 10;}
  constraint pattern_gen{foreach(a[i])
    if(i % 2 == 0)
      a[i] == 0;
    else
      a[i] == (i/2 + 1);}
endclass

pattern p;

module test;
  initial begin
    p = new;
    p.randomize();
    $display("%p",p);
  end
endmodule

//OUTPUT : 0102030405
