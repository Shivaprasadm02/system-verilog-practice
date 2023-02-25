module top;

class transaction;
rand bit[2:0]a;
rand bit[2:0]b;
constraint sol{b==func(a);solve a before b;}
function bit[2:0]func(bit [2:0]c);
if(c==0)
func=5;
else
func=6;
endfunction
endclass

transaction t=new;

initial
begin
repeat(5)
begin
t.randomize;
$display("a=%d,b=%d",t.a,t.b);
end
end

endmodule
