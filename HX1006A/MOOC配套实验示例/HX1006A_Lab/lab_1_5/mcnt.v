module mcnt
(
	input clk,
	input rst_n,
	input en,
	input [31:0] m,
	output reg[31:0] q,
	output reg fout
);

always @(posedge clk,negedge rst_n)
	if(!rst_n)
		q <= 0;
	else if(en)
		if(q < m)
			q <= q + 1'b1;
		else
			q <= 0;
			
always @(posedge clk,negedge rst_n)
	if(!rst_n)
		fout <= 0;
	else if(q < m/2)
		fout <= 1'b1;
	else
		fout <= 0;

endmodule		