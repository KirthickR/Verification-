class scoreboard;
  transaction trans;
  mailbox mon2scb;
  
  function new(mailbox mon2scb);
    this.mon2scb=mon2scb;
    endfunction
  
  task main();
    trans=new();
    begin
      for(int i=0;i<4;i++)begin
        #3;
          mon2scb.get(trans);
          trans.display("SCOREBOARD CLASS SIGNALS");
      
        
        if(({trans.carry, trans.sum} == trans.a + trans.b))
          $display("testcase PASS");
        else
          $display("testcase FAIL");
        
      
        trans.display_l();
        #2;
      end
    end
  endtask
endclass
        
    
