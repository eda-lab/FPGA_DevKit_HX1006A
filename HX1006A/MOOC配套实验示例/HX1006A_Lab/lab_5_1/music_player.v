module music_player(
	input					clk,
	input					rst_n,
	
	output				speak,
	output				high,
	output	[3:0]		led
);

//锁相环分频
wire clk_1M;
wire clk_2K;
pll pll_inst(   
	.inclk0  	(clk),
	.c0			(clk_1M),
	.c1			(clk_2K)
);

//计数分频
wire clk4hz;
fdiv u_fdiv(
	.clk			(clk_2K),
	.pm			(clk4hz)
);

//乐谱播放计数
wire [7:0] cnt8;
cnt138t u_cnt138(
	.clk			(clk4hz),
	.rst_n		(rst_n),
	.cnt8			(cnt8)
	);

//查找ROM
wire [3:0] q;
music	u_music(
	.address 	(cnt8),
	.clock 		(clk4hz),
	.q 			(q)
);

//音调编码
wire [10:0] TN;
f_code u_f_code(
	.INX			(q),
	.CODE			(led),
	.TO			(TN),
	.H				(high)
);

//音乐输出
wire spk;
speak u_speker (
	.clk			(clk_1M),
	.TN			(TN),
	.SPKS			(spk)
);

//DFF
wire Q;
DFF DFF1(
	.clk(spk),
	.D(!Q),
	.Q(Q)
);

assign speak = Q;

endmodule 
	
