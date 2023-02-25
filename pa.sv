module array;
bit[3:0][7:0]byte_packed;

initial
begin
byte_packed=32'd254;
$displayh(byte_packed[0]);
$displayh(byte_packed[0][2]);
$displayh(byte_packed[1]);
$displayh(byte_packed[0][0]);
end
endmodule
