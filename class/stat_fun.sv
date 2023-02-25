module top();
 class transaction;
  static int i;
  int j;
  static function void stat_fun;
 	int b;
	i++;
	b++;
	$display("i is %d b is %d",i,b);
	endfunction
endclass
transaction t1,t2;
initial
begin
t1=new();
t2=new();
t1.stat_fun();
t1.stat_fun();
t1.stat_fun();
t2.stat_fun();
end
endmodule
