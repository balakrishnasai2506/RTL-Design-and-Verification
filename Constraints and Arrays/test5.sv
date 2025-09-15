//Generate an array of size 10 with random elements but their product must be a multiple of 64.

class base;
  rand bit[15:0] a[10];
  constraint a_val{foreach(a[i])
    a[i] % 64 == 0;}
endclass

base b1;

module test;
  initial begin
    b1 = new;
    b1.randomize();
    $display("%p", b1);
  end
endmodule
