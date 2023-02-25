module top;
class trans;
int balance=1000;
function int summary();
 return balance;
endfunction
endclass

class packet extends trans;
int pay=1000;
function int summary;
 return pay+balance;
endfunction
endclass

packet p;
initial
begin
p=new();
//p.balance=2000;
$display("value of summary is %0d", p.summary());
end
endmodule
