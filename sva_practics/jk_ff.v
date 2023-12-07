module jk_ff(clk,reset,j,k,q,qb);

    input clk,reset,j,k;
    output reg q;

    output qb;

    always@(posedge clk)
        begin
            
            if(reset)
                q<=0;
            else
                begin
                    case({j,k})
                        2'b00 : q<=q;
                        2'b01 : q<=0;
                        2'b10 : q<=1;
                        2'b11 : q<=~q;
                        default: q<= 'z;
                    endcase 
                end
        end


assign qb = ~q;
endmodule










module jk_ff_tb();

    reg clk,reset,j,k;
    wire q,qb;

    
    jk_ff DUT (clk,reset,j,k,q,qb);

    initial
        begin
          $monitor("from monitor, at time %0t, j = %0b, k = %0b, q = %0b, qb = %0b", $time,j,k,q,qb); 
        end


    initial
        begin
            clk = 1'b1; 
            forever 
                #1 clk = ~clk;
        end
    initial
        begin
            j = 0; k = 0; reset = 0;
            #3 j = 0; k = 1; reset = 0;
            #3 j = 1; k = 0; reset = 0;
            #3 j = 1; k = 1; reset = 0;
            #3 j = 1; k = 0; reset = 0;
            #3 $finish;
        end



            a1 : assert property(p1)
                $info("at time %0t, p1 success",$time);
            else
                $info("at time %0t, p1 fail",$time); 
        
            
            a2 : assert property(p2)
                $info("at time %0t, p2 success",$time);
            else
                $info("at time %0t, p2 fail",$time);

            a3 : assert property(p3)
                $info("at time %0t, p3 success",$time);
            else
                $info("at time %0t, p3 fail",$time); 
                
            a4 : assert property(p4)
                $info("at time %0t, p4 success",$time);
            else
                $info("at time %0t, p4 fail",$time);

            a5 : assert property(p5)
                $info("at time %0t, p5 success",$time);
            else
                $info("at time %0t, p5 fail",$time);

                    

    property p1;
        @(negedge clk)
        disable iff(reset)
      (j === 1) && k |-> q === ~($past(q,1));
    endproperty
    
    property p2;
        @(negedge clk)
        disable iff(reset)
        !j && k |-> !q;
    endproperty

    property p3;
        @(negedge clk)
        disable iff(reset)
        j && !k |-> q;
    endproperty

    property p4;
        @(negedge clk)
        disable iff(reset)
        !j && !k |-> q === $past(q,1);
    endproperty

    property p5;
        @(negedge clk)
        reset |-> !q;
    endproperty

endmodule




# from monitor, at time 0, j = 0, k = 0, q = x, qb = x
# ** Info: at time 1, p4 success
#    Time: 1 ns Started: 1 ns  Scope: jk_ff_tb.a4 File: testbench.sv Line: 51
# from monitor, at time 2, j = 0, k = 1, q = 0, qb = 1
# ** Info: at time 3, p2 success
#    Time: 3 ns Started: 3 ns  Scope: jk_ff_tb.a2 File: testbench.sv Line: 41
# from monitor, at time 4, j = 1, k = 0, q = 1, qb = 0
# ** Info: at time 5, p3 success
#    Time: 5 ns Started: 5 ns  Scope: jk_ff_tb.a3 File: testbench.sv Line: 46
# from monitor, at time 6, j = 1, k = 1, q = 0, qb = 1
# ** Info: at time 7, p1 success
#    Time: 7 ns Started: 7 ns  Scope: jk_ff_tb.a1 File: testbench.sv Line: 35
# from monitor, at time 8, j = 1, k = 0, q = 1, qb = 0
# ** Info: at time 9, p3 success
#    Time: 9 ns Started: 9 ns  Scope: jk_ff_tb.a3 File: testbench.sv Line: 46
