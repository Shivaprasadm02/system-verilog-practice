class a;
int a = 10;
mailbox mbx1;
virtual task start();
mbx1.put(a);
endtask
endclass
class b;
int b;
mailbox mbx2;
virtual task start();
mbx2.peek(b);
$display("b = %0d",b);
endtask
endclass
module mbx_test;
mailbox mbx3;
a a1;
b b1,b2;
initial
begin
mbx3 = new();
a1 =new();
b1 = new();
b2 = new();
a1.mbx1 = mbx3;
b1.mbx2 = mbx3;
b2.mbx2 = mbx3;
$display("%0d \t %0d \t %0d",a1.mbx1,b1.mbx2,mbx3);
a1.start();
b1.start();
b2.start();
end
endmodule