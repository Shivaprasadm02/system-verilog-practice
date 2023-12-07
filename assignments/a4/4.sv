module top;
class parent;
	rand bit[2:0]a;
	constraint a_size{a<3;}
endclass

class child extends parent;
	rand bit[2:0]a;
	constraint a_size{a<5;}
endclass

parent p;
child c=new;

initial
	repeat(7)
	begin
	c.randomize;
	$display("child: %p", c);
	end
endmodule
