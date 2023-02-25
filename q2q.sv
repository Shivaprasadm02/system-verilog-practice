module top;
int q1[$]={0,1,3,5},q2[$]={2,4,6,8};
initial
fork
foreach(q2[i])
q1.insert(i+2,q2[i]);
$display("using method %p",q1);
q2={q2[0:1],q1,q2[2:$]};
$display("not using method %p",q2);
join

endmodule
