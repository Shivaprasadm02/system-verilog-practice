// Code your testbench here
// or browse Examples
module test;
initial
begin
  for(int i=0;i<4;i++)
fork
begin
  $display(i);
end
join_none
end
endmodule

/*
output->
4
4
4
4
//cz for loop is in preponed region and i is static i.e we have single memory for that but 
$display(i) is just scheduled but not executed as outer thread of fork_join_none is also executed loop will be incrementing
at last all 4pending display statements will print the current i value i.e last updated value of i which is 4

*/
