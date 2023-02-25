
module top();
int da[]=new[10];
initial
begin
foreach(da[i])
 da[i]=$random%20;;
$display("before sort %p",da);
for(int i=0;i<10;i++)
begin
for(int j=i+1;j<10;j++)
if(da[i]>da[j])
begin
da[i]=da[i]+da[j];
da[j]=da[i]-da[j];
da[i]=da[i]-da[j];
end
end
$display("After sort %p",da);
end
endmodule
