/*---3
module top;
class base;
int i;
static function get();
static int a;
a++;
//i++;
$display(a);
//$display(i);
endfunction
endclass

base b1,b2;
initial
begin
//b1=new;
//b2=new;
b1.get();
b1.get();
b2.get();
end
endmodule
--op 1,2,3--*/


/*---4--
module top;
class base;
int i;
static function get();
int a;
a++;
$display(a);
//$display(i);
endfunction
endclass

base b1,b2;
initial
begin
//b1=new;
//b2=new;
b1.get();
b1.get();
b2.get();
end
endmodule
---op-1,1,1   ---------*/


//5--- i cannot be accessed inside function if tried we get error


module top;
class base;
static int i;
static function get();
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
//b1=new;
//b2=new;
b1.get();
b1.get();
b2.get();
end
endmodule
//as i is static 1,2,3
//as a is not 1,1,1
