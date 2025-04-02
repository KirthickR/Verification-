class monitor;

  mailbox mon2scb;
  transaction trans;
    virtual intf vif;
  
  function new(virtual intf vif,mailbox mon2scb);
    this.vif=vif;
    this.mon2scb=mon2scb;
  endfunction
  
  task main();
    begin
    for(int i=0;i<8;i++)begin
      trans=new();
      #2;
      trans.a=vif.a;
      trans.b=vif.b;
      trans.c=vif.c;
      trans.sum=vif.sum;
      trans.carry=vif.carry;
      
      mon2scb.put(trans);
      trans.display("MONITOR CLASS");
     #3;
    end
    end
  endtask
endclass
