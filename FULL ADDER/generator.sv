class generator;
  transaction trans;
  mailbox gen2drv;
  
  function new(mailbox gen2drv);
    this.gen2drv=gen2drv;
  endfunction
  
  task main();
      trans=new();
    
      for(int i=0;i<8;i++)begin
        trans.randomize();
        
        trans.display("GENERATOR SIGNALS");
        gen2drv.put(trans);
      #5;
      end
    
  endtask
  
endclass
