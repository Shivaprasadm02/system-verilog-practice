class div_4_10;
    rand bit [7:0] div;
    //constraint constr_4_10 { div % 20 == 0; }
// constraint constr_4_10 { div % 10 == 0 && div%4==0; }
 constraint constr_4_10 { div > 0 && div<100; }
endclass

module div_cons;
    div_4_10 divisible;
    initial begin
      divisible = new();
      for (int i = 0; i <10; i++) begin
        divisible.randomize();
        $display("Divisible by 4 and 10 : %0d", divisible.div);
      end
    end
endmodule
