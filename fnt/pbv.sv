module top;
int d=2;int e=3;
function int  cal( int a);
return a*2;
 $display("value of a %d",a);
endfunction


function automatic void cl(int a);
 a=a*2;
 $display("value of a %d",a);
endfunction

initial
fork

//int d=2;
//int e=3;
cal(d);
$display("value of d %d",d);
cal(e);
$display("value of d %d",e);

cl(d);
$display("value of d %d",d);
cl(e);
$display("value of d %d",e);

join
endmodule
