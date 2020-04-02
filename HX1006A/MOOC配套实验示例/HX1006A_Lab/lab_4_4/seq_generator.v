module seq_generator(
	input					clk,
	input					rst_n,
	output	reg		data
);

	parameter HEAD  = 8'b11101000;
	parameter DATA0 = 8'b11110000;
	parameter DATA1 = 8'b00001111;
	parameter DATA2 = 8'b11111111;
	parameter DATA3 = 8'b10101010;
	parameter SUM   = 8'b10101000;

	reg [5:0] bit_cnt;

always @ (posedge clk or negedge rst_n)
begin 
	if(!rst_n)
		bit_cnt <= 1'b0;
	else if(bit_cnt < 6'd47)
		bit_cnt <= bit_cnt + 1'b1;
	else
		bit_cnt <= 1'b0;
end
	
always @ (posedge clk or negedge rst_n)
begin 
	if(!rst_n)
		data <= 1'b0;
	else
		case(bit_cnt[5:3])
			3'b000 : data <= HEAD[3'd7-bit_cnt[2:0]];
			3'b001 : data <= DATA0[3'd7-bit_cnt[2:0]];
			3'b010 : data <= DATA1[3'd7-bit_cnt[2:0]];
			3'b011 : data <= DATA2[3'd7-bit_cnt[2:0]];
			3'b100 : data <= DATA3[3'd7-bit_cnt[2:0]];
			3'b101 : data <= SUM[3'd7-bit_cnt[2:0]];
		endcase
end

endmodule
