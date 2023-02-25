module top;
bit [3:0]a,b;
initial
begin
std::randomize(a,b)with {a>10;b<10;};
$display(a,b);
end
endmodule
