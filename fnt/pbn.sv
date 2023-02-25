module top;
integer val;
task read(integer j=0,k,data=1);
$display(j,k,data);
endtask
initial
begin
val=4;
read(.j(4),.k(val),.data(7));
read(.j(4),.data(7),.k(10));
read(.data(7),.k(10));
end

endmodule
