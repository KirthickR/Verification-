class scoreboard #(parameter DATA=4, ADDR=2);
  
  
  transaction trans;
  mailbox mon2scb;
  event my_event;
  bit [3:0]temp_mem [(2**ADDR)-1:0];
  
  
  function new(mailbox mon2scb);
    this.mon2scb=mon2scb;
  endfunction
  
  task main();
    trans=new();
    repeat(100)begin
      mon2scb.get(trans);
      trans.display("SCOREBOARD SIGNALS");
      
      
      if( trans.we )begin
        temp_mem[trans.addr]=trans.data_in;
        $display("%p",temp_mem);
      end
      
      else begin
       if( trans.re )begin
         $display("********************************");
          $display("           PASS                 ");
          $display("********************************");
       end
          
          else begin
            $display("********************************");
            $display("           FAIL                   ");
            $display("********************************");
            $display("temp data - %b",temp_mem[trans.addr]);
            $display("trans data - %b", trans.data_out );
       end
        
      end
        ->my_event;
    end
      endtask
      
endclass
  
  
