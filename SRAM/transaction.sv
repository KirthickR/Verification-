class transaction;
  
  localparam DATA=4;
  localparam ADDR=2;
  
  rand bit we;
  rand bit re;
  rand bit [DATA-1:0] data_in;
  randc bit [ADDR-1:0] addr;
  bit [DATA-1:0] data_out;
  
  constraint wr{ re != we ; }
  
  function void display(string name);
    $display("class=%s",name);
    $display("time=%0t, we=%b, re=%b, data_in=%b,addr=%b, data_out=%b",$time,we,re,data_in,addr,data_out);
  endfunction
endclass
  
