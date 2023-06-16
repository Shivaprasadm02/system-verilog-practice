class trans;
rand bit [3:0]a;
function void post_randomize();
$display("a = %0d",a);
endfunction
endclass
class gen;
trans t1;
mailbox #(trans)mbx_g=new();

virtual task start();
repeat(3)
fork
begin
t1 = new();
t1.randomize();
mbx_g.put(t1);
$display("t1 = %0d",t1);
end
join_none
endtask
endclass
class drv;
gen g1=new();
trans t2;
int data_rcvd;

virtual task start();
forever
begin
g1.start();
g1.mbx_g.get(t2);
$display(g1.mbx_g.num());
$display("%p",t2);
$display("t2 = %0d",t2);
data_rcvd++;
if(data_rcvd == 3)
$finish;
end
endtask
endclass

module test();
drv d1;
gen g1;
initial
begin
d1 = new();
d1.start();
end
endmodule