/*
class trans;
bit[7:0] a[];
constraint arr{a.size==10;foreach(a[i]) unique{$countones(a[i])};}
endclass

trans t;
module top;
t=new;
t.randomize;
$display("%b",t.a);
endmodule
*/
class transaction;
rand bit [31:0] da[];
constraint c1{da.size == 10;}
constraint c2{foreach (da[i])
da[i] inside {[1:1023]};}
constraint c3{foreach (da[i])
if(i<9)
$countones(da[i+1]) == $countones(da[i])+1;}

function void post_randomize();
$display("da = %p",da);
foreach(da[i])
$display("%d",$countones(da[i]));
endfunction
endclass

module test();
transaction t1;

initial
begin
t1 = new();
t1.randomize();
end
endmodule
/*

module top;
class ones;
int q[$];
int a[];

constraint c1 {a.size < 10;}
constraint c2 {foreach (a[i])
q.pushfront($countones(a[i]))
;}
constraint c3 { foreach(a[i]))
!($countones(a[i+1]) inside{q});}

endclass
initial
begin
ones o;
o=new;
o.randomize;
$display("%p",o);
end
endmodule
*/
