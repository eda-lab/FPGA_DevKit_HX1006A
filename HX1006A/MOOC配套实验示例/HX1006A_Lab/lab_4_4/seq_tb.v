
`timescale 10ns/100ps
module seq_tb();

reg				clk;
reg				rst_n;

wire			data_in		  ;
wire [7:0]  out_data0     ;
wire [7:0]  out_data1     ;
wire [7:0]  out_data2     ;
wire [7:0]  out_data3     ;
wire        out_check_flag;

seq_rd u_seq_rd(
	.clk					(clk),
	.rst_n				(rst_n),
	.data_in				(data_in),

	.out_data0        (out_data0),
	.out_data1        (out_data1),
	.out_data2        (out_data2),
	.out_data3        (out_data3),
	.out_check_flag   (out_check_flag)
);

seq_generator u_seq_generator(
	.clk					(clk),
	.rst_n				(rst_n),
	.data					(data_in)
);

initial                                                
begin                                                  
	clk <= 0;
	rst_n <= 0;
	#15 	rst_n <= 1'b1;
	
	#2000 $stop;
end                              
		
initial 
begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end  
	
endmodule
