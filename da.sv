module top;
logic da3[];
int da1[],da2[];
initial 
begin

$display("%p",da3);
$display("%p",da1);
da1=new[10];

$display("%p",da1);
foreach(da1[i])
da1[i]=i;
$display("%p",da1);
foreach(da1[i])
$display(da1[i]);
da1=new[30](da1);
$display("%p",da1);
da2=da1;
$display("I am da2 %p",da2);
da1.delete();
$display("%p",da1);
da3=new[10];
$display("da3 %p",da3);

$display("da3 size is %p",da3.size);
da3.delete();
$display("da3 %p",da3);

end
endmodule
