module seg_disp
(
   input			        clk,    //segment digital tube change clock
	input				     rst_n,	//reset
	input			 [31:0] Q1,     //count input
	
	output 	reg [7:0]  SEL,		//Selection of Digital Tube Section 		
	output 	reg [7:0]  DIG		//8-segment digital tube
);

reg [1:0] cnt_sel;
reg [3:0] cnt_disp;

wire [3:0] q0 ; 
wire [3:0] q1 ; 
wire [3:0] q2 ; 

assign q0 = Q1[23:20];
assign q1 = Q1[27:24];
assign q2 = Q1[31:28];

always @(posedge clk or negedge rst_n) begin 
	if(!rst_n)
		cnt_sel <= 2'b0;
	else if(cnt_sel < 2'd2)
		cnt_sel <= cnt_sel + 1'b1;
	else
		cnt_sel <= 2'b0;
end

always @(posedge clk or negedge rst_n) begin 
	if(!rst_n)
		SEL <= 8'b1111_1111;
	else begin 
		case(cnt_sel)
			2'd0 : begin 
				SEL <= 8'b1111_1011;
				cnt_disp <= q0;
			end
			2'd1 : begin 
				SEL <= 8'b1111_1101;
				cnt_disp <= q1;
			end
			2'd2 : begin 
				SEL <= 8'b1111_1110;
				cnt_disp <= q2;
			end	
			default : begin 
				SEL <= 8'b1111_1111;
				cnt_disp <= 4'hff;
			end
		endcase
	end
end

always @* begin
	case(cnt_disp)  
		4'h0	:	DIG  <=	8'b1100_0000;//8'b0011_1111;
		4'h1	:	DIG  <=	8'b1111_1001;//8'b0000_0110;
		4'h2	:	DIG  <=	8'b1010_0100;//8'b0101_!011;
		4'h3	:	DIG  <=	8'b1011_0000;//8'b0100_1111;
		4'h4	:	DIG  <=	8'b1001_1001;//8'b0110_0110;
		4'h5	:	DIG  <=	8'b1001_0010;//8'b0110_1101;
		4'h6	:	DIG  <=  8'b1000_0010;//8'b0111_1101;
		4'h7	:	DIG  <=	8'b1111_1000;//8'b0000_0111;
		4'h8	:	DIG  <=	8'b1000_0000;//8'b0111_1111;
		4'h9	:	DIG  <=	8'b1001_0000;//8'b0110_1111;
		4'hA	:	DIG  <=	8'b1000_1000;//8'b0111_0111;
		4'hB	:	DIG  <=	8'b1000_0011;//8'b0111_1100;
		4'hC	:	DIG  <=	8'b1100_0110;//8'b0011_1001;
		4'hD	:	DIG  <=	8'b1010_0001;//8'b0101_1110;
		4'hE	:	DIG  <=	8'b1000_0110;//8'b0111_1001;
		4'hF	:	DIG  <=	8'b1000_1110;//8'b0111_0001;
		default  :  DIG <= 8'b1100_0000;//8'b0011_1111;	
	endcase
end
		
endmodule