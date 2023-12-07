// Code your testbench here
// or browse Examples


module top;
  bit clk, a, b;

  always #1 clk = ~clk;

  initial begin
    wait_for_clk(2);
    a <= 1;
    wait_for_clk(3);
    b <= 1;
    wait_for_clk();
    a <= 0;
    wait_for_clk(2);
    b <= 0;
    wait_for_clk();
    
    // Here I'll cause a fail by not keeping 'a' constant
    a <= 1;
    wait_for_clk();
    a <= 0;
    wait_for_clk();
    a <= 1;
    wait_for_clk();
    b <= 1;
    wait_for_clk();
    a <= 0;
    wait_for_clk(2);
    b <= 0;
    wait_for_clk();

    $finish();
  end

  property a2b_notA;
    @(posedge clk)
      $rose(a) |-> (a throughout b [->1]) ##1 (!a, $display("consequent"));
  endproperty
  
  a_a2b_notA: assert property (a2b_notA);

  task wait_for_clk(int num_clks = 1);
    repeat (num_clks)
      @(posedge clk);
  endtask

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end
endmodule
