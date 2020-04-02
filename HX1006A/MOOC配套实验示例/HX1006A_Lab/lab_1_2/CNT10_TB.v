`timescale 1 ns / 1 ps
module CNT10_TB();

reg CLK;
reg EN;
reg LOAD;
reg RST;
reg [3:0] DATA;
// wires   
wire [3:0] DOUT;
wire COUT;

CNT10 U_CNT10(
	.CLK		(CLK),
	.EN		(EN),
	.RST		(RST),
	.LOAD		(LOAD),
	.DATA		(DATA),
	.DOUT		(DOUT),
	.COUT		(COUT)
);

initial begin 
	CLK <= 1'b0;
	EN <= 1'b0;
	LOAD <= 1'b1;
	RST <= 1'b0;
	#20 	RST <= 1'b1;
	#20	EN <= 1'b1;
			DATA <= 4'B0011;
	#200	LOAD <= 1'b0;
	#20	LOAD <= 1'b1;
end

always #10 begin 
	CLK <= ~CLK;
end

endmodule                                         