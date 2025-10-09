//Increasing runs: Generate array where each prefix is strictly increasing (arr[i] < arr[i+1]).
class base;
  rand int arr[];
  constraint arr_size{arr.size() inside {[10:20]};}
  constraint arr_val_range{foreach(arr[i])
    arr[i] inside {[1:100]};}
  constraint valid_arr{foreach(arr[i]) if(i > 0) arr[i] > arr[i-1];}
endclass

base b1;

module test;
  initial begin
    b1 = new;
    b1.randomize();
    $display("%0d", b1.arr.size());
    $display("%p", b1);
  end
endmodule

/* OUTPUT:
# KERNEL: 13
# KERNEL: '{arr:'{9, 18, 19, 20, 21, 25, 29, 50, 71, 82, 84, 86, 87}}
*/
