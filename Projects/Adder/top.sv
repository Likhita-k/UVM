module top;

reg clk_i,rst_i;

adder_intf pif(.clk_i(clk_i),.rst_i(rst_i));

adder dut(.clk_i(pif.clk_i),.rst_i(pif.rst_i),.i1(pif.i1),.i2(pif.i2),.out(pif.out));


initial begin 
	clk_i = 0;
	forever #5 clk_i = ~clk_i;
end

initial begin 
	rst_i = 1;
	pif.i1=0;
	pif.i2=0;
	repeat(2)@(posedge clk_i);
	rst_i = 0;

end

initial begin
	run_test("adder_test");
end

initial begin 
	uvm_config_db#(virtual adder_intf)::set(uvm_root::get(),"*","adder_vif",pif);
end

initial begin 
	#1000;
	$finish();
end
endmodule
