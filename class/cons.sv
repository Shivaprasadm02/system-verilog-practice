module teat;
class trans;
	int b;
	const int a=10;
	function new;
           a=20;
        endfunction

endclass

trans t;
initial
begin
trans t=new;
t.b=20;
$display("%p",t);
end
endmodule
