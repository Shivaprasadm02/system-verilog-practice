module top;
class trans;
rand bit [2:0] length;
constraint size{length <=5;}
endclass
trans t=new;
initial
repeat(10)
begin
t.randomize();
$display("length=%d",t.length);
end

endmodule
