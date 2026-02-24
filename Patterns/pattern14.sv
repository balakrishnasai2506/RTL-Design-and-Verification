// Patterned sequence: Make a sequence 1,2,3,1,2,3,... of length 12 using constraints only.

class pattern;
  rand int seq[12];
  constraint seq_val{foreach(seq[i]) seq[i] inside {[1:3]};}
  constraint valid_seq{foreach(seq[i]) seq[i] == (i%3)+1;}
endclass

pattern p_seq;

module test;
  initial begin
    p_seq = new;
    assert(p_seq.randomize());
    $display("%p", p_seq.seq);
  end
endmodule
