interface intf #(parameter WIDTH = 4);

  logic clk;
  logic rst;
  logic up_down;
  logic [WIDTH-1:0] count;

endinterface
