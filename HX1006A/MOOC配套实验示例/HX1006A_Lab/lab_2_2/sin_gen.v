module sin_gen (
	input clk,
	input	rst_n,
	input	en,
	output reg [7:0] Q
);

reg [6:0] cnt;
reg [7:0] sinrom[2**7-1:0];



always @(posedge clk,negedge rst_n)
	if(!rst_n)
		cnt <= 0;
	else if(en)
		cnt <= cnt + 1;


initial $readmemh("rom78.txt",sinrom);
always @ (posedge clk)
	Q <= sinrom[cnt];
				
endmodule 