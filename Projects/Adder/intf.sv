interface adder_intf(input logic clk_i,input logic rst_i);

logic [`NUM-1:0]i1,i2;
logic [`NUM:0]out;

clocking drv_cb@(posedge clk_i);
	default input #0 output #0;
	output i1,i2;
	input out;

endclocking

clocking mon_cb@(posedge clk_i);
	default input #1;
	input i1,i2;
	input out;

endclocking
endinterface
