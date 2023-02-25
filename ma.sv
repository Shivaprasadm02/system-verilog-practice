module top();
bit[3:0][7:0]bytes[0:2];
initial
begin
bytes[0]=32'd255;
$display(bytes[0]);
bytes[0][3]=8'd255;
$displayh(bytes[0]);
bytes[0][0][0]=1'b0;
$display(bytes[0]);

$displayh(bytes[0]);

$display(bytes[0][0]);
end

endmodule
