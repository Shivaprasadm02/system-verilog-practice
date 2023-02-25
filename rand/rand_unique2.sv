module test;
class packet;
rand bit[3:0]addr[10];
constraint addr_range{foreach(addr[i])
			foreach(addr[j])
				if(i!=j)
				 addr[i]!=addr[j];}
endclass
packet p;
initial
begin
p=new;
repeat(5)
begin
p.randomize;
$display("addr=%p",p.addr);
end
end
endmodule

