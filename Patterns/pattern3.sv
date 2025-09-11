//Staircase increment: Array size 7. The first number random between 1–10. Each subsequent number must be previous number +3.
class pattern;
  rand int a[];
  constraint size_a { a.size == 7; }
  constraint a_num { a[0] inside {[1:10]}; }
  constraint valid_a { foreach(a[i])
                        if (i > 0)
                          a[i] == a[i-1] + 3;}
endclass

pattern p;
 
module test;
  initial begin
    p = new;
    p.randomize();
    $display("%p",p);
  end
endmodule
