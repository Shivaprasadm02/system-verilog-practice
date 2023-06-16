module top;
parameter SIZE =3;
class ABC;
	rand bit[4:0] md_array [][][];
	constraint c_md_array {md_array.size() == SIZE;
		foreach(md_array[i]) {
			md_array[i].size() == SIZE;
			foreach(md_array[i,j])
			md_array[i][j].size==SIZE;
			}}
endclass
ABC a;
initial
begin
	a=new;
	a.randomize;
	$display("%p",a.md_array);
end
endmodule
/*
///--without constraints---///
module top;
bit[7:0] d3_arr[][][];
initial
begin
//creates no of 2d array
d3_arr=new[3];
//now create no of rows in each 2d array
foreach(d3_arr[i])
begin
	d3_arr[i]=new[3];
//now create no of columns in each row
	foreach(d3_arr[i][j])
	d3_arr[i][j]=new[3];
end

//assign some random value to array
foreach(d3_arr[i,j,k])
begin
d3_arr[i][j][k]=$random;
$display("array[%d,%d,%d]=%d",i,j,k,d3_arr[i][j][k]);
end

end

endmodule