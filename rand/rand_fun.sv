module top;

class packet;
rand bit[2:0]a;
rand bit[2:0]b;
constraint sol{b==func(a);solve a before b;}

function bit[2:0]func(bit[2:0]c);
if(c==0)
func=0;
else
func=c+2;
endfunction
endclass

packet p;
initial
begin
p=new;
repeat(5)
begin
p.randomize();
$display("a=%d,b=%d",p.a,p.b);
end
end

endmodule
