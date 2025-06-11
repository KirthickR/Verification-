class scoreboard;
  transaction trans;
  mailbox mon2scb;
  event my_event;
  
  function new(mailbox mon2scb );
    this.mon2scb=mon2scb;
  endfunction 
  
  task main();
    trans=new();
    repeat(6)begin
     

      mon2scb.get(trans);
      trans.display("SCOREBOARD CLASS SIGNALS");
      
      
      if ((trans.rst && (trans.q == 0) && (trans.qbar == 1)) || 
    (!trans.rst && (trans.q == trans.d) && (trans.qbar == ~trans.q)))
        $display("STATUS:Testcase Pass");
      else
        $display("STATUS:Testcase fail");
      ->my_event;
      trans.display_l();
      
    end
  endtask
endclass
