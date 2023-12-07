module top;
class parent;
rand bit[2:0]a;
constraint a_size{a==3;}
endclass
class child extends parent;
rand bit[2:0]a;
constraint a_size{a==2;}
constraint c_size{super.a==a;}
endclass

parent p;
child c;
initial
begin
c=new;
repeat(7)
begin
c.randomize;
$display("child: %p", c);
end
end
endmodule
