//Generate a constraint such that it gives a pattern 1 23 456 78910......
class base;
  int num = 1;
  rand int rows;
  constraint row_size{rows == 5;}
  function void post_randomize();
    for(int i=0; i<rows; i++) begin
      for(int j=0; j<=i; j++) begin
        $write("%0d", num++);
      end
      $write("\t");
    end
  endfunction
endclass

base b1;

module test;
  initial begin
    b1 = new;
    b1.randomize();
    $display("%p",b1);
  end
endmodule

/* OUTPUT:
# KERNEL: 1	23	456	78910	1112131415	'{num:16, rows:5}
*/
