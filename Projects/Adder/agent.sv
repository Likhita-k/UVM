class adder_agent extends uvm_agent;

`uvm_component_utils(adder_agent) 
adder_sqr sqr;
adder_driver drv;
adder_mon mon;
adder_scb scb;

`NEW_COMPONENT 


function void build_phase(uvm_phase phase);
	$display("build phase of agent");
	sqr = adder_sqr::type_id::create("sqr",this);
	drv = adder_driver::type_id::create("drv",this);
	mon = adder_mon::type_id::create("mon",this);
	scb = adder_scb::type_id::create("scb",this);
endfunction 

function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	drv.seq_item_port.connect(sqr.seq_item_export);
	mon.ap_port.connect(scb.analysis_export);
endfunction

endclass
