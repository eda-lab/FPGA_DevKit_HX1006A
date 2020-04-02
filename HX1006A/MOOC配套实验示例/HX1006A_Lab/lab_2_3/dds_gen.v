module dds_gen 
#(parameter N = 24, M= 12, W = 10 )
(
	input clk,
	input	rst_n,
	input	[N-1:0] FreqWord,
	output reg[W-1:0] q_sin
	
);

reg [N-1:0] acc;
reg [W-1:0] sinrom[2**M-1:0];


always @(posedge clk,negedge rst_n)
	if(!rst_n)
		acc <= 0;
	else 
		acc <= acc + FreqWord;


initial $readmemh("sin4096x10.txt",sinrom);
always @(posedge clk)
	q_sin <= sinrom[acc>>(N-M)];
	
		
endmodule 