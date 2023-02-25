
module top();
// class transaction;
 // int i;
 // int j;
  function void create(transaction t_h);
	t_h=new;
	t_h.i=10;
	endfunction
endclass
transaction t1,t2;
initial
begin
t1=new();
create(t1);
	$display("i is %d j is %d",t1.i,t1.j);
end
endmodule
