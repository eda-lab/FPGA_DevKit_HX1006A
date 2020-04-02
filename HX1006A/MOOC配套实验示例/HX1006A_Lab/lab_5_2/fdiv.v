module fdiv(
	input			clk,
	output		pm
);

	reg [8:0] Q1;
	reg FULL;
	wire RST;

always @ (posedge clk or posedge RST)
begin
	if(RST) begin
		Q1 <= 0;
		FULL <= 1;
		end
	else begin
		Q1 <= Q1 + 1;
		FULL <= 0;
	end
end

assign RST = (Q1 == 499);
assign pm = FULL;
assign DOUT	= Q1;

endmodule 


//module FDIV (CLK, PM);
//		input CLK;
//		output PM;
//		reg [8:0] Q1;
//		reg FULL;
//		wire RST;
//		always @ (posedge CLK or posedge RST)
//				begin
//						if	(RST)
//								begin
//										Q1 <= 0;
//										FULL <= 1;
//								end
//						else
//								begin
//										Q1 <= Q1 + 1;
//										FULL <= 0;
//								end
//				end
//		assign RST = (Q1 == 499);
//		assign PM = FULL;
//		assign	DOUT	=	Q1;
//endmodule 

/*仿真用代码
module FDIV (CLK, PM,reset_n);
		input CLK;
		input reset_n;
		output PM;
		reg [8:0] Q1;
		reg FULL;
		wire RST;
		always @ (posedge CLK or posedge RST or negedge reset_n)
				begin
						if	(RST)
								begin
										Q1 <= 0;
										FULL <= 1;
								end
						else if	(!reset_n)
								begin
										FULL <= 0;
										Q1 <= 0;
								end
						else
								begin
										Q1 <= Q1 + 1;
										FULL <= 0;
								end
				end
		assign RST = (Q1 == 499);
		assign PM = FULL;
		assign	DOUT	=	Q1;
endmodule 
*/