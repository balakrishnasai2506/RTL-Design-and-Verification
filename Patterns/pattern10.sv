// 3x3 Sudoku block: Generate a 3x3 array using numbers 1–9 with no repetition.
class sudoku;
  rand int arr[3][3];
  constraint val_arr{foreach(arr[i,j])
    arr[i][j] inside {[1:9]};}
  constraint unq_arr{unique {arr};}
  function void print_matrix();
    foreach(arr[i,j]) begin
    $write("%0d ", arr[i][j]);
    if(j == 2)
      $display("");
  end
  endfunction
endclass

sudoku s;

module test;
  initial begin
    s = new;
    assert(s.randomize());
    s.print_matrix();
  end
endmodule
    
