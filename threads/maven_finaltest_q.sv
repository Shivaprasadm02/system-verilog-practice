make changes in begin-end block in given code such that D starts after any 2 of A,B,C are executed, declare any additional var of any data type if required 

module test();

	task automatic A();
		int i = $urandom%30;
		#(i);
    $display("TASK A started at:%0t",$time);
	endtask
	
	task automatic B();
		int i = $urandom%40;
		#(i);
    $display("TASK B started at:%0t",$time);
	endtask
	
	task automatic C();
		int i = $urandom%50;
		#(i);
    $display("TASK C started at:%0t",$time);
	endtask
	
	task D();
    $display("TASK D started at:%0t",$time);
	endtask
	
	initial
		begin
			fork
				B();
				C();
				A();
			join
	  	D();		
		end
endmodule

////////////////////////////////////////////////////////////////////////////////
////////////////////----------Solution------------------////////////////////////
////////////////////////////////////////////////////////////////////////////////

module test();
	semaphore sema = new(2);
	
	task automatic A();
		int i = $urandom%30;
		sema.get(1);
		#(i);
		$display("TASK A:%0t",$time);
		sema.put(2);
	endtask
	
	task automatic B();
		int i = $urandom%40;
		sema.get(1);
		#(i);
		$display("TASK B:%0t",$time);
		sema.put(2);
	endtask
	
	task automatic C();
		int i = $urandom%50;
		sema.get(1);
		#(i);
		$display("TASK C:%0t",$time);
		sema.put(2);
	endtask
	
	task D();
		sema.get(2);
		$display("TASK D:%0t",$time);
	endtask
	
	initial
		begin
			fork
				B();
				C();
				A();
			join_any
		D();
			
		end
endmodule
