module DFF(
	clk,
	D,
	Q
);
	input clk;
	input D;
	output Q;
	reg Q;
	always @(posedge clk)
		Q <= D;
endmodule
