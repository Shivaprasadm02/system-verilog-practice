module top;
class trans;
rand int a;
//constraint tag{a dist{0:=1,[5:9]:/5,[1:4]:/4};}
constraint tag{a dist{0:=1,1:=1,3:=1};} 
endclass

trans t=new;
initial
begin
repeat(3)
begin
t.randomize;
$display("a is %d",t.a);
end
end
endmodule
