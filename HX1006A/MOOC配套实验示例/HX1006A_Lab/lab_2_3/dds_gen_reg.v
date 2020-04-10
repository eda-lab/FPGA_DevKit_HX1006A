module dds_gen_reg 
#(parameter N = 24, M= 12, W = 10 )
(
	input clk,
	input	rst_n,
	//input	[N-1:0] FreqWord,
	output reg[W-1:0] q_sin
	
);

reg [N-1:0] acc;
reg [W-1:0] sinrom[2**M-1:0];
wire [N-1:0] FreqWord;
wire [N-1:0] probe;


source_probe source_probe_init(
	.source (FreqWord), // sources.source
	.probe  (probe)   //  probes.probe
);

assign FreqWord = probe;

always @(posedge clk,negedge rst_n)
	if(!rst_n)
		acc <= 0;
	else 
		acc <= acc + FreqWord;


initial $readmemh("sin4096x10.txt",sinrom);
always @(posedge clk)
	q_sin <= sinrom[acc>>(N-M)];
	
		
endmodule 