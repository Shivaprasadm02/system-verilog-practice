
class magicsquare;
 
  rand bit [7:0] a [0:2][0:2];
  rand bit [7:0] b [0:2][0:2];
 
  int i,j,k;
 
  constraint c1 {foreach (a[i,j]) 
// md_array[i].sum() with (int'(item)) == 'd21;
  {a[i].sum() with (7'(item) ==8'd15);a[j].sum() with (int'(item)) == 8'd15 }; }
  //{ a[i].sum() with (int'(item)) == 8'd15 ;}}
 
 
 
   //   constraint c2 {foreach (a[i,j]) 
 
     //   if (i==0) {a.sum() with (int'(item)) ==8'd15; } }
 
  function void display ();
                 $display ("The value of array is %p",a);
 
  endfunction
 
endclass
 /*
class magicsquare;
 
  rand bit [4:0] a [3][3];
 
  constraint c1 {
 
        foreach(a[i,j]) {
            a.sum with (item.index(1) == i ? 5'(item): 0) == 15; // rows
            a.sum with (item.index(2) == j ? 5'(item): 0) == 15; // cols
        }
        unique {a};
  }
  endclass
  */
module test;
  magicsquare m1;
 
 
  initial begin
    m1=new();
    m1.randomize();
   $display("%p", m1.a);
 
  end
 
endmodule