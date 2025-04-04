class transaction;
  rand bit[1:0]ab;
   bit a;
     bit b;
  bit sum,carry;
  
function void post_randomize();
  a=ab[0];
  b=ab[1];
endfunction 

function void display(string name);
  $display("signals=%s",name);
  
  $display("a=%b,b=%b,sum=%b,carry=%b", a,b,sum,carry);
endfunction

function void display_l();
  $display("******************************");
endfunction
  
endclass
