//---7---
//as i is static 1,2,3
//as a becomes static 1,2,3
/*
module top;
class base;
static int i;
function static get();
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
b1=new;
b2=new;
b1.get();
b1.get();
b2.get();
end
endmodule
*/

//---8----
/*as no obj we get error
module top;
class base;
int i;
function static get();
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
endmodule*/


//-----9 ---
//as i is not static 1,1,1
// as a becomes static 1,2,3

module top;
class base;
int i;
function static get();
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
b1=new;
b2=new;
b1.get();
b1.get();
b2.get();
end
endmodule

