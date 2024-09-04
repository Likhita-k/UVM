class mem_env extends uvm_env;
`uvm_component_utils(mem_env)

function new(string name="",uvm_component parent=null);
	super.new(name,parent);
endfunction

mem_agent agent;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	$display("build_phase of mem_env");
	agent = new("agent",this);
endfunction

function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	$display("connect phase of mem_env");
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
	super.end_of_elaboration_phase(phase);
	$display("end_of_elaboration_phase of the mem_env");
endfunction

function void start_of_simulation_phase(uvm_phase phase);
	super.start_of_simulation_phase(phase);
	$display("start_of_elaboration_phase of the mem_env");
endfunction	

function void extract_phase(uvm_phase phase);
	super.extract_phase(phase);
	$display("extract_phase of the mem_env");
endfunction

function void check_phase(uvm_phase phase);
	super.check_phase(phase);
	$display("check_phase of the mem_env");
endfunction

function void report_phase(uvm_phase phase);
	super.report_phase(phase);
	$display("report_phase of the mem_env");
endfunction

task run_phase(uvm_phase phase);
	super.run_phase(phase);
	$display("run_phase of the mem_env");
endtask

endclass
