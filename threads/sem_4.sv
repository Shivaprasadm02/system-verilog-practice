/*
module semaphore_ex;
  semaphore sema; //declaring semaphore sema

  initial begin
    sema=new(1); //creating sema with '4' keys
    fork
      display(); //process-1
      display(); //process-2
     #60 display();//process-3
 display();	  //process-4
    join
$finish;
  end

  //display method
  task automatic display();
    sema.get(3); //getting '2' keys from sema
    $display($time,"\tgot kays %d",p);
    #30;
    sema.put(3); //putting '2' keys to sema
	$display("left keys");
  endtask
endmodule
*/
module semaphore_ex;
semaphore sema; //declaring semaphore sema

initial begin
sema=new(1); //creating sema with '4' keys
fork
display(2); //process-1
display(2); //process-2
join
end

//display method
task automatic display(int key);
sema.try_get(key);
begin //getting 'key' number of keys from sema
$display($time,"\tCurrent Simulation Time, Got %0d keys",key);
#30;
end
sema.put(key+1); //putting 'key' number of keys to sema
endtask
endmodule