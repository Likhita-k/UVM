class adder_mon extends uvm_monitor;

virtual adder_intf vif;
adder_tx tx;
`uvm_component_utils(adder_mon)
`NEW_COMPONENT
uvm_analysis_port#(adder_tx) ap_port;

function void build_phase(uvm_phase phase);
	`uvm_info("ADDER_MON","running build_phase of adder_mon",UVM_NONE)
	ap_port = new("ap_port",this);
endfunction

task run_phase(uvm_phase phase);
	if(!uvm_config_db#(virtual adder_intf)::get(this,"","adder_vif",vif))begin
	`uvm_error("ADDER_MON","unable to retrieve vif")
	end
	forever begin 
		@(posedge vif.clk_i);
		tx = new();
		tx.i1 = vif.i1; 
		tx.i2 = vif.i2; 
		tx.out = vif.out; 
		`uvm_info("MONITOR",$sformatf("vif.i1=%0d,vif.i2=%0d,vif.out=%0d",vif.i1,vif.i2,vif.out),UVM_NONE)
		`uvm_info("MONITOR",$sformatf("tx.i1=%0d,tx.i2=%0d,tx.out=%0d",tx.i1,tx.i2,tx.out),UVM_NONE)
		ap_port.write(tx);
	end
endtask
endclass
