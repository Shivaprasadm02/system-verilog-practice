module top;
semaphore sem;
class track;
bit [2:0] a;
bit b;
task display();
sem.get(2);
a=1'b1;
$display($time,"%b sim time",a) ;
#20;
sem.put(2);
endtask
endclass
track t1,t2;
track t[2];
initial
begin
sem=new(2);
t1=new;
t2=new;
t[0]=new();
t[1]=new();
fork
//t1.display();
//t2.display();
t[0].display;
t[1].display;
//t[0].a=2;
//t[1].a=3;
//t1.a=2;
$display("--t1-- %p",t1);
$display("--t2-- %p",t2);
$display("--t[0]-- %p",t[0]);
$display("--t[1]-- %p",t[1]);
$display("--t-- %p",t);
join
end
endmodule
