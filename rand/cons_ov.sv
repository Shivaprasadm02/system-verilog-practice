module top;
class transaction;
 rand bit[3:0]a;
 rand bit[3:0]b;

  constraint oversize {a<=3;}
 function void post_randomize;
  $display("value of a is %d",a);
 endfunction
endclass
class trans_ext extends transaction;
 constraint versize {b>=14;}
endclass
transaction t;
trans_ext t1;
initial
begin
t=new;
t1=new;
repeat(2)
begin
t.randomize;
t1.randomize;
$display("%p",t);
$display("%p",t1);
end
end
 endmodule
