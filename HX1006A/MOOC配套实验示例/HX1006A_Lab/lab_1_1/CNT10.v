module CNT10 (CLK,RST,EN,LOAD,COUT,DOUT,DATA);

input 	CLK,EN,RST,LOAD;  //Clock Enable, Reset, Data Load
								   //Control Signals
input 	[3:0] DATA ;  	   //4-bit parallel loading data
output 	[3:0] DOUT ;  		//4-bit count output
output 			COUT ;  		//Counting carry output

reg 		[3:0] Q1 ; 
reg 				COUT ;

assign DOUT = Q1;  //Output the internal register count result to DOUT

always @(posedge CLK or negedge RST)  begin  //Timing process
	if (!RST) Q1 <= 0;  //Asynchronously clear the internal register unit
							  //when RST=0
	else if (EN) begin  //Synchronization  enable EN=1, allows loading or counting
		if (!LOAD)  //When LOAD=0, data is loaded into internal registers
			Q1 <= DATA;  
		else if (Q1 < 9)  //Accumulation allowed when Q1 is less than 9
			Q1 <= Q1+1;  
		else  //Otherwise clear and return to initial value
			Q1 <= 4'b0000; 
	end
	//after one clock
end


always @(Q1) begin //Combination process
	if (Q1 == 4'h9) 
		COUT = 1'b1; 
	else 
		COUT = 1'b0;
end
		
endmodule