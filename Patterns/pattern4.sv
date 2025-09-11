//Sum constraint: Array size 5. All numbers random between 1–10 but total sum must be exactly 25.
class pattern;
  rand int a[];
  constraint size{a.size == 5;}
  constraint a_val{foreach(a[i]) a[i] inside {[1:10]};}
  constraint a_sum{a.sum == 25;}
endclass

pattern p;

module test;
  initial begin
    p = new;
    p.randomize();
    $display("%p",p.a);
    $display("SUM : %0d", p.a.sum);
  end
endmodule
