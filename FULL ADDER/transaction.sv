class transaction;
randc bit [2:0]abc;
      bit a,b,c;
	  bit sum,carry;

  function void post_randomize();
  a=abc[0];
  b=abc[1];
  c=abc[2];
endfunction

  function void display(string name);
    $display("signal=%s",name);
    $display("time=%0t,a=%b,b=%b,c=%b,sum=%b,carry=%b",$time,a,b,c,sum,carry);
  endfunction
  
  function void display_l();
    $display("x_x_x_x_x_x_x_x_x_x");
  endfunction 
endclass
