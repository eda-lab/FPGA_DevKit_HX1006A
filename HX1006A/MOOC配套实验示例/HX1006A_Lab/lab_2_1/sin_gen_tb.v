`timescale 10ns/100ps

module sin_gen_tb();


reg clk;
reg	rst_n;
reg	en;
wire [7:0] Q;



sin_gen sin_gen_inst
(
	.clk(clk) ,	// input  clk_sig
	.rst_n(rst_n) ,	// input  rst_n_sig
	.en(en) ,	// input  en_sig
	.Q(Q) 	// output [7:0] Q_sig
);


initial 
begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end


initial 
begin
	rst_n = 0;
	en = 1'b1;
	#15 rst_n = 1'b1;
	#10000 $stop;
end



endmodule 
