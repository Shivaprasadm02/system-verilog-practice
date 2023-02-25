module top;
event ev;
initial
begin
$display("about to drive after 10ns");
#10;
$display("control is driven at time t=%t",$time);
->ev;//trigering of event
end
initial
begin
$display("about to drive data");
#10;
//@ev;//waiting of event
wait(ev.triggered);
$display("data is driven at time t=%t",$time);
end
endmodule
