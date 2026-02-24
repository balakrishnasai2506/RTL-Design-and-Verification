// Increasing runs: Generate array where each prefix is strictly increasing (arr[i] < arr[i+1]).

class inc_run;
  rand int arr[];
  constraint arr_size{arr.size() == 10;}
  constraint val_arr{foreach(arr[i]) arr[i] inside {[1:20]};}
  constraint valid_arr{ foreach(arr[i]) if(i < arr.size()-1) arr[i] < arr[i+1];}
  constraint unq_arr{ unique {arr};}
endclass

inc_run i1;

module test;
  initial begin
    i1 = new;
    assert(i1.randomize());
    $display("%p", i1.arr);
  end
endmodule
