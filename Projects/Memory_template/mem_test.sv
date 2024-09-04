class base_test extends uvm_test;

`uvm_component_utils(base_test)

function new(string name="",uvm_component parent=null);
	super.new(name,parent);
endfunction

mem_env env;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	$display("build_phase of base_test");
	env = new("env",this);
endfunction

function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	$display("connect phase of base_test");
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
	super.end_of_elaboration_phase(phase);
	$display("end_of_elaboration_phase of the base_test");
	uvm_top.print_topology();
endfunction

function void start_of_simulation_phase(uvm_phase phase);
	super.start_of_simulation_phase(phase);
	$display("start_of_elaboration_phase of the base_test");
endfunction	
function void extract_phase(uvm_phase phase);
	super.extract_phase(phase);
	$display("extract_phase of the base_test");
endfunction

function void check_phase(uvm_phase phase);
	super.check_phase(phase);
	$display("check_phase of the base_test");
endfunction

function void report_phase(uvm_phase phase);
	super.report_phase(phase);
	$display("report_phase of the base_test");
endfunction

task run_phase(uvm_phase phase);
	super.run_phase(phase);
	$display("run_phase of the base_test");
	phase.raise_objection(this);
	phase.phase_done.set_drain_time(this,100);
//	#100;
	phase.drop_objection(this);
endtask

endclass




   
