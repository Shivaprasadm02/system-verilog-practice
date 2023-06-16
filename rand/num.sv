// or browse Examples
class packet;
  
  rand int a[];
  
  constraint c1 { a.size() inside {[4:20]};}
  
	  
endclass
      
           
module test;
    
  initial begin
   packet pkt = new;
    pkt.randomize();
	$display(" size = %d", pkt.a.size());
    $display(" a = %p", pkt.a);
  end
  
endmodule