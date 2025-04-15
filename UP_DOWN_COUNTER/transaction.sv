class transaction;
  rand bit up_down;
  bit rst;
  bit [3:0] count;
  
  static bit first = 1;
  
  function post_randomize();
    if(first) begin
      	rst   = 1;
      	first = 0;
    end
    else begin
      	rst = 0;
    end
  endfunction
  
  constraint range{up_down dist {1:=60, 0:=30};}
  

function void display(string name);
  $display("class=%s",name);
  $display("time=%0t,rst=%b, up_down=%b, count=%b",$time, rst,up_down,count);
endfunction

endclass
