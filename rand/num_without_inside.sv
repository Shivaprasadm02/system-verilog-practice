class num_34_43;
    rand bit [7:0] num;
 constraint constr_4_10 { num> 34 && num<43; }
endclass

module without_inside;
    num_34_43 h;
    initial 
	begin
      	h = new();
  	repeat(10)
	   begin
       		 h.randomize();
      		  $display("number bw 34 and 43 : %0d", h.num);
   	   end
              end
endmodule
