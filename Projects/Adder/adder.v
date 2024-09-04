module adder(clk_i,rst_i,i1,i2,out);

parameter NUM = 8;

input clk_i,rst_i;
input [NUM-1:0]i1,i2;
output reg [NUM:0]out;

always@(posedge clk_i or rst_i)begin 
	if(rst_i)begin
		out <= 0;
	end
	else begin 
		out <= i1+i2;
	end
end
endmodule
