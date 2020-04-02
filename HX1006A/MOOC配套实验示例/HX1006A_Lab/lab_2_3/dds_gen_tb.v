`timescale 10ns/100ps

module dds_gen_tb();


reg   clk;
reg	rst_n;
reg	[23:0]FW;
wire  [9:0] Q;

dds_gen i_dds_gen
(
	.clk(clk) ,	// input  clk_sig
	.rst_n(rst_n) ,	// input  rst_n_sig
	.FreqWord(FW) ,	// input [N-1:0] FreqWord_sig
	.q_sin(Q) 	// output [W-1:0] q_sin_sig
);


initial 
begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end


initial 
begin
	rst_n = 0;
	FW = 50;
	#15 rst_n = 1'b1;
	#4000000 
		FW = 200;
	#4000000 
		$stop;
end

endmodule 
