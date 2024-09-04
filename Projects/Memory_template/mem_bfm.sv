class mem_bfm;
//1. instantiation of tx 
mem_tx tx;
//3. do interface instantiation as virtual interface
virtual mem_intf vif;
//3. point the virtual interface handle to physical interface in top module
function new();
	vif = top.pif;//we are pointing the vif to pif in top module
endfunction

//2. inside a forver block 
//		get the tx from DUT and drive to design using interface

task run();
	$display("####### mem_bfm run task ########");
	forever begin
		mem_common::gen2bfm.get(tx);
		drive_tx(tx);//user defind task to write a logic to drive the tx to design through interface
		//tx.print("mem_tx");
	end
endtask

task drive_tx(mem_tx tx);
	@(vif.bfm_cb);//here @(posedge vif.clk_i) is same as @(vif.bfm_cb)
	vif.bfm_cb.addr_i <= tx.addr;//#1
	vif.bfm_cb.wr_rd_i <= tx.wr_rd;//#1
	if(tx.wr_rd == WR) begin//write operation
		vif.bfm_cb.wdata_i <= tx.w_data;
	end
	vif.bfm_cb.valid_i <= 1;
	wait(vif.bfm_cb.ready_o == 1);
	if(tx.wr_rd == RD) begin//READ operation
		tx.r_data = vif.bfm_cb.rdata_o;
	end
	//@(vif.bfm_cb);
	vif.bfm_cb.addr_i <= 0;
	vif.bfm_cb.wdata_i <= 0;
	vif.bfm_cb.wr_rd_i <= 0;
	vif.bfm_cb.valid_i <= 0;
endtask
endclass
