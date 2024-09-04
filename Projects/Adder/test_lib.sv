class adder_base_test extends uvm_test;
`uvm_component_utils(adder_base_test)
`NEW_COMPONENT

adder_env env;
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	env = adder_env::type_id::create("env",this);

endfunction

function void end_of_elaboration_phase(uvm_phase phase);
	super.end_of_elaboration_phase(phase);
	uvm_top.print_topology();
endfunction
endclass

class adder_test extends adder_base_test;
`uvm_component_utils(adder_test)
`NEW_COMPONENT

task run_phase(uvm_phase phase);
adder_base_seq seq;
seq = adder_base_seq::type_id::create("seq",this);
phase.raise_objection(this);
	phase.phase_done.set_drain_time(this,100);
	#5;seq.start(env.agent.sqr);
phase.drop_objection(this);
endtask

endclass
