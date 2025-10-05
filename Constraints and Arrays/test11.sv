//Exact sum: Generate 5 integers (1–20) whose sum is exactly 50.
class base;
  rand int arr[5];
  constraint values{foreach(arr[i]) arr[i] inside {[1:20]};}
  constraint sum_elements{arr.sum == 50;}
endclass

base b1;

module test;
  initial begin
    b1 = new;
    b1.randomize();
    $display("%p", b1);
    $display("SUM OF ARRAY ELEMENTS : %0d", b1.arr.sum);
  end
endmodule

/* OUTPUT:
# KERNEL: '{arr:'{11, 12, 5, 19, 3}}
# KERNEL: SUM OF ARRAY ELEMENTS : 50
*/
