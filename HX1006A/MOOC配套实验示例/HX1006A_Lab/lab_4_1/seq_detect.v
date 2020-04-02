module seq_detect(
	input					clk,		//时钟输入
	input					rst_n,	//复位信号
	input					data_in,	//串行数据输入
	output		wire  sout		//序列检测输出
);

/*-------parameter&reg---------------*/
	parameter s0=0, s1=1, s2=2, s3=3, s4=4, s5=5, s6=6, s7=7, s8=8;

reg  [3:0]			current_state;	//现状态
reg  [3:0]			next_state; 	//次状态

/*-----------------------------------*/
always @(posedge clk or negedge rst_n) begin 
	if (!rst_n)
		current_state <= s0;
	else
		current_state <= next_state;
end

always @(*) begin 
	case(current_state) 
		s0 : if(data_in == 1'b1) next_state <= s1; else next_state <= s0;
		s1 : if(data_in == 1'b1) next_state <= s2; else next_state <= s0;
		s2 : if(data_in == 1'b1) next_state <= s3; else next_state <= s0;
		s3 : if(data_in == 1'b0) next_state <= s4; else next_state <= s3;
		s4 : if(data_in == 1'b1) next_state <= s5; else next_state <= s0;
		s5 : if(data_in == 1'b0) next_state <= s6; else next_state <= s2;
		s6 : if(data_in == 1'b0) next_state <= s7; else next_state <= s1;
		s7 : if(data_in == 1'b0) next_state <= s8; else next_state <= s1;
		s8 : if(data_in == 1'b0) next_state <= s0; else next_state <= s1;
		default : next_state <= s0;	
	endcase	
end

assign sout = (current_state == s8);

endmodule

//force data_in 1 0,0 300ns,1 400ns,0 500ns -repeat 800ns
