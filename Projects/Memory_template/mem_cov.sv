class mem_cov;

mem_tx tx;

covergroup mem_cg;
	WR_RD_CP:coverpoint tx.wr_rd{
		bins wr_bin = {1};
		bins rd_bin = {0};
	}
	ADDR_CP:coverpoint tx.addr{
		option.auto_bin_max = 8;
	}
	ADDR_WR_RD_CROSS:cross WR_RD_CP,ADDR_CP;
endgroup

function new();
	mem_cg = new();
endfunction

task run();
	//1. get tx from mailbox
	//2.sample
	while(1) begin
		mem_common::mon2cov.get(tx);
		mem_cg.sample();
	end

endtask
endclass
