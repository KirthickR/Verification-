class monitor;
  
  transaction trans;
  virtual intf vif;
  mailbox mon2scb;
  
  function new(mailbox mon2scb,virtual intf vif);
 
    this.mon2scb=mon2scb;
    this.vif=vif;
  endfunction 
  
  task main();
    trans=new();
    repeat(20)begin
      
     @(posedge vif.clk) 
    
      trans.up_down <= vif.up_down;
      trans.count <= vif.count;
      trans.rst <= vif.rst;
      
      #1;
      $display("vif.count=%0b",vif.count);
            mon2scb.put(trans);
      trans.display("MONITOR CLASS SIGNALS");
    end
  endtask
endclass
      
