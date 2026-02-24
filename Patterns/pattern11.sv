// Modular sum: Five numbers in [0:9] whose sum modulo 7 equals 3.
class modular_sum;
  rand int arr[];
  constraint arr_size{arr.size() == 5;}
  constraint arr_val{foreach(arr[i]) arr[i] inside {[0:9]};}
  constraint valid_val{(arr.sum())%7 == 3;}
endclass

modular_sum m1;

module test;
  initial begin
    m1 = new;
    assert(m1.randomize());
    $display("%p", m1);
  end
endmodule
