class Item extends uvm_sequence_item;

`uvm_object_utils(Item)

function new(string name="Item");
super.new(name);
endfunction

rand bit in;
bit rst;
bit out;

virtual function string convert2str();
return $sformatf("in=%0d, out=%0d, rst=%0d", in, out, rst);
endfunction


constraint c1 {in dist{ 0:/20 , 1:/80};}
endclass