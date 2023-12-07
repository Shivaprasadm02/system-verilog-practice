module test();
int d,result;
int a,b=3;
	task  mult( int a,int b, int c);
		c=(a*b)+2;
		a++;
		$display("--inside function--");
		$display("@time t=%0d: a=%0d and b=%0d and c=%0d",$time,a,b,c);
	endtask
initial
	fork
 		begin
		 #1;
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
