module seq_rd(
	input					clk            ,
	input					rst_n          ,
	input					data_in        ,

	//Output signal
	output     [7:0]  out_data0      ,
	output     [7:0]  out_data1      ,
	output     [7:0]  out_data2      ,
	output     [7:0]  out_data3      ,
	output            out_check_flag 
);	
	/*-------parameter&reg---------------*/	
	reg [5:0]	bit_cnt;	
	reg [40:0]	data;
	reg [7:0]	sum;
	wire [7:0]	sum_check;  //求和检验	
	wire 			head_check;  //帧头检验       

assign {out_data0, out_data1, out_data2, out_data3, sum_check} = data[39:0];
assign out_check_flag = ((bit_cnt==6'd40) && (sum_check == sum));

/*--------------获取帧头-------------*/
seq_detect u_seq_detect(
	.clk					(clk),		
	.rst_n				(rst_n),	
	.data_in				(data_in),	
	.sout					(head_check)	
);

always @ (posedge clk or negedge rst_n)
begin 
	if(!rst_n) begin 
		bit_cnt <= 6'b0;
		data <= 40'b0;
	end
	else if(head_check) begin
		bit_cnt <= 6'd1;
		data[0] <= data_in;
	end
	else if(bit_cnt < 6'd40) begin
		bit_cnt <= bit_cnt + 1'b1;
		data[0] <= data_in;
		data[40:1] <= data[39:0];
	end
	else begin
		bit_cnt <= 	6'b0;	
	end
end

always @ (posedge clk or negedge rst_n)
begin 
	if(!rst_n)
		sum <= 8'b0;
	else if(head_check)
		sum <= 8'b0;
	else if(bit_cnt[2:0] == 3'b111 && bit_cnt[5] != 1'b1)
		sum <= sum + {data[6:0], data_in};
end

endmodule

	
	
	
	