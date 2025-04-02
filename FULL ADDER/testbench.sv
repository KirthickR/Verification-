`include "interface.sv"
`include "test.sv"

module testbench;
  intf intff();
  test tst(intff);
  
  full_adder dut(.a(intff.a),
                 .b(intff.b),
                 .c(intff.c),
                 .sum(intff.sum),
                 .carry(intff.carry));
  
//   full_adder uut(intff);
endmodule
