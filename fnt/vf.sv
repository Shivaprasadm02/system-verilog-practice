module top;
int a=3;
function void display();
 sum();
  $display("a is %d",a);
 // $display("sum is %d",sum);
endfunction

function int sum();
 sum=a++;
$display("sum is %d",sum);
endfunction
initial
begin
 display();
 $display("a %d",a );
end
endmodule
