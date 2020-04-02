module CNT7B (
	input clk,
	input reset_n,
	input en,
	output reg [6:0] q
);
always @ (posedge clk , negedge reset_n)
		if (!reset_n) 
			q <= 0;
		else if(en)
				q <= q + 1'b1;

endmodule 