// Matrix constraints: 4x4 matrix where diagonal=0, other elements 1–9, and no row/column repeats.

class matrix;
  rand int arr[4][4];
  constraint arr_val{foreach(arr[i,j])
    if(i == j) arr[i][j] == 0;
                     else
                       arr[i][j] inside {[1:9]};}
  constraint row_unique {
  foreach(arr[i,j])
    foreach(arr[i,k])
      if (j < k && j != i && k != i)
        arr[i][j] != arr[i][k];
}
  constraint col_unique {
  foreach(arr[i,j])
    foreach(arr[k,j])
      if (i < k && i != j && k != j)
        arr[i][j] != arr[k][j];
}
  
  function void print_matrix();
    foreach(arr[i,j]) begin
      $write("%0d ", arr[i][j]);
    if(j == 3)
      $display("");
    end
  endfunction
endclass

matrix m;

module test;
  initial begin
    m = new;
    assert(m.randomize());
    m.print_matrix();
  end
endmodule
