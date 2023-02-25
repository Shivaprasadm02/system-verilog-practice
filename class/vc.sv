module top;

 virtual class packet;
  int a;
  pure virtual function void disp();
 endclass

  class ext extends packet;
	 function void disp();
	  $display("I am implementing function disp, value of a is %0d",a);
	endfunction
  endclass
ext e1;
initial
begin
	e1=new();
	e1.a=13;
	e1.disp();
end
endmodule

