module test();
int d,result;
int a=2,b=3;
	function automatic  mult(input int a,input int b,output int c);
		c=(a*b)+2;
		a++;
		$display("--inside function--");
		$display("@time t=%0d: a=%0d and b=%0d and c=%0d",$time,a,b,c);
	endfunction
initial
	fork
 		begin
		 
                 mult(2,3,d);
		$display("--begin block 1--");
		$display("@time t=%0d: a=%0d and b=%0d and d=%0d",$time,a,b,d);
		end
 		begin
		 
                 mult(2,4,d);
		$display("--begin block 2--");
		$display("@time t=%0d: a=%0d and b=%0d and d=%0d",$time,a,b,d);
		end
	join
endmodule
