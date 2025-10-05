//Weighted probability: Random variable x in [1:10] with values 2 and 4 three times more likely than others.
class base;
  rand int x;
  constraint values{x inside {[1:10]};}
  constraint val_dist{x dist {2 := 3, 4 := 3, 1 :/ 1, 3 :/ 1, [5:10] :/ 1};}
endclass

base b1;

module test;
  initial begin
    b1 = new;
    repeat(20) begin
    b1.randomize();
    $display("%0d", b1.x);
    end
  end
endmodule

/* OUTPUT:
# KERNEL: 2
# KERNEL: 4
# KERNEL: 4
# KERNEL: 2
# KERNEL: 7
# KERNEL: 4
# KERNEL: 4
# KERNEL: 2
# KERNEL: 5
# KERNEL: 4
# KERNEL: 3
# KERNEL: 1
# KERNEL: 2
# KERNEL: 4
# KERNEL: 1
# KERNEL: 2
# KERNEL: 3
# KERNEL: 4
# KERNEL: 4
# KERNEL: 2
*/
