// Unique array: Generate an array of 6 unique random values in the range [1:30].
class base;
  rand int a[];
  constraint a_size{a.size() == 6;}
  constraint a_val{foreach(a[i]) a[i] inside {[1:30]};}
  constraint a_valid{unique {a};}
endclass

base b1;

module test;
  initial begin
    b1 = new;
    b1.randomize();
    $display("%p", b1.a);
  end
endmodule
