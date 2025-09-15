// Constraint to create an array of size 9 with a mirror pattern (first half random, second half mirror).
class mirror_gen;
  rand bit[4:0] a[];
  constraint a_size{a.size() == 9;}
  constraint a_data{foreach(a[i])
                      if(i<a.size/2)
                        a[i] inside {[1:10]};}
  constraint a_mirror{foreach(a[i])
                        if(i>a.size/2)
                          a[i] == a[a.size-1-i];}
endclass

mirror_gen mgen;

module test;
  initial begin
    mgen = new;
    mgen.randomize();
    $display("%p", mgen);
  end
endmodule
      
