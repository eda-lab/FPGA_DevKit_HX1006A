module sincos_gen (
	input clk,
	input	rst_n,
	input	en,
	output reg [7:0] q_sin,q_cos
	
);

reg [6:0] cnt;
reg [7:0] sinrom[2**7-1:0];

wire [6:0] cnt_c;

always @(posedge clk,negedge rst_n)
	if(!rst_n)
		cnt <= 0;
	else if(en)
		cnt <= cnt + 1;


initial $readmemh("rom78.txt",sinrom);
assign cnt_c = cnt + 2**7/4;

always @ (posedge clk) begin
	q_sin <= sinrom[cnt];
	q_cos <= sinrom[cnt_c];	
end
		
endmodule 