class scoreboard extends uvm_scoreboard;
    
    `uvm_component_utils(scoreboard)
    
    uvm_analysis_imp #(Item, scoreboard) m_analysis_imp;

    bit [`LENGTH-1:0] act_seq ;
    bit [`LENGTH-1:0] ref_seq ;
    bit exp_out = 0;

    function new(string name= "scoreboard", uvm_component parent);
    super.new(name, parent);
    endfunction 

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        m_analysis_imp = new("m_analysis_imp", this);
        if(!uvm_config_db#(bit [`LENGTH-1:0])::get(this, "*", "ref_seq", ref_seq))
            `uvm_fatal("SCOREBOARD", "Can't find ref_seq")
    endfunction

    virtual function void write(Item m_item);

    act_seq = act_seq << 1 | m_item.in ;

    assert(m_item.out != exp_out)
        `uvm_error("SCOREBOARD", $sformatf("FAILED: act_seq: %4b , ref_seq: %4b, out: %0b", act_seq, ref_seq, m_item.out))
    else
        `uvm_info("SCOREBOARD", $sformatf("PASSED: act_seq: %4b , ref_seq: %4b, out: %0b", act_seq, ref_seq, m_item.out),UVM_LOW)
    
    if(act_seq == ref_seq) begin
        `uvm_info("SCOREBOARD", $sformatf("Pattern detected: check out = 1 next clock cycle"),UVM_LOW)
        exp_out = 1;
    end else begin
        exp_out = 0;
    end
    
    endfunction

endclass 