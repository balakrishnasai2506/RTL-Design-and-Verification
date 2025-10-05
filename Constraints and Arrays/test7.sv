//Basic range: Randomize an integer `a` between 10 and 50, excluding multiples of 5.

class base;
  rand int a;
  constraint a_val{a inside {[10:50]};}
  constraint a_valid_val{a % 5 != 0;}
endclass

base b1;

module test;
  initial begin
    b1 = new;
    repeat(10) begin
      b1.randomize();
      $display("The value of a is : %0d", b1.a);
    end
  end
endmodule

/*Output : 
# KERNEL: The value of a is : 13
# KERNEL: The value of a is : 14
# KERNEL: The value of a is : 19
# KERNEL: The value of a is : 23
# KERNEL: The value of a is : 26
# KERNEL: The value of a is : 47
# KERNEL: The value of a is : 46
# KERNEL: The value of a is : 39
# KERNEL: The value of a is : 18
# KERNEL: The value of a is : 39
*/
