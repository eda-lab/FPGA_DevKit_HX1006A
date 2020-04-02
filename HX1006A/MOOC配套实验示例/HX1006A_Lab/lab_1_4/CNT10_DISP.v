module CNT10_DISP
(
	input 	CLK_50,			//Clock
	input		[2:0] KEY, 		//[2:0] KEY = Enable, Reset, Load							
	input 	[3:0] SW,  		//4-bit parallel loading data
	
	output 	[7:0] SEL,		//Selection of Digital Tube Section 		
	output 	[7:0] DIG		//8-segment digital tube
);

/*_______________________________*/

localparam DIV_LEN = 50_000_000;  //Division factor/2
reg		[25:0] div_cnt;	//Frequency division count
reg  				 clk;			//Clock after division

wire en,load_n,reset_n;		//Enable, Reset, Load
wire cout;						//Counting carry
wire 		[3:0]  DATA;	

reg 		[6:0]  DIG7S;     //8-segment digital tube without point
reg 		[3:0]  Q1 ; 

assign {en, load_n, reset_n} = KEY; //Set Enable,Reset and Load
assign DIG = {~cout,DIG7S}; 			//Set DIG output
assign DATA = SW; 					   //Set load value
assign DOUT = Q1;  						//Output the internal register count result to DOUT
assign SEL = 8'b1111_1110; 		   //Set the selection of Digital Tube Section

/*Clock division*/
always @(posedge CLK_50 or negedge reset_n) begin 
	if(!reset_n)
		clk <= 0;
	else if(div_cnt < DIV_LEN/2-1)
		clk <= 1'b1;
	else 
		clk <= 0;
end

always @(posedge CLK_50 or negedge reset_n) begin 
	if(!reset_n)
		div_cnt <= 0;
	else if(div_cnt < DIV_LEN - 1'b1)
		div_cnt <= div_cnt + 1'b1;
	else 
		div_cnt <= 0;
end
/*_______________________________*/


always @(posedge clk or negedge reset_n)  begin  //Timing process
	if (!reset_n)   //Asynchronously clear the internal register unit
		Q1 <= 4'd0;		 //when RST=0
	else if (en) begin  //Synchronization  enable EN=1, allows loading or counting
		if (!load_n)  //When LOAD=0, data is loaded into internal registers
			Q1 <= DATA;  
		else if (Q1 < 4'h9)  //Accumulation allowed when Q1 is less than 9
			Q1 <= Q1 + 1'b1;  
		else  //Otherwise clear and return to initial value
			Q1 <= 4'b0; 
	end
end

assign cout = (Q1==9);


always @* begin
	case(Q1)  
		4'h0	:	DIG7S	<=	7'b1000_000;//7'b0111_111;
		4'h1	:	DIG7S	<=	7'b1111_001;//7'b0000_110;
		4'h2	:	DIG7S	<=	7'b0100_100;//7'b1011_011;
		4'h3	:	DIG7S	<=	7'b0110_000;//7'b1001_111;
		4'h4	:	DIG7S	<=	7'b0011_001;//7'b1100_110;
		4'h5	:	DIG7S	<=	7'b0010_010;//7'b1101_101;
		4'h6	:	DIG7S	<= 7'b0000_010;//7'b1111_101;
		4'h7	:	DIG7S	<=	7'b1111_000;//7'b0000_111;
		4'h8	:	DIG7S	<=	7'b0000_000;//7'b1111_111;
		4'h9	:	DIG7S	<=	7'b0010_000;//7'b1101_111;
		4'hA	:	DIG7S	<=	7'b0001_000;//7'b1110_111;
		4'hB	:	DIG7S	<=	7'b0000_011;//7'b1111_100;
		4'hC	:	DIG7S	<=	7'b1000_110;//7'b0111_001;
		4'hD	:	DIG7S	<=	7'b0100_001;//7'b1011_110;
		4'hE	:	DIG7S	<=	7'b0000_110;//7'b1111_001;
		4'hF	:	DIG7S	<=	7'b0001_110;//7'b1110_001;
		default  :  DIG7S <= 7'b1000_000;//7'b0111_111;	
	endcase
end


		
endmodule