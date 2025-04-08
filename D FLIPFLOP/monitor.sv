class monitor;
  
  transaction trans;
  virtual intf vif;
  mailbox mon2scb;
  
  function new(virtual intf vif,mailbox mon2scb);
    this.vif=vif;
    this.mon2scb=mon2scb;
  endfunction
  
  task main();
      trans = new();  
   repeat(6) begin
  #3; 
  trans.d    = vif.d;
  trans.rst  = vif.rst;
  trans.q    = vif.q;
  trans.qbar = vif.qbar;
      trans.display("MONITOR CLASS SIGNALS");
  mon2scb.put(trans);
 
end

  endtask
endclass
