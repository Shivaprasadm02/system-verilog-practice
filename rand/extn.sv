module top;

class trans;
rand bit[3:0]addr;
constraint range;
 function void post_randomize;
  $display("addr %d",addr);
 endfunction 
endclass

trans t=new;
constraint trans :: range {addr<5;}
initial
begin
repeat(5)
t.randomize;
repeat(5)
t.randomize with {addr>3;};
end
endmodule
