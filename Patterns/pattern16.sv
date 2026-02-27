// Hamming distance: Generate two 16-bit vectors with Hamming distance exactly 5.
class test;
  rand bit [15:0] a,b;
  constraint vals{a inside {[1:100]}; b inside {[1:100]};}
  constraint valid_hamm{ $countones(a ^ b) == 5;}
endclass

test t;

module pattern_test;
  initial begin
    t = new;
    assert(t.randomize());
    $display("a = %0d, b = %0d", t.a, t.b);
    $display("Hamming Distance = %0d", $countones(t.a ^ t.b));
  end
endmodule
