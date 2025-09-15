//Constraint to generate an array of size 8 where each element is strictly increasing by 2.
class base;
  rand int a[];
  constraint a_size{a.size == 8;}
  constraint a0_data{a[0] inside {[1:100]};}
  constraint data_a{foreach(a[i])
                      if(i<a.size-1)
                        a[i+1] == a[i] + 2;
                   }
endclass

base b1;

module test;
  initial begin
    b1 = new;
    b1.randomize();
    $display("%p", b1.a);
  end
endmodule
