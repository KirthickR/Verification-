class scoreboard;

  event my_event;
  mailbox mon2scb;
  transaction trans;
  bit[3:0] count; 
  
  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
   
    
  endfunction

  task main();
    trans = new();

    repeat (20) begin
      mon2scb.get(trans);

      trans.display("SCOREBOARD CLASS SIGNALS");

      if(trans.rst) begin
        count = 0;
      end
      else if(trans.up_down) begin
        count = count + 1;
      end
      else begin
        count = count - 1;
      end
      $display("count=%0d",count);
      if(count == trans.count) begin
        $display("*****************************************");
        $display("                PASS");
        $display("*****************************************"); 
      end
      else begin
        $display("*****************************************");
        $display("                FAIL");
        $display("*****************************************");
      end

      ->my_event;
    end
  endtask
endclass
