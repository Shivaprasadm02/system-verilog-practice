module top;

class transaction;
 rand bit[3:0]addr;
 bit[3:0] arr[]={1,3,5,7,9};
 constraint array{addr inside { arr};}
endclass

transaction trans=new;
initial
begin
int success;
success=trans.randomize();
repeat(5)
begin
trans.randomize();
$display("address is %d", trans.addr);
$display("success is %d", success);
end
end
endmodule
