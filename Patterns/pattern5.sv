//Unique numbers: Array size 8. All numbers between 1–20 but no repetitions.
class pattern;
  rand int a[];
  constraint size{a.size == 8;}
  constraint a_val{foreach(a[i]) a[i] inside {[1:20]};}
  constraint no_dup_c {foreach(a[i]) foreach(a[j])
      if(j < i) a[i] != a[j];}
endclass

pattern p;

module test;
  initial begin
    p = new;
    p.randomize();
    $display("%p",p.a);
  end
endmodule
