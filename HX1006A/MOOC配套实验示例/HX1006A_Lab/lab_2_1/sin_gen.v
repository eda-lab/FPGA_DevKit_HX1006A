module sin_gen (
	input clk,
	input	rst_n,
	input	en,
	output [7:0] Q
);

wire [6:0] cntcout;

CNT7B u_CNT7B(
	.clk(clk),
	.en(en),
	.reset_n(rst_n),
	.q(cntcout)
);

ROM78 u_rom(
	.address ( cntcout ),
	.clock ( clk ),
	.q ( Q )
);

endmodule 