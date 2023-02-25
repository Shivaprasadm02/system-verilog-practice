module top;
class transaction;
rand bit[2:0]pktlength;
//randc string header;
endclass

//transaction trans_h=new;
initial
//repeat(16)
begin
int success;
//success=trans_h.randomize();
$display(success);
//trans_h.randomize();
//$display("pktlength=%b, header=%b",trans_h.pktlength,trans_h.header);
//$display("pktlength=%d, header=%d",trans_h.pktlength,trans_h.header);
end
endmodule
