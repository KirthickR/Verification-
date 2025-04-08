class transaction;
  rand bit d;
  bit rst;

  bit q;
  bit qbar;
  


function void display(string name);
  $display("signals=%s",name);
  $display("time=%0t,d=%b,rst=%b,q=%b,qbar=%b",$time,d,rst,q,qbar);
endfunction

function void display_l();
  $display("###################################");
endfunction
endclass

  
