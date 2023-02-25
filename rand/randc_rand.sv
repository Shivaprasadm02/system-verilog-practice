module top;
class transaction;
bit[2:0]queue[$];
rand bit[2:0]addr;
constraint index{if(queue.size!=0)
		 foreach(queue[i])
		  addr!=queue[i];}
function void post_randomize;
queue.push_back(addr);
if(queue.size==8)
queue.delete;
endfunction
endclass

transaction t=new;
initial
repeat(10)
begin
t.randomize;
$display("addr=%d",t.addr);
end
endmodule


