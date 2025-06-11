class transaction;
  rand bit d;
   bit rst;

  bit q;
  bit qbar;
  //static bit firstcycle =1;
  
  //constraint rs{
    //if(firstcycle)
 // rst==1;
    //else
//  rst==0;}
  
  //function post_randomize();
    //if(rst==1)
 // firstcycle=0;
  //endfunction


function void display(string name);
  $display("signals=%s",name);
  $display("time=%0t,d=%b,rst=%b,q=%b,qbar=%b",$time,d,rst,q,qbar);
endfunction

function void display_l();
  $display("###################################");
endfunction
endclass

  
