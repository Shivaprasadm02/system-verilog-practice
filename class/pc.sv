module top;
//changing size
class vector #(int size=1);
 bit [size-1:0] a;
function void disp();
$display("value of a is %d",a);
endfunction
endclass

//changing type
class stack#(type T=int);
T s;
function disp();
$display("value of s %d",s);
endfunction 
endclass

vector #(10) v1;
stack #(byte) s1;
initial
begin
 v1=new();
 s1=new();
 v1.a=18;
 v1.disp();
s1.s=10;
s1.disp;
end
endmodule
