---//Complete the following code. --(4M)
 class trans; 
 
 rand bit[31:0]a;
 /*write a constraint for the above rand variable such that 
 it should have 12 number of 1's non consecutively*/
endclass

////---solution---/////

module top;
class trans;
rand bit[31:0]a;
constraint c1{$countones(a)==12;
              foreach(a[i]){  
                if(a[i]==1 && i<31)
                    a[i+1]==0;
                    }}
endclass
