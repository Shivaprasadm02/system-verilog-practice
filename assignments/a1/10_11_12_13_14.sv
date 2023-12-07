
//--10--
//error as no arg in parent class
/*
module abc();
class trans;
int i;
function new();
i=10;
endfunction
endclass

class ex_trans extends trans;
int i;
function new(int i);
super.new(i);
this.i=i;
endfunction
endclass

ex_trans e;

initial
begin
e=new(10);
$display("%p",e);
end
endmodule*/

//----11---
//{i:10,i:20}}
/*
module abc();
class trans;
int i;
function new(int i);
this.i=i;
endfunction
endclass

class ex_trans extends trans;
int i;
function new(int i);
super.new(i);
this.i=20;
endfunction
endclass

ex_trans e;

initial
begin
e=new(10);
$display("%p",e);
end
endmodule
*/


//--12-----
//new function implicitly invoked for parent also
//{i:10,i:20}
/*
module abc();
class trans;
int i;
function new(int a=10);
i=a;
endfunction
endclass

class ex_trans extends trans;
int i;
function new();
i=20;
endfunction
endclass

ex_trans e;

initial
begin
e=new();
$display("%p",e);
end
endmodule
*/


//--13---
//without this {i:0,i:20}
/*
module abc();
class trans;
int i;
function new(int i=10);
i=10;
endfunction
endclass

class ex_trans extends trans;
int i;
function new();
i=20;
endfunction
endclass

ex_trans e;

initial
begin
e=new();
$display("%p",e);
end
endmodule
*/

//--14--
//{i:10,i:20}


module abc();
class trans;
int i;
function new();
i=10;
endfunction
endclass

class ex_trans extends trans;
int i;
function new();
i=20;
endfunction
endclass

ex_trans e;

initial
begin
e=new();
$display("%p",e);
end
endmodule
