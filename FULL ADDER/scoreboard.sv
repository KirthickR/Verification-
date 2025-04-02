class scoreboard;
  transaction trans;
  mailbox mon2scb;
  
  function new(mailbox mon2scb);
    this.mon2scb=mon2scb;
  endfunction
  
  task main();
    for(int i=0;i<8;i++)begin
      #2;
      mon2scb.get(trans);
      trans.display("SCOREBOARD SIGNALS");
       
      if((trans.a^trans.b^trans.c == trans.sum)&&((trans.a& trans.b)|(trans.c& trans.b)|(trans.a& trans.c) == trans.carry))
        $display("testcase pass");
        
      
      else
      $display("testcase FAIL");
      
      trans.display_l();
      #3;
    end
  endtask
endclass
    
