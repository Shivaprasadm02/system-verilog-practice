module test();
task dummy_task(input int x, string str);
fork
begin
#x;
end
begin
#10;
end
join_any
disable fork;
$display("%s is disabled at t=%t",str,$time);
endtask

initial
fork
begin
#2;
dummy_task(5,"call_1");
end
begin
#1;
dummy_task(15,"call_2");
end
join
endmodule
