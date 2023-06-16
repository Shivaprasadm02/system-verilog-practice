class base;
int c;
virtual task sum(int i=10,j=20);
c = i + j;
$display("c = %0d",c);
endtask
endclass:base
class derived extends base;
int d;
virtual task sum(int a,b);
d = a -b;
$display("d = %0d",d);
endtask
endclass

module polyM_test();
base b1;
derived d1;
initial
begin
b1 = new();
d1 = new();
b1.sum();
b1 = d1;
b1.sum(40,30);
end
endmodule