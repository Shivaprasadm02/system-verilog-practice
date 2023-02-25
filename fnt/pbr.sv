module top;
int d=2;
function automatic void cal(ref int a);
 a= a*2;
 $display("value of a %d",a);
endfunction
initial
//int d=2;
fork
begin
#1  cal(d);
$display("value of d %d",d);
end
begin
#1 cal(d);
$display("value of d %d",d);
end
 join
endmodule
