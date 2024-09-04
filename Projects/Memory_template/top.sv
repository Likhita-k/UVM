module top;

reg clk_i,rst_i;
mem_intf pif(.clk_i(clk_i),.rst_i(rst_i));
memory dut(.clk_i(pif.clk_i), 
			  .rst_i(pif.rst_i), 
			  .addr_i(pif.addr_i), 
			  .wdata_i(pif.wdata_i), 
			  .rdata_o(pif.rdata_o), 
			  .wr_rd_i(pif.wr_rd_i), 
			  .valid_i(pif.valid_i), 
			  .ready_o(pif.ready_o)
			  );

initial begin
	clk_i = 0;
	forever #5 clk_i = ~clk_i;
end

initial begin 
	run_test("base_test");
end
initial begin
	rst_i = 1;
	repeat(2) @(posedge clk_i);
	rst_i = 0;

end

endmodule
