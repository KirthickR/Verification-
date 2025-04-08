`include "interface.sv"
`include "test.sv"
module testbench;
  intf intff();
  test tst(intff);
  
  dff dut(.d(intff.d),
          .clk(intff.clk),
          .rst(intff.rst),
          .q(intff.q),
          .qbar(intff.qbar));
  
  initial intff.clk=0;
   
  always #2 intff.clk=~intff.clk;
  

     
endmodule
  
  
