//Generate a constraint such that we get a pattern 1010101010101010101010 999999999 88888888 7777777 ......
class pattern_gen;
  rand int num;
  constraint num_size{num == 10;}
  function void post_randomize();
    for(int i = num; i >= 1; i--) begin
      for(int j = i; j >= 1; j--) begin
        $write("%0d", i);
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
