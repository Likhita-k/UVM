`include "adder.v"
module tb;
parameter NUM = 8;
reg clk_i,rst_i;
reg [NUM-1:0]i1,i2;
wire [NUM:0]out;

adder dut(clk_i,rst_i,i1,i2,out);

initial begin
	clk_i = 0;
	forever #5 clk_i = ~clk_i;
end

initial begin 
	rst_i = 1;
	i1=0;
	i2=0;
	repeat(2)@(posedge clk_i);
	rst_i = 0;
	i1 = $random;
	i2 = $random;
	#5;
	$display("i1=%b,i2=%b",i1,i2);
	#5;
	$display("out=%b",out);
end

initial begin 
	#100;
	$finish;
end
endmodule
