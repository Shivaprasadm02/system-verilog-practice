module top;
class packet;
rand bit[2:0] a,b,c,e;
rand bit[2:0]d;
constraint uni{unique {a,b,c,e};}
endclass
packet p;
initial
begin
p=new;
p.randomize;
$display("%d",p.a);
$display("%d",p.b);
$display("%d",p.c);
$display("%d",p.d);
$display("%d",p.e);
end
endmodule
