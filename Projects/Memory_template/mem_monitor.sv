class mem_monitor;
mem_tx tx;
virtual mem_intf vif;

function new();
	vif = top.pif;
endfunction

task run();
	while(1) begin
	tx = new();
		@(vif.mon_cb);
		if(vif.mon_cb.valid_i == 1 && vif.mon_cb.ready_o == 1) begin
			tx.addr = vif.mon_cb.addr_i;
			tx.wr_rd = wr_rd_t'(vif.mon_cb.wr_rd_i);
			if(tx.wr_rd == WR) tx.w_data = vif.mon_cb.wdata_i;	
			if(tx.wr_rd == RD) tx.r_data = vif.mon_cb.rdata_o;	
			tx.print("mem_mon");

			mem_common::mon2cov.put(tx);
		end
	end
endtask
endclass
