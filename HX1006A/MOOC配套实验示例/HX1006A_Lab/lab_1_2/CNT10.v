module CNT10 
(
	input CLK,EN,RST,LOAD,//Clock, Clock Enable, Reset, Data Load Control Signals
	input [3:0] DATA ,	//4-bit parallel loading data
	output reg[3:0] DOUT, 	//4-bit count output
	output COUT  		//Counting carry output
);

always @(posedge CLK,negedge RST) //Timing process
	if (!RST) 
		DOUT <= 0;		//Asynchronously clear the internal register unit when RST=0
	else if (EN)  	//Synchronization enable EN=1, allows loading or counting
	begin
		if (!LOAD) 
			DOUT<=DATA;		//When LOAD=0, data is loaded into internal registers
		else if (DOUT<9) 
			DOUT <= DOUT+1'b1;	//Accumulation allowed when Q is less than 9
		else 
			DOUT <= 0; 	//Otherwise clear and return to initial value after one clock
	end

assign COUT = (DOUT==9);

endmodule 