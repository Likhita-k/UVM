class adder_scb extends uvm_subscriber#(adder_tx);
adder_tx itemq[$];
adder_tx tx;
`uvm_component_utils(adder_scb)

`NEW_COMPONENT

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

function void write(adder_tx t);
	$cast(tx,t);
	itemq.push_back(tx);
endfunction

task run_phase(uvm_phase phase);
adder_tx comp;
forever begin 
wait(itemq.size>0);
if(itemq.size>0)begin
	comp = itemq.pop_front();
	if(comp.i1+comp.i2 == comp.out)begin
//		`uvm_info("SCOREBOARD",$sformatf("Matched:i1=%0d,i2=%0d, out=%0d",comp.i1,comp.i2,comp.out),UVM_NONE)
	end
	else begin
		`uvm_error("SCOREBOARD",$sformatf("not Matched:i1=%0d,i2=%0d, out=%0d",comp.i1,comp.i2,comp.out))	
	end
end
end
endtask
endclass
