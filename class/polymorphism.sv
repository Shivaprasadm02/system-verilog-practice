class GP;
int a=10;
	virtual task send();
		$display("I am Grand Parent");
	endtask
endclass

class P extends GP;
int a=20;
	virtual task send();
		$display("I am Parent");
	endtask
endclass

class GC extends P;
int a=30;
	virtual task send();
		$display("I am Grand Child");
	endtask
endclass

module test();
GP g1;
P p1;
GC gc1;

initial
begin
	g1 = new();
	p1 = new();
	gc1 = new();
	$display("grand parent is %p,\nparent is %p,\ngrand child is %p",g1,p1,gc1);
	g1.send;
	g1 = p1;
	g1.send();
	g1 = gc1;
	g1.send();
end
endmodule
