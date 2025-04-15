class driver;
  virtual intf vif;
  mailbox gen2drv;
  transaction trans;
  
  function new(virtual intf vif, mailbox gen2drv);
    this.vif=vif;
    this.gen2drv=gen2drv;
  endfunction
  
  task main();
    trans=new();
    repeat(20)begin
    gen2drv.get(trans);
   //   @(posedge vif.clk)
        
        vif.rst = trans.rst;
        vif.up_down=trans.up_down;
      
      $display("trans.up_down=%0b",trans.up_down);
      
      trans.display("DRIVER CLASS SIGNALS");
    end
  endtask
endclass
      
