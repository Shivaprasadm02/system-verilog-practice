module top();i
class AB;
rand int da[];
constraint da1{da.size==10;
foreach(da[i])
 da[i] inside{[1:100]};}}
function void post_randomize();
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
$display(""After sort %p),da
endfunction
endclass
AB a=new();
initial
begin
void(a.randomize());
end
endmodule


