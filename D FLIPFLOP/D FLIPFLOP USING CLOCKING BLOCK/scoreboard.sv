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
     #3;

      mon2scb.get(trans);
      trans.display("SCOREBOARD CLASS SIGNALS");
      
      if(((trans.d == trans.q) && (trans.qbar == ~trans.q)) ||  ((!trans.rst) && (trans.q == 0) && (trans.qbar == 1)))
        $display("STATUS:Testcase Pass");
      else
        $display("STATUS:Testcase fail");
      #1;
      ->my_event;
      trans.display_l();
      
    end
  endtask
endclass
