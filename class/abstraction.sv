virtual class GP;
	pure virtual task send();
endclass

class P extends GP;
	virtual task send();
		$display("I am Parent");
	endtask
endclass

class GC extends GP;
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
  //g1 = new();//gives err cz cannot create obj to abstract class
	p1 = new();
	gc1=new();
	$display("p1 is %p,\n gc1 is %p",p1,gc1);
end
endmodule
