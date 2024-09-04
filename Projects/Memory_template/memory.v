`define WIDTH 32 
`define DEPTH 16
`define ADDR_WIDTH $clog2(`DEPTH)
module memory(clk_i, rst_i, addr_i, wdata_i, rdata_o, wr_rd_i, valid_i, ready_o);
//input and outputs
input clk_i, rst_i;
input [`ADDR_WIDTH-1:0] addr_i; //size of vector? how many bits required to access memory locations
input [`WIDTH-1:0] wdata_i;
output reg [`WIDTH-1:0] rdata_o;
input wr_rd_i, valid_i;
output reg ready_o;

//1kb memory, 16 bit width
//memory is array of vector 
reg [`WIDTH-1:0] mem[`DEPTH-1:0]; //64*16 =1024bits = 1kb
integer i;

always @(posedge clk_i) begin //==> Verilog
if (rst_i == 1) begin
	for (i = 0; i < `DEPTH; i=i+1) mem[i] = 0;
	rdata_o = 0;
	ready_o = 0;
end
else begin
	if (valid_i == 1) begin//check for valid tx
		ready_o = 1;  //salve is ack the valid data
		if (wr_rd_i == 1) begin//check for write tx
			mem[addr_i] = wdata_i;//store the wdata_i to the mem addr locations
		end
		else begin//used to perform read operation
			rdata_o = mem[addr_i];//get the data from mem addr location and stor them in rdata_o for master to read
		end
	end
	else begin
		ready_o = 0;//if master is not sending any valid tx slave should also not be ready
	end
end
end
endmodule

