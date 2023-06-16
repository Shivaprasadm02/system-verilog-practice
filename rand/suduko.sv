module top;
parameter SIZE =10;
class ABC;
	rand bit[4:0] md_arr [][];
	constraint c_md_arr {md_arr.size() == SIZE;
		foreach(md_arr[i]) {
			md_arr[i].size() == SIZE;
			foreach(md_arr[i,j]){md_arr[i][j]==i+j+1;}
			}}
endclass
ABC a;
initial
begin
	a=new;
	a.randomize;
	$display("%p",a.md_arr);
end
endmodule