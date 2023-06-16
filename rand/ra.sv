module top;

class trans;
  rand bit [31:01] a;
int count_ones = 0;
  constraint non_consecutive_ones {
    
    foreach (a[i]) {
      if (a[i] == 1) 
        count_ones++;
      if (i > 1 && a[i-1] == 1) 
          count_ones = 0;
        
      }
      if (count_ones == 12) 
        break;
      
    }
    count_ones == 12;
  }
endclass

/*
class c; 
 
   rand bit[31:0]a;
 
  constraint c1{
     $countones(a) == 12;
     foreach(a[i])
     if(i>0 && a[i]==1) a[i-1] != a[i];
     }
endclass
c c1;

initial
begin
c1=new();
c1.randomize;
$display("%p",c1);
end
endmodule
*/