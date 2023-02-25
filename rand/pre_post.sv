module top;
class trans;
rand int data;

function void pre_randomize();
$display("value before randomize is %b",data);
endfunction

function void post_randomize();
$display("value after randomize is %b",data);
endfunction
endclass

trans t=new;
initial
repeat(3)
begin
//repeat(3)
//for(int i=0;i<3;i++)
t.randomize();
end
endmodule
