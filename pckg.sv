package pkg;
int no_of_trans;
function void display(string s);
 $display($time,"%s, n=%0d",s,no_of_trans);
endfunction
endpackage


module A;
import pkg::*;
initial
begin
#1;
no_of_trans=10;
#1;
display("From A");
end
endmodule
