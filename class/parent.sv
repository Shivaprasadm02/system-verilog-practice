class GP;
virtual task send();
$display("I am Grand Parent");
endtask
endclass

class P extends GP;
virtual task send();
$display("I am Parent");
endtask
endclass

class GC extends P;
virtual task send();
$display("I am Grand Child");
endtask
endclass

module test();
GP g1;
P p1;
GC gc1;
initial
begin
g1 = new();
p1 = new();
gc1 = new();
g1 = p1;
g1.send();
g1 = p1;
g1.send();
end
endmodule
