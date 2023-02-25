module top;
class trans;
int balance;
function new();
balance=1000;
// this.balance=balance;
endfunction
endclass

class packet extends trans;
int b=1000;
function void i(int balance);
// super.new(balance);
endfunction
//super.new(b);
//endfunction
endclass

//packet p;
trans t;
initial
begin
t=new();
//p=new(1000);
//$display("value of summary is %p",p);
end
endmodule
