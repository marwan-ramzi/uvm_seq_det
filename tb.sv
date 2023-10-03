import uvm_pkg::*;
////////////////////////////// need updates //////////////////////////////
`include "uvm_macros.svh"
`include "param_macros.svh"
`include "des_if.sv"
`include "Item.sv"
`include "gen_item_seq.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "base_test.sv"
// `include "path/seq_1011.v"
`include "./DUT/seq_1011.v"

module tb();

    bit clk;

    des_if _if(clk);

    seq_1011 DUT(_if.in, clk, _if.rst, _if.out);

    always #10 clk = ~clk;

    initial begin
        clk <= 0;
        uvm_config_db#(virtual des_if)::set(null, "uvm_test_top", "des_if", _if);
        run_test("test_1011");        
    end

endmodule