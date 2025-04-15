module updown_counter #(parameter WIDTH=4)(
  input clk,
  input rst,
  input up_down,
  output reg [WIDTH-1:0]count);
  
  always@(posedge clk)
    begin
      if(rst)
        count<=0;
      else if(up_down)
        count<=count+1'b1;
      else if(!up_down)
        count<=count-1'b1;
    end
  endmodule
