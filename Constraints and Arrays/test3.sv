// Constraint for a 16-element array representing memory addresses, ensuring no duplicates.
class memory_addr;
  rand bit[31:0] addr[];
  constraint addr_size{addr.size() == 16;}
  constraint no_duplicate{foreach(addr[i]) foreach(addr[j])
    						            if(i<j)
      							          addr[i]!=addr[j];
                         }
endclass

memory_addr mem_addr;

module test;
  initial begin
    mem_addr = new;
    mem_addr.randomize();
    $display("%p", mem_addr);
  end
endmodule
