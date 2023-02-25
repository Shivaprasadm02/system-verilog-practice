module top;
int a=4;
task automatic double(ref int d);
 #5;
 d=d*2;
 $display($time,"  d=%d",d);
endtask
initial
fork
begin
 double(a);
 $display("a=%d",a);
end
begin
 double(a);
 $display("a=%d",a);
end
join
endmodule
