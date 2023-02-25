
module top();
 class transaction;
  static int i;
  int j;
   function static void fun_stat;
 	int b;
 	j++;
	i++;
	b++;
	$display("i is %d b is %d j is %0d",i,b,j);
	endfunction
endclass
transaction t1,t2;
initial
begin
t1=new();
t2=new();
t1.fun_stat();
t1.fun_stat();
t1.fun_stat();
t2.fun_stat();
end
endmodule
