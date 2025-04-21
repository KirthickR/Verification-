`include "test.sv"
`include "interface.sv"
module testbench;
  intf intff();
  
  test tst(intff);
  
   
  initial begin
    intff.clk=0;
    forever #2 intff.clk=~intff.clk;
//     #200;
//     $finish;
  end
  
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars();
  end
  
  
  
  sp_ram dut(.clk(intff.clk),
         .we(intff.we),
         .re(intff.re),
         .addr(intff.addr),
         .data_in(intff.data_in),
         .data_out(intff.data_out));
 
endmodule
