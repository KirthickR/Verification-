`include "interface.sv"
`include "test.sv"
module testbench;
  intf intff();
  test tst(intff);
  
  
  initial begin
   intff.clk=0;
  forever #2 intff.clk=~intff.clk;
  end
  updown_counter uut(.clk(intff.clk),
                     .rst(intff.rst),
                     .up_down(intff.up_down),
                     .count(intff.count)
                    
                    );
  

    endmodule
  
