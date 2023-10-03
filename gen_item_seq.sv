class gen_item_seq extends uvm_sequence;

`uvm_object_utils(gen_item_seq)

rand int num;

constraint c1 {soft num inside {[10:50]};}

function new(string name="gen_item_seq");
    super.new(name);
endfunction

virtual task body();
repeat(num)begin
    Item m_item = Item::type_id::create("m_item");
    start_item(m_item);
    assert(m_item.randomize());
    `uvm_info("SEQ", $sformatf("Generate: %s",m_item.convert2str()),UVM_HIGH)
    finish_item(m_item);
end
`uvm_info("SEQ", $sformatf("Generate is done of %0d items",num),UVM_LOW)

endtask

endclass