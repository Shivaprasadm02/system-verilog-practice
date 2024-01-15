module top;

class trans;
static int a;
int balance;
	function new();
		balance=1000;
	endfunction
endclass

class trans1 ;//packet extends trans;
	int b=1000;
endclass

trans t,t2;
trans1 t1;
  
initial
begin
	t=new();
	t2=new t;//shallow_copy
	t.balance=2000;
	t.a=10;
	t2.a=20;
//t1=new t;-->err cz t1 and t are of different class type
$display("trans is %p\n , trans copy is %p\n,trans1 is %p",t,t2,t1);
end

endmodule
