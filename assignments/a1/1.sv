module top;
class base;
static int i;
static function static get();
int a;
a++;
i++;
$display(a);
$display(i);
endfunction
endclass

base b1,b2;
initial
begin
b1.get();
b1.get();
b2.get();
end
endmodule
