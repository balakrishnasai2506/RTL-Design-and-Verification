// Create an array of 12 elements where every third element is divisible by 7.

module test;
  int arr[];
  initial begin
    arr = new[12];
    foreach(arr[i]) begin
      if(i % 3 == 0)
        arr[i] = $urandom_range(0,10) * 7;
      else
        arr[i] = $urandom_range(0,20);
    end
    $display("%p", arr);
  end
endmodule
