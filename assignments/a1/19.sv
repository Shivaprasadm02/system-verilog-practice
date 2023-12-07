class AB;
  int i=1;
endclass
AB a1;
module
initial
  begin
    repeat(2)
      begin
        AB a2=new;
        a1=new;
        a1.i++;
        a2.i++;
        $display("disp_1---a1.i=%0d,a2.i=%0d",a1.i,a2.i);
        a1.i++;
        a2.i++;
        $display("disp_1---a1.i=%0d,a2.i=%0d",a1.i,a2.i);
      end
    
  end
  
endmodule

/*
** Error (suppressible): a3_19.sv(10): (qverilog-2244) Variable 'a2' is implicitly static. You must either explicitly declare it as static or automatic
or remove the initialization in the declaration of variable.
#/

//if we remove loop we get warning and it executes
