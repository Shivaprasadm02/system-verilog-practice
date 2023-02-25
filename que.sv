module top;
int q1[$]={1,3,5,7,9};
int k=2, q2[$],q3[$]={1,3};
int i;
initial
begin
q1.insert(1,k);
$display("%p",q1);
q1.delete (5);
$display("%p",q1);
q1.push_front(7);
q1.push_back(9);
$display("%p",q1);
k=q1.pop_front();
$display("%p",k);
k=q1.pop_back();
$display("%p",k);
q2=q1.find  with(item==7);
$display("%p",q2);
q2=q1.min();
$display("%p",q2);
q2=q1.find_index with(item>5);
$display("%p",q2);


$display("q3",q3.size);
$display("q3",q3.min);
$display("q3",q3.find with (item==1));
$display("q3",q3.sum );
end
endmodule
