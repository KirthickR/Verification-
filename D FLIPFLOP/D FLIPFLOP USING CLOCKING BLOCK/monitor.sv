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
     #2;
     @(vif.mon_cb)
  #2; 
  trans.d    = vif.mon_cb.d;
  trans.rst  = vif.mon_cb.rst;
  trans.q    = vif.mon_cb.q;
  trans.qbar = vif.mon_cb.qbar;
      trans.display("MONITOR CLASS SIGNALS");
     #2;
  mon2scb.put(trans);
 
end

  endtask
endclass
