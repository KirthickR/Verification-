class monitor;
  transaction trans;
  virtual intf vif;
  mailbox mon2scb;
  
  function new(virtual intf vif,mailbox mon2scb);
    this.vif=vif;
    this.mon2scb=mon2scb;
  endfunction
  
  task main();
    trans=new();
    repeat(100)begin
// #3;
      @(posedge vif.clk)
      trans.we       <= vif.we;
      trans.re 	     <= vif.re;
      trans.addr     <= vif.addr;
      trans.data_in  <= vif.data_in;
      trans.data_out <= vif.data_out;
#1;
      
      mon2scb.put(trans);
      
      
      trans.display("MONITOR CLASS SIGNALS");
    end
  endtask
endclass
      
  
