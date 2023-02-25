module test();
class test;
int data;
endclass
//test t1,t2,t3;
class ex extends test;
endclass

test t=new;
ex e=new;
initial
begin
//t2=new();
//t3=new();
//t1.data=10;
//t2.data=20;
//t3.data=30;
/*t1=t2
t3=t1*/
/*t2=t1;
t1=t3;*/
//t1=t2;
//t2=t3;
//t3=t1;
//t=new();
//ex=new();
e.data=10;
t.data=20;
$display("%p",t);
$display("%p",e);
//$display("%p",t3);
end
endmodule
