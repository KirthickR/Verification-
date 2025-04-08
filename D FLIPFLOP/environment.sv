`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
class environment;
  
  transaction trans;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scb;
  
  virtual intf vif;
  mailbox gen2drv;
  mailbox mon2scb;
  event myevent;
  
  function new(virtual intf vif);
    this.vif=vif;
    
    gen2drv=new();
    mon2scb=new();
    
    gen=new(gen2drv);
    drv=new(gen2drv,vif);
    mon=new(vif,mon2scb);
    scb=new(mon2scb);
    
    gen.my_event=myevent;
    scb.my_event=myevent;
  endfunction
  
    
  
    task test_run();
    fork 
      gen.main();
      drv.main();
      mon.main();
      scb.main();
    join
  endtask 
endclass
