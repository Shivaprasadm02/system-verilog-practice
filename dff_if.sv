interface dff_if(input clk);
logic d0,d1,sel,rst,q;
parameter thold=0,tsetup=4;

clocking cb@(posedge clk);
 default input #(tsetup) output #(thold);
 output d0;
 output d1;
 output rst;
 output sel;
 input q;
endclocking

modport DUV(input d0,d1,rst,sel,clk, output q);

//task for checking reset

task sync_reset;
 cb.rst <=1'b1;
 cb.sel <=$random;
 cb.d0 <=1'b1;
 cb.d1 <=1'b1;
repeat(2)
 @(cb);
if(cb.q!==0)
begin
 $display($time,"reset not wrking");
$stop;
end
else
 $display($time,"reset is wrking");
endtask

//task for checking load d0


task load_d0;
input data;
 cb.rst <=1'b0;
 cb.sel <=1'b0;
 cb.d0 <=data;
 cb.d1 <=~data;
repeat(2)
 @(cb);
if(cb.q!==data)
begin
 $display($time,"load d0 not wrking");
$stop;
end
else
 $display($time,"load d0  wrking");
endtask


//task for checking load d1


task load_d1;
input data;
 cb.rst <=1'b0;
 cb.sel <=1'b0;
 cb.d0 <=~data;
 cb.d1 <=data;
repeat(2)
 @(cb);
if(cb.q!==data)
begin
 $display($time,"load d1 not wrking");
$stop;
end
else
 $display($time,"load d1  wrking");
endtask

modport TEST(clocking cb, import task sync_reset(),import task load_d0(),
 import task load_d1());
endinterface


//DUT

module dff(dff_if.DUV duv_if);
logic d;

always@(*)
begin
case(duv_if.sel)
0:d=duv_if.d0;
1:d=duv_if.d1;
default:d=duv_if.d0;
endcase
end

always@(posedge duv_if.clk)
begin
if(duv_if.rst)
duv_if.q<=0;
else
duv_if.q<=d;
end

endmodule

//TB

module testcase(dff_if.TEST test_if);
initial
begin
@(test_if.cb);
test_if.sync_reset;
test_if.load_d0(1);
test_if.load_d1(0);
test_if.load_d0(0);
test_if.load_d1(1);
#10 $finish;
end
endmodule

//Top Module

//`timescale 10ns/1ns
module top();
bit clk;
always #10 clk=~clk;
dff_if IF(clk);
dff RTL(IF);
testcase TB(IF);
endmodule
