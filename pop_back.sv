module top;
int q2[$],k;
int q1[$]={0,1,2,3,4,5};
initial
begin
//for(int i=0;i<q1.size;i++)
q2=q1.min();
k=q1.pop_back;
$display("popped elements %p",q2);
$display("popped elements %p",k);

end
 endmodule
