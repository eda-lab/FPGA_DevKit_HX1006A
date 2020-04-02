module dds_top(
	input clk,
	input	rst_n,
	input	[2:0] key
);

wire [23:0] FreqWord;
wire [23:0] PhaseWord;
wire [9:0] AmpWord;

assign FreqWord = {8'b0, key[0], 2'd1, 13'd0};
assign PhaseWord = {4'b0, key[1], 19'd0};
assign AmpWord = {1'b1, key[2], 8'd0};

dds_mult dds_mult_inst
(
	.clk(clk) ,	// input  clk_sig
	.rst_n(rst_n) ,	// input  rst_n_sig
	.FreqWord(FreqWord) ,	// input [N-1:0] FreqWord_sig
	.PhaseWord(PhaseWord) ,	// input [N-1:0] PhaseWord_sig
	.AmpWord(AmpWord) ,	// input [MA-1:0] AmpWord_sig
	.q_sin() ,	// output [W-1:0] q_sin_sig
	.q_mult() 	// output [W-1:0] q_mult_sig
);
		
endmodule

