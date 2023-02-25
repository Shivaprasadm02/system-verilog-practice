module test;
class test;
static int a=10;
test t3;
//t3.a=30;
endclass
test t1,t2;
//test t3;
initial
begin
t1=new();
t2=new();
t2.a=20;
$display("%p",t1);
///t2.t3=t1;
$display("%p",t2);
$display("%p",t2);
//$display("%p",t3);
end
endmodule
