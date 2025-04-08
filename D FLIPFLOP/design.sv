module dff(q,qbar,clk,d,rst);
  input clk,rst;
  input d;
  output reg q;
  output reg qbar;
  
  always@(posedge clk)begin
    if(rst)
      q<=0;
    else
      q=d;
    
    qbar=~q;
  end
 
endmodule
