//Generate a constraint such that it gives a pattern 1 22 333 4444 55555......
class pattern_gen;
  rand int num;
  constraint num_size{num == 10;}
  function void post_randomize();
    for(int i = 0; i < 10; i++) begin
      for(int j = 0; j <= i; j++) begin
        $write("%0d", i + 1);
      end
      $write("\t");
    end
  endfunction
endclass

pattern_gen pgen;

module test;
  initial begin
    pgen = new;
    pgen.randomize();
    $display("%p", pgen);
  end
endmodule
