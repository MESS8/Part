`define R 2'b10
`define R_op 6'b0
`define sw_op 6'b010000
`define lw_op 6'b010001
`define add_op 6'b001100
`define sub_op 6'b001101
`define I_sub 2'b01
`define I_add 2'b00
`define SRL 	6'b000010
`define ADD 	6'b001011
`define SUB 	6'b001101
`define  OR 	6'b100101
module ALU_ctrl (
    output reg[5:0]  funct,
    input [5:0] funct_ctrl,
    input [1:0] ALUop
);
    always @(ALUop,funct_ctrl) begin
        case (ALUop)
        //when a R type instrucation 
            `R: case (funct_ctrl)
                `SRL:funct=`SRL;
                `ADD:funct=`ADD;
                `SUB:funct=`SUB;
                `OR:funct=`OR;
                default: funct=0;
                endcase
            //when a I type instrucation just operate as the opcode
            `I_add:funct=`ADD;
            `I_sub:funct=`SUB;
            default: 
            funct=0;
        endcase
        
    end
endmodule