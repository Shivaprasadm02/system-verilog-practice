module top;
class trans;
rand bit[3:0]addr;
static constraint addr_range{addr>8;}
function void post_randomize;
$display("addr %d",addr);
endfunction 
endclass
//extern not possible for static
//constraint trans :: addr_range{addr<2;}
trans t1,t2;
initial
begin
t1=new;
t2=new;
t1.randomize;
t2.randomize;

t2.addr_range.constraint_mode(0);
repeat(3)
begin
t1.randomize;
t2.randomize;
end

t1.addr_range.constraint_mode(1);
repeat(3)
begin
t1.randomize;
t2.randomize;
end
end

endmodule
