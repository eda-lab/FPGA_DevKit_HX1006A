`timescale 10ns/100ps

module dds_mult_tb();


reg clk;
reg	rst_n;
reg	[23:0] FW,PW;
reg	[9:0] AW;
wire [9:0] q,qm;



dds_mult dds_mult_inst
(
	.clk(clk) ,	// input  clk_sig
	.rst_n(rst_n) ,	// input  rst_n_sig
	.FreqWord(FW) ,	// input [N-1:0] FreqWord_sig
	.PhaseWord(PW) ,	// input [N-1:0] PhaseWord_sig
	.AmpWord(AW) ,	// input [MA-1:0] AmpWord_sig
	.q_sin(q) ,	// output [W-1:0] q_sin_sig
	.q_mult(qm) 	// output [W-1:0] q_mult_sig
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
	PW = 200;
	AW =512-256;
	#15 rst_n = 1'b1;
	#5
	// if(Q==0) $stop;
	#4000000 
		AW =512+256;
	#4000000 
		$stop;
end



endmodule 
