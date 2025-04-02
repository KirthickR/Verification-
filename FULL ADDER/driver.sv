class driver;
  transaction trans;
  mailbox gen2drv;
  virtual intf vif;
  
  function new(virtual intf vif, mailbox gen2drv);
    this.vif=vif;
    this.gen2drv=gen2drv;
  endfunction
  
  task main();
     begin
      for(int i=0;i<8;i++)begin
      #1;

        gen2drv.get(trans);
        
        vif.a<=trans.a;
        vif.b<=trans.b;
        vif.c<=trans.c;
        
        trans.display("DRIVER SIGNALS");
        #4;
      end
    end
  endtask
endclass
        
        
