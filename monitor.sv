class monitor extends uvm_monitor;

`uvm_component_utils(monitor)

virtual des_if vif;
uvm_analysis_port #(Item) mon_analysis_port;

function new(string name="monitor", uvm_component parent);
    super.new(name, parent);
endfunction

virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual des_if)::get(this,"","des_if",vif))
        `uvm_fatal("MON","Can't find Vif")
    mon_analysis_port = new("mon_analysis_port", this);
endfunction

virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
        @(vif.cb)
            if(vif.rst) begin
                Item m_item = Item::type_id::create("m_item", this);
                m_item.in = vif.in;
                m_item.out= vif.cb.out;
                m_item.rst= vif.rst;
                mon_analysis_port.write(m_item);
                `uvm_info("MON", $sformatf("Saw item: %s", m_item.convert2str()),UVM_HIGH)
            end
    end
endtask

endclass 