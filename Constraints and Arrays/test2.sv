// Generate a random queue of 6 elements, where the sum of all elements = 100.
class base;
  rand int q[$];
  constraint q_size{q.size() == 6;}
  constraint q_sum{q.sum() == 100;}
  constraint q_data{foreach(q[i])
                      q[i] inside {[1:100]};}
endclass

base b1;

module test;
  initial begin
    b1 = new;
    b1.randomize();
    $display("%p", b1);
  end
endmodule
