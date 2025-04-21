module sp_ram #(parameter DATA=4,ADDR=2) (
  input clk,
  input we,
  
  input re,
  input [ADDR-1:0] addr,
  input [DATA-1:0] data_in,
  output reg [DATA-1:0] data_out
);

//   parameter DATA = 4;
//   parameter ADDR = 2;
  reg [DATA-1:0] mem [(2**ADDR)-1:0];

  always @(posedge clk) begin
     if (we & !re)
      mem[addr] <= data_in;   
    else if(re & !we)
      data_out <= mem[addr];       
  end
endmodule
