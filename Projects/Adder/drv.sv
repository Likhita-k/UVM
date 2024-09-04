class adder_driver extends uvm_driver#(adder_tx);
`uvm_component_utils(adder_driver)
`NEW_COMPONENT
virtual adder_intf vif;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	if(!uvm_config_db#(virtual adder_intf)::get(this,"","adder_vif",vif))begin
	`uvm_error("DRIVER_CONFIG_DB","Not able to retrieve inferface handle")	
end
endfunction

task run_phase(uvm_phase phase);
	forever begin
		seq_item_port.get_next_item(req);
		drive(req);
		req.print();
		seq_item_port.item_done();
	end
endtask

task drive(adder_tx tx);
	@(posedge vif.clk_i);
	vif.i1 = tx.i1;
	vif.i2 = tx.i2;
	tx.out = vif.out;
	`uvm_info("DRIVER",$sformatf("vif.i1=%0d,vif.i2=%0d,vif.out=%0d",vif.i1,vif.i2,vif.out),UVM_NONE)
	`uvm_info("DRIVER",$sformatf("tx.i1=%0d,tx.i2=%0d,tx.out=%0d",tx.i1,tx.i2,tx.out),UVM_NONE)
	@(posedge vif.clk_i);
	vif.i1 = 0;
	vif.i2 = 0;
endtask
endclass
