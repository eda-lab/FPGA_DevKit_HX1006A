module vga_disp	
(
	input           clk25M,
	input           reset_n,
	input [11:0]	rgb,
	
	output		 	VGA_HSYNC,
	output 		 	VGA_VSYNC,
	output			vs_flag,
	
	output [10:0]   x,
	output [10:0]	y,
	output reg [11:0]   VGA_D
);		

reg				hs;
reg				vs;
reg				vs_delay;
reg	[9:0]		hcnt;
reg [9:0] 	    vcnt;	
wire 			dis_en;

assign VGA_VSYNC = vs;
assign VGA_HSYNC = hs;
assign x = (hcnt >= (640-512)/2) ? hcnt-(640-512)/2 : 11'h7ff;
assign y = (vcnt >= (480-128)/2) ? vcnt-(480-128)/2 : 11'h7ff;
assign dis_en = (x<512 && y<128);  //图片显示区域
assign vs_flag = vs^vs_delay;  //行同步脉冲信号
			
always @(posedge clk25M or negedge reset_n) begin			//水平扫描计数器
	if(!reset_n)
		hcnt <= 0;
	else begin
		if (hcnt < 800)
			hcnt <= hcnt + 1'b1;
		else
			hcnt <= 0;
	end
end
			
always @(posedge clk25M or negedge reset_n) begin			//垂直扫描计数器
	if(!reset_n)
		vcnt <= 0;
	else begin
		if (hcnt == 640 + 8) begin
			if (vcnt < 525)
				vcnt <= vcnt + 1'b1;
			else
				vcnt <= 0;
		end
	end
end
			
always @(posedge clk25M or negedge reset_n) begin			//场同步信号发生
	if(!reset_n)
		hs	<=	1;
	else begin
		if((hcnt >=640+8+8) & (hcnt < 640+8+8+96))
			hs <= 1'b0;
		else
			hs <= 1'b1;
	end
end
			
always @(vcnt or reset_n) begin							//行同步信号发生
	if(!reset_n)
		vs	<=	1;
	else begin
		if((vcnt >= 480+8+2) &&(vcnt < 480+8+2+2))
			vs	<=	1'b0;
		else
			vs	<=	1'b1;
	end
end

always @ (posedge clk25M or negedge reset_n) begin
	if (!reset_n)
		vs_delay <= 1'b0;
	else
		vs_delay <= vs;
end
 
always @(posedge clk25M or negedge reset_n) begin
	if(!reset_n)
		VGA_D <= 0;
	else begin
		if (dis_en)	begin	
			VGA_D <= rgb;
		end
		else
			VGA_D <= 0;
	end
end
	
endmodule 
