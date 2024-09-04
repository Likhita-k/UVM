class mem_agent extends uvm_agent;
`uvm_component_utils(mem_agent)

function new(string name="",uvm_component parent=null);
	super.new(name,parent);
endfunction

mem_driver driver;
mem_sequencer sequencer;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	$display("build_phase of mem_agent");
	driver = new("driver",this);
	sequencer = new("sequencer",this);
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
	super.end_of_elaboration_phase(phase);
	$display("end_of_elaboration_phase of the mem_agent");
endfunction

function void start_of_simulation_phase(uvm_phase phase);
	super.start_of_simulation_phase(phase);
	$display("start_of_elaboration_phase of the mem_agent");
endfunction

function void extract_phase(uvm_phase phase);
	super.extract_phase(phase);
	$display("extract_phase of the mem_agent");
endfunction

function void check_phase(uvm_phase phase);
	super.check_phase(phase);
	$display("check_phase of the mem_agent");
endfunction

function void report_phase(uvm_phase phase);
	super.report_phase(phase);
	$display("report_phase of the mem_agent");
endfunction

function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	$display("extract_phase of the mem_agent");
	driver.seq_item_port.connect(sequencer.seq_item_export);
endfunction


task run_phase(uvm_phase phase);
	super.run_phase(phase);
	$display("run_phase of the mem_agent");
endtask

endclass
