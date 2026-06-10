/*Write a constraint for a dynamic array such that all elements are unique except for 2 elements at 2 different positions*/

class dyn_class;
  rand int arr[];
  rand int idx1, idx2;
  constraint arr_size{arr.size() inside {[10:15]};}
  constraint arr_val{foreach(arr[i])
    arr[i] inside {[1:100]};}
  constraint unq_arr{unique{arr};}
  constraint idx_c{idx1 inside {[0:arr.size()-1]};
                   idx2 inside {[0:arr.size()-1]};
                   idx1 != idx2;}
  function void post_randomize();
    arr[idx2] = arr[idx1];
  endfunction
endclass

dyn_class d1;

module test;
  initial begin
    d1 = new;
    assert(d1.randomize());
    $display("%p", d1);
  end
endmodule


/* OUTPUT:
# KERNEL: Time: 0 ns,  Iteration: 0,  Instance: /test,  Process: @INITIAL#19_1@.
# KERNEL: '{arr:'{8, 68, 96, 91, 38, 2, 15, 7, 39, 64, 92, 88, 91, 93, 14}, idx1:12, idx2:3}
*/
