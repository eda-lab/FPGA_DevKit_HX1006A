module CNT10 
(
	input 			CLK_50,		//Clock
	input		[2:0] KEY	, 		//[2:0] KEY = Enable, Reset, Load
										//Control Signals
										
	input 	[3:0] SW	  ,  	   //4-bit parallel loading data
	output 	[3:0] DOUT ,  		//4-bit count output
	output 			COUT   		//Counting carry output
);

/*_______________________________*/

localparam DIV_LEN = 50_000_000;    //Division factor
reg  				 clk;					   //Clock after division
reg		[25:0] div_cnt;			   //Frequency division count

wire en,load_n,reset_n;				   //Enable, Reset, Load
wire 		[3:0]  DATA;
wire cout;						         //Counting carry	

reg 		[3:0]  Q1 ; 

assign {en, load_n, reset_n} = KEY; //Set Enable,Reset and Load
assign DATA = SW;  						//Set load value
assign DOUT = Q1;  						//Output the internal register count result to DOUT


/*Clock division*/
always @(posedge CLK_50 or negedge reset_n) begin 
	if(!reset_n)
		clk <= 1'b0;
		else if(div_cnt < DIV_LEN/2)
		clk <= 1'b1;
	else 
		clk <= 1'b0;
end

always @(posedge CLK_50 or negedge reset_n) begin 
	if(!reset_n)
		div_cnt <= 1'b0;
	else if(div_cnt < DIV_LEN)
		div_cnt <= div_cnt + 1'b1;
	else 
		div_cnt <= 26'd0;
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

assign cout = (Q1 == 9);
		
endmodule
