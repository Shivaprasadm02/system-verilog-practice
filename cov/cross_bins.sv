class coverage_model;

logic [7:0] address;
logic [2:0] opcode;
logic valid;

covergroup cg_group;
c1 : coverpoint opcode;
c2 : coverpoint address;
c1_X_VAL : cross c1,valid;
endgroup : cg_group

function new();
cg_group = new;
endfunction : new

endclass : coverage_model
