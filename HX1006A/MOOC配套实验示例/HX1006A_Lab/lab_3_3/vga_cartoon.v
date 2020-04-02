module vga_cartoon
(
	input		clk50M,
	input		reset_n,
	input [1:0] key,
    
	output	VGA_HSYNC,
	output 	VGA_VSYNC,

	output [11:0]  VGA_D
);

wire 		clk25M;
wire 		vs_flag;
wire 		orientation; 
wire [8:0]  position;
wire [2:0]  action;  
wire [10:0]	x;
wire [10:0]	y; 
wire [11:0] rgb;
 
pll pll_i(
	.inclk0	(clk50M),
	.c0	(clk25M)
);

rom_rgb rom_rgb_i(
	.clk		(clk25M),
	.reset_n	(reset_n),
	.x			(x),
	.y			(y),
	.position	(position),
	.action		(action),
	.orientation(orientation),
	.rgb		(rgb)
);

cartoon_ctr cartoon_ctr_i(
	.clk		(clk25M),
	.reset_n	(reset_n),
	.key		(key),
	.vs_flag	(vs_flag),
	.orientation(orientation),  
	.position	(position),
	.action		(action)  
);

vga_disp u_vga_disp(
	.clk25M 	(clk25M),
	.reset_n	(reset_n),
	.rgb		(rgb),
	
	.VGA_HSYNC	(VGA_HSYNC),
	.VGA_VSYNC	(VGA_VSYNC),
	.vs_flag	(vs_flag),
	
	.x			(x),
	.y			(y),
	.VGA_D		(VGA_D)
);

endmodule


