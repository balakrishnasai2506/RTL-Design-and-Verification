//  Triangle pattern: Constrain random variables to form the printed pattern: 1, 22, 333, 4444, 55555 (as rows).
class base;
  rand int num;
  int a[];
  constraint num_val{ num == 10;}
  function void post_randomize();
    for(int i = 0; i < num; i++)  begin
      for(int j = 0; j <= i; j++) begin
        $write("%0d", i+1);
      end
      $write("\n");
    end
  endfunction
endclass

base b1;

module test;
  initial begin
    b1 = new;
    b1.randomize();
  end
endmodule

/* Output:
# KERNEL: 1
# KERNEL: 22
# KERNEL: 333
# KERNEL: 4444
# KERNEL: 55555
# KERNEL: 666666
# KERNEL: 7777777
# KERNEL: 88888888
# KERNEL: 999999999
# KERNEL: 10101010101010101010
*/
