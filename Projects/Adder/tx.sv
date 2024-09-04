class adder_tx extends uvm_sequence_item;
rand bit [`NUM-1:0]i1,i2;
	 bit [`NUM:0]out;

`uvm_object_utils_begin(adder_tx)
	`uvm_field_int(i1,UVM_ALL_ON);
	`uvm_field_int(i2,UVM_ALL_ON);
`uvm_object_utils_end

`NEW_OBJECT

constraint c1{
	i1<100;
	i2<100;
}
endclass
