interface intf();
  logic d;
  logic clk;
  logic rst;
  logic q;
  logic qbar;
  
  clocking drv_cb @(posedge clk);
   output d, rst;
 endclocking 
  
  clocking mon_cb @(posedge clk);
    input rst,d,q,qbar;
  endclocking
endinterface
