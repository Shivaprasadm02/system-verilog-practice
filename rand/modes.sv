module top;
class trans;
randc  bit[3:0]a;
  bit[3:0]b;

constraint limit{a inside{[1:5],8};}
constraint size{b<5;}
function void post_randomize();
$display(a,b);
endfunction
endclass

trans t=new;
initial
begin
//t.b.rand_mode(0);
t.a.rand_mode(0);
//t.a.rand_mode(1);
if(t.a.rand_mode())
begin
 t.randomize;
end

//t.limit.constraint_mode(0);
repeat(5)
t.randomize;

//t.limit.constraint_mode(1);
repeat(5)
t.randomize();

end
endmodule
