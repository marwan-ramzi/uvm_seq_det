class base_test extends uvm_test;
    
    `uvm_component_utils(base_test)

    function new(string name="base_test", uvm_component parent=null);
        super.new(name, parent);
    endfunction 

    env e0;
    virtual des_if vif;
    gen_item_seq seq;
    bit [`LENGTH-1:0] ref_seq = 4'b1011;


    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        e0 = env::type_id::create("e0", this);

        if(!uvm_config_db#(virtual des_if)::get(this,"","des_if",vif))
            `uvm_fatal("base_test","Can't find Vif")
        uvm_config_db#(virtual des_if)::set(this, "e0.a0.*", "des_if", vif);
        
        uvm_config_db#(bit [`LENGTH-1:0])::set(this, "*", "ref_seq", ref_seq);

        seq = gen_item_seq::type_id::create("seq", this);
        seq.randomize();
    endfunction

    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        apply_reset();
        seq.start(e0.a0.s0);
        #200;
        phase.drop_objection(this);
    endtask

    virtual task apply_reset();
        vif.rst <= 0;
        vif.in  <= 0;
        repeat(5) @(vif.clk)
        vif.rst <= 1;
        repeat(10) @(vif.clk)
        vif.rst <= 1;
    endtask
endclass 

class test_1011 extends base_test;
    
    `uvm_component_utils(test_1011);

    function new(string name="test_1011", uvm_component parent);
        super.new(name, parent);
    endfunction 

    virtual function void build_phase(uvm_phase phase);
        ref_seq = 4'b1011;
        super.build_phase(phase);
        assert(seq.randomize() with { num inside {[300:500]};});
    endfunction

endclass