class adder_env extends uvm_env;
`uvm_component_utils(adder_env)
adder_agent agent;

`NEW_COMPONENT

function void build_phase(uvm_phase phase);
	$display("running build phase in env");
	agent = adder_agent::type_id::create("agent",this);
endfunction

endclass
