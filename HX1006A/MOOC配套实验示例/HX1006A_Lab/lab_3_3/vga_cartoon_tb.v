`timescale 10ns/100ps
module vga_cartoon_tb();


reg clk50M;
reg reset_n;
reg [1:0] key;
wire VGA_HSYNC;
wire VGA_VSYNC;
wire [11:0] VGA_D;


vga_cartoon vga_cartoon_inst
(
	.clk50M(clk50M) ,	// input  clk50M_sig
	.reset_n(reset_n) ,	// input  reset_n_sig
	.key(key) ,	// input [1:0] key_sig
	.VGA_HSYNC(VGA_HSYNC) ,	// output  VGA_HSYNC_sig
	.VGA_VSYNC(VGA_VSYNC) ,	// output  VGA_VSYNC_sig
	.VGA_D(VGA_D) 	// output [11:0] VGA_D_sig
);

initial
begin
	clk50M = 1'b0;
	forever #5 clk50M = ~clk50M;
end

initial
begin
	$stop;
	reset_n = 0;
	key = 2'd0;
	#15 reset_n = 1;
		key = 2'b01;
	#4000000
		$stop;
end

endmodule 
