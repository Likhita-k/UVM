class mem_tx extends uvm_sequence_item;

rand bit [`ADDR_WIDTH-1:0] addr;
rand bit [`WIDTH-1:0] w_data;
	 bit [`WIDTH-1:0] r_data;
rand wr_rd_t wr_rd;

`uvm_object_utils_begin(mem_tx)
	`uvm_field_int(addr,UVM_ALL_ON)
    `uvm_field_enum(wr_rd_t,wr_rd,UVM_ALL_ON)
    `uvm_field_int(w_data,UVM_ALL_ON)
`uvm_object_utils_end
	
/*function new (string name = "uvm_sequence_item");
	super.new(name);
endfunction
*/	
endclass
