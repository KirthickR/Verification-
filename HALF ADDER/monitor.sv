class monitor;
  virtual intf vif;
  mailbox mon2scb;
  transaction trans;
  
  function new(virtual intf vif, mailbox mon2scb);
    this.mon2scb=mon2scb;
    this.vif = vif;
  endfunction
  
  task main();
    trans=new();
    begin
      
      
      for(int i=0;i<4;i++)begin
      
         #2;
        trans.a=vif.a;
        trans.b=vif.b;
        trans.sum=vif.sum;
        trans.carry=vif.carry;
        
        mon2scb.put(trans);
        trans.display("MONITOR CLASS SIGNALS");
        #3;
      end
    end
  endtask
endclass
