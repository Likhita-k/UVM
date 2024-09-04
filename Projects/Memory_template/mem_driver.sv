class mem_driver extends uvm_driver#(mem_tx);
`uvm_component_utils(mem_driver)

function new(string name="",uvm_component parent=null);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	$display("build_phase of mem_driver");
endfunction

function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	$display("connect phase of mem_driver");
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
	super.end_of_elaboration_phase(phase);
	$display("end_of_elaboration_phase of the mem_driver");
	uvm_top.print_topology();
endfunction

function void start_of_simulation_phase(uvm_phase phase);
	super.start_of_simulation_phase(phase);
	$display("start_of_elaboration_phase of the mem_driver");
endfunction	

function void extract_phase(uvm_phase phase);
	super.extract_phase(phase);
	$display("extract_phase of the mem_driver");
endfunction

function void check_phase(uvm_phase phase);
	super.check_phase(phase);
	$display("check_phase of the mem_driver");
endfunction

function void report_phase(uvm_phase phase);
	super.report_phase(phase);
	$display("report_phase of the mem_driver");
endfunction

task run_phase(uvm_phase phase);
	super.run_phase(phase);
	$display("run_phase of the mem_driver");
endtask


endclass
