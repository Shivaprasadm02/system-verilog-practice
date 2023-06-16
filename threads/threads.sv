module test;
initial
begin
fork
begin
#3 $display("threads #3");
#2 $display("threads #2");
end
join_none
$display("threads #1");
end
endmodule
