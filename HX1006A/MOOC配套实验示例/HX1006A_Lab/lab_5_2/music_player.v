module music_player(
	input					clk,
	input					rst_n,
	
	output				speak,
	output				high,
	output	[3:0]		led,
	
	output		 	   VGA_HSYNC,
	output 		 	   VGA_VSYNC,	
	output 	[11:0]   VGA_D
);

wire clk_1M;
wire clk_2K;
pll pll_inst(
	.inclk0  	(clk),
	.c0			(clk_1M),
	.c1			(clk_2K)
);

wire clk4hz;
fdiv u_fdiv(
	.clk			(clk_2K),
	.pm			(clk4hz)
);

wire [7:0] cnt8;
cnt138t u_cnt138(
	.clk			(clk4hz),
	.rst_n		(rst_n),
	.cnt8			(cnt8)
	);
	
wire [3:0] q;
music	u_music(
	.address 	(cnt8),
	.clock 		(clk4hz),
	.q 			(q)
);

wire [10:0] TN;
//wire [3:0] led;
//wire high;
f_code u_f_code(
	.INX			(q),
	.CODE			(led),
	.TO			(TN),
	.H				(high)
);

wire spk;
speak u_speker (
	.clk			(clk_1M),
	.TN			(TN),
	.SPKS			(speak)
);

wire Q;
DFF DFF1(
	.clk(spk),
	.D(!Q),
	.Q(Q)
);

assign SPK_KX = Q;

vga_bmp u_vga_bmp(
	.clk			(clk),
	.reset_n		(rst_n),
	
	.VGA_HSYNC	(VGA_HSYNC),
	.VGA_VSYNC	(VGA_VSYNC),
	
	.VGA_D		(VGA_D)			
);


//音响
//wire spk;
//speak u_speker (
//	.clk			(clk_1M),
//	.TN			(TN),
//	.SPKS			(spk)
//);
//
//wire Q;
//DFF DFF1(
//	.clk(spk),
//	.D(!Q),
//	.Q(Q)
//);
//
//assign speak = Q;



endmodule 
	
