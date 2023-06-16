module events_ex;
  event ev_1; //declaring event ev_1
  
  initial begin
    fork
      //process-1, triggers the event
      begin
         $display($time,"\tTriggering The Event");
        ->ev_1;
      end
      
      //process-2, wait for the event to trigger
      begin
        $display($time,"\tWaiting for the Event to trigger in @");
        @(ev_1.triggered);
        $display($time,"\tEvent triggerd in @");
      end

      //process-3 wait for the event to trigger
      begin
        $display($time,"\tWaiting for the Event to trigger in wait");
        wait(ev_1.triggered);
        $display($time,"\tEvent triggerd in wait");
      end
    join
  end
endmodule
