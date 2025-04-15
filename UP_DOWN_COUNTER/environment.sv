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
  event my_event;
  
  function new(virtual intf vif);
    this.vif=vif;
    
    gen2drv=new();
    mon2scb=new();
    
    gen=new(gen2drv);
    drv=new(vif,gen2drv);
    mon=new(mon2scb,vif);
    scb=new(mon2scb);
    
    gen.my_event=my_event;
    scb.my_event=my_event;
    
    
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
  
