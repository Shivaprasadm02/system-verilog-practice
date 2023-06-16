/////////2D ARRAY---////
module top;
parameter SIZE =3;
class ABC;
	rand bit[4:0] md_array [][];
	constraint c_md_array {md_array.size() == SIZE;
		foreach(md_array[k,j]) 
			md_array[k].size() == SIZE;}
endclass
ABC a;
initial
begin
	a=new;
	a.randomize;
	$display("%p",a.md_array);
end
endmodule

///--without constraints---///
module top;
bit[7:0] d3_arr[][];
initial
begin
//creates no of rows array
d3_arr=new[3];
//now create no of columns in each row 
foreach(d3_arr[i])
	d3_arr[i]=new[3];
//assign some random value to array
foreach(d3_arr[i,j])
begin
d3_arr[i][j]=$random;
$display("array[%d,%d]=%d",i,j,d3_arr[i][j]);
end

end

endmodule
/*
module foreach_example;
  int array[6][2] = '{'{1, 100}, '{2, 200}, '{3, 300}, '{4,400}, '{5, 500}, '{6, 600}};
  initial begin
    foreach (array[i,j]) begin
      $display("array[%0d][%0d] = %0d", i,j, array[i][j]);
    end
  end
endmodule
*/