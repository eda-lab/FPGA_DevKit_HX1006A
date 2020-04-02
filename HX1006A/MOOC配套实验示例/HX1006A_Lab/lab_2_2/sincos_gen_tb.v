`timescale 10 ns/ 100 ps
module sincos_gen_tb();

reg clk;
reg rst_n;
reg en;
                                            
wire [7:0] q_sin;
wire [7:0] q_cos;

sincos_gen tb(
	.clk		(clk),
	.rst_n	(rst_n),
	.en		(en),
	.q_sin	(q_sin),
	.q_cos	(q_cos)
);

initial
begin
#0
	clk <= 1'b0;
	rst_n <= 1'b0;
	en <= 1'b0;
#10
	rst_n <= 1'b1;
	en <= 1'b1;
#5000
	$stop;
end

always #5 begin 
	clk <= ~clk;
end

endmodule

