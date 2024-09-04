class mem_gen;
mem_tx tx;
bit [`ADDR_WIDTH-1:0] addrq[$];
rand bit [`ADDR_WIDTH-1:0] unique_addrq[$];
bit [`ADDR_WIDTH-1:0] value;
constraint unique_addrq_c{
	unique_addrq.size == mem_common::num_tx;
	unique {unique_addrq};
}

task run();
	$display("mem_gen run task");
	case(mem_common::testname)
		"basic_test_one_wr_rd":begin
			$display("testname=%s",mem_common::testname);
			//write
			tx = new();
			assert(tx.randomize() with {tx.wr_rd == WR;});
			tx.print("mem_gen");
			mem_common::gen2bfm.put(tx);
			
			//read
			tx = new();
			assert(tx.randomize() with {tx.wr_rd == RD;});
			tx.print("mem_gen");
			mem_common::gen2bfm.put(tx);
		end

		"test_5_wr_5_rd":begin
			$display("testname=%s",mem_common::testname);
			assert(this.randomize()); 	
			$display("unique_addrq=%p",unique_addrq);
			//write
			for(int i=0;i<5;i++)begin
				tx = new();
				assert(tx.randomize() with {tx.wr_rd == WR;});
				addrq.push_back(tx.addr);
				tx.print("mem_gen");
				mem_common::gen2bfm.put(tx);
			end

			//read
			for(int i=0;i<5;i++)begin 
				tx = new();
				tx.wr_rd = RD;
				tx.addr = addrq.pop_front();
				tx.print("mem_gen");
				mem_common::gen2bfm.put(tx);
			end
		end	

		"test_n_wr_n_rd":begin
			$display("testname=%s",mem_common::testname);
			assert(this.randomize()); 	
			$display("unique_addrq=%p",unique_addrq);
			//write
			for(int i=0;i<mem_common::num_tx;i++)begin
				tx = new();
				value = unique_addrq.pop_back();
				assert(tx.randomize() with {tx.wr_rd == WR;
									   tx.addr == value;});
				$display("unique_addrq=%p",unique_addrq);									   
				addrq.push_back(tx.addr);
			//	unique_addrq.push_front(tx.addr);
				$display("addrq=%p",addrq);									   
				tx.print("mem_gen");
				mem_common::gen2bfm.put(tx);
			end

			//read
			for(int i=0;i<mem_common::num_tx;i++)begin 
				tx = new();
				tx.wr_rd = RD;
				tx.addr = addrq.pop_front();
			//	tx.addr = unique_addrq.pop_back();
				mem_common::gen2bfm.put(tx);
			end	
		end
	endcase	
endtask	

endclass
