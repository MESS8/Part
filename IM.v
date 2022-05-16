/*
 * Macro of size declaration of instruction memory
 * CAUTION: DONT MODIFY THE NAME AND VALUE.
 */
`define INSTR_MEM_SIZE	128	// Bytes

module IM(
	// Outputs
	output reg [31:0] instr,
	// Inputs
	input [31:0] Addr_In
);
	integer   A_1=0,
			  A_2=0,
			  A_3=0;
	/* 
	 * Declaration of instruction memory.
	 * CAUTION: DONT MODIFY THE NAME AND SIZE.
	 */
	
	reg [7:0]InstrMem[0:`INSTR_MEM_SIZE - 1];
	always @(Addr_In) begin	//when address assigned find instrcution
		//in MIPS memory are arrange in big endian
		A_1=Addr_In+1;	
	  	A_2=Addr_In+2;
		A_3=Addr_In+3;
		instr[31:0]={InstrMem[Addr_In],InstrMem[A_1],InstrMem[A_2],InstrMem[A_3]};
		//32 bit instrucation store in 4 register
	end

endmodule
