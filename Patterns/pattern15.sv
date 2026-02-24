//Distance constraint: Two random ints a,b in [0:100] such that |a-b| >= 20.

class distance;
  rand int a, b;
  constraint val_ab{a inside {[0:100]}; b inside {[0:100]};}
  constraint valid{(a - b) >= 20 || (b - a) >= 20;}
endclass

distance d;

module test;
  initial begin
    d = new;
    assert(d.randomize());
    $display("%p", d);
  end
endmodule
