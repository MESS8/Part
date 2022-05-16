`define SRL 	6'b000010
`define ADD 	6'b001011
`define SUB 	6'b001101
`define  OR 	6'b100101
module ALU(
	//INPUTS
	input	[31:0]	Src_1,
	input	[31:0]	Src_2,
	input	[4:0]	shamt,
	input	[5:0]	funct,
	//OUTPUT
	output	reg[31:0] ALUResult
);

	always@(Src_1,Src_2,shamt,funct)begin
		case(funct)
			`SRL:	ALUResult=Src_1>>shamt;//do shift	
			`ADD:	ALUResult=Src_1+Src_2;//do add
			`SUB:	ALUResult=Src_1-Src_2;//do substract
			`OR:	ALUResult=Src_1|Src_2;//do or
			default:	ALUResult=0;	
		endcase

	end
endmodule