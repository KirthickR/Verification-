class driver;

  virtual intf vif;
  transaction trans;
  mailbox gen2drv;

  function new(virtual intf vif, mailbox gen2drv);
    this.vif = vif;
    this.gen2drv = gen2drv; 
  endfunction

  
  task main();
    trans = new();
    repeat (100) begin
      gen2drv.get(trans);  
		
      
      vif.we      <= trans.we;
      vif.re      <= trans.re;
      vif.addr    <= trans.addr;
      vif.data_in <= trans.data_in;
	  #3;
      
      trans.display("DRIVER CLASS SIGNALS");
    end
  endtask

endclass
