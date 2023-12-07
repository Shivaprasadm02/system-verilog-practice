module top;
class pass_by_ref;
int refr=2;
int val=2;
function automatic int check_refer(ref int r);
$display("\n .. pass by ref .. \n");
$display("initial val of refr=%d",r);
r++;
$display("val of refr after incrementing %d",r);
endfunction
function int check_val(int v);
$display("\n .. pass by val .. \n");
$display("initial val of val=%d",v);
v++;
$display("val of refr after incrementing %d",v);
endfunction
endclass
pass_by_ref h1;

initial
begin
h1=new();
h1.check_refer(h1.refr);
h1.check_val(h1.val);
$display("\n . in mem.\n");
$display("value of refr after inc %d",h1.refr);
$display("value of val after inc %d",h1.val);
h1.check_refer(h1.refr);
h1.check_val(h1.val);
$display("\n . in mem.\n");
$display("value of refr after inc %d",h1.refr);
$display("value of val after inc %d",h1.val);
end
endmodule
