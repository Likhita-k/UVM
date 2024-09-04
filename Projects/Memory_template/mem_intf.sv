interface mem_intf(input logic clk_i,rst_i);
logic [`ADDR_WIDTH-1:0] addr_i;
logic [`WIDTH-1:0] wdata_i;
logic [`WIDTH-1:0] rdata_o;
logic wr_rd_i, valid_i;
logic ready_o;

//bfm 
clocking bfm_cb@(posedge clk_i);
	default input #1 output #0;
	output #1 addr_i;
	output #1 wdata_i;	output #1 valid_i;
	output #1 wr_rd_i;

	input #0 ready_o;
	input #0 rdata_o;
endclocking

//mon
clocking mon_cb@(posedge clk_i);
	default input #1 output #0;

	input #0 addr_i;
	input #0 wdata_i;
	input #0 valid_i;
	input #0 wr_rd_i;

	input #0 ready_o;
	input #0 rdata_o;
	
endclocking

endinterface
