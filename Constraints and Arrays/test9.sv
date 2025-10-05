// Odd/Evens order: Create an array of 10 integers where all odd numbers appear before even numbers.
class base;
  rand int a[];
  constraint a_size{a.size() == 10;}
  constraint a_val{foreach(a[i]) a[i] inside {[1:100]};}
  constraint odd_even{foreach(a[i])
    if(i < 5)
      a[i] % 2 != 0;
                      else
                        a[i] % 2 == 0;}
endclass

base b1;

module test;
  initial begin
    b1 = new;
    b1.randomize();
    $display("%p", b1.a);
  end
endmodule

/* Output:
# KERNEL: '{7, 93, 41, 67, 63, 6, 18, 80, 42, 72}
*/
