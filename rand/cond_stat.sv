/*
module top;
class trans;
rand bit [2:0] tag;
bit mode;

constraint cond{mode==1'b0->tag<2;
		mode==1'b1->tag>2;}

function void post_randomize;
$display("tag %d, mode %d",tag,mode);
endfunction

endclass

trans t1,t2;
initial
begin
t1=new;
t2=new;
$display("--t1--");
t1.mode=1;
t1.randomize;
t1.cond.constraint_mode(0);// disabled
repeat(10)
t1.randomize;
$display("--t2--");
//constraint should not apply
t2.mode=0; 
repeat(10)
t2.randomize();
$display("--t1--");
//constraint should not apply
t1.randomize;
$display("--t2--");
t2.mode=1;
repeat(10)
t2.randomize;
end
endmodule
*/

module top;
class trans;
rand bit[3:0] Vlantag;
bit mode;
constraint tag{mode==1'b1->Vlantag<7;
		mode==1'b0->Vlantag>9;}
endclass

trans t=new;
initial
begin
t.mode=1'b1;
t.randomize;
$display("tag is %d",t.Vlantag);
t.mode=1'b0;
t.randomize;
$display("tag is %d",t.Vlantag);
end
endmodule
