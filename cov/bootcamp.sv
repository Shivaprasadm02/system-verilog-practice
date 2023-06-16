/ Cover group with different auto_bin_max for each coverpoints

class coverage_model;

rand logic [7:0] address;
rand logic [2:0] opcode;
rand logic valid;

covergroup cg_group;
//option.auto_bin_max = 256;
// option.cross_auto_bin_max = 64;
c1 : coverpoint opcode { bins range[5] = {[0:$]};}
c2 : coverpoint address { bins range[128] = {[0:$]};}
c1_X_VAL : cross c2,valid;
endgroup : cg_group

function new();
cg_group = new;
endfunction : new

endclass : coverage_model

module cov_test;
coverage_model cm;
initial
begin
cm = new();
repeat(150)
begin
cm.randomize();
cm.cg_group.sample();
cm.cg_group.set_inst_name("My_Cg");
// $display(My_Cg);
end
end
endmodule
