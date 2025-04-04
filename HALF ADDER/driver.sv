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
    begin
      for(int i=0;i<4;i++)begin
        #1;
        
        gen2drv.get(trans);
        
        vif.a=trans.a;
        vif.b=trans.b;
//         vif.sum<=trans.sum;
//         vif.carry<=trans.carry;
        
        trans.display("DRIVER CLASS SIGNALS");
        #4;
        
      end
    end
  endtask
endclass
