class driver;
  transaction trans;
  mailbox gen2drv;
  virtual intf vif;
  
  
  function new(mailbox gen2drv,virtual intf vif);
    this.gen2drv=gen2drv;
    this.vif=vif;
  endfunction
  
  task main();
    transaction trans;
    trans = new();
    repeat(6) begin
      #1;
      
      gen2drv.get(trans);
      
      //@(posedge vif.clk)
      //#2;
      vif.drv_cb.rst <= trans.rst;
      vif.drv_cb.d <= trans.d;
      
      @(vif.drv_cb)
      
      trans.display("DRIVER CLASS SIGNALS");
    end
  endtask
endclass
