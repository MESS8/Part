`define R 2'b10
`define R_op 6'b0
`define sw_op 6'b010000
`define lw_op 6'b010001
`define add_op 6'b001100
`define sub_op 6'b001101
`define I_sub 2'b01
`define I_add 2'b00

module control (
    //output
    output reg write,
    output reg [1:0] ALUop,
    output reg MemtoReg,
    output reg MemRead,
    output reg MemWrite,
    output reg regdst,
    output reg ALUsrc,
    //input
    input [5:0] opcode

);
always @(opcode) begin
    case (opcode)      //first defferent instruction type by opcode
        /*part 1 R type*/
       `R_op : begin   //when opcode is 6'b0 it's R type 
            write=1;    //while R type instruction enable write in the register
            ALUop=`R;   //it also deliever ALUop to ALU control suggest a R type operation in ALU
            regdst=1;   //regdst refer to choose the R type instruction arrange in the first MUX
            ALUsrc=0;   //choose the register data in the second MUX
            MemRead=0;  //no need for data memory to read
            MemWrite=0; //no nedd for data memory to write
            MemtoReg=0; //choose to deliever the ALU result back to the register file
            
        end
        /*part 2 I type*/
        `sw_op:begin      //when opcode is 6'b010000 it's I type store word instruction
            write=0;      //while store word instruction no need to write in the register
            ALUop=`I_add; //while store word instruction ALU add exended immediate value
            ALUsrc=1;     //choose the immediate value in the second MUX
            MemRead=0;    //no need for data memory to read  
            MemWrite=1;   //write  in data memory   
            
        end
        `lw_op:begin      //when opcode is 6'b010001 it's I type load word instruction  
            write=1;      //while load word instruction no need to write in the register
            ALUop=`I_add; //while load word instruction ALU add exended immediate value
            regdst=0;     //regdst refer to choose the I type instruction arrange in the first MUX
            ALUsrc=1;     //choose the immediate value in the second MUX
            MemtoReg=1;   //choose to pass data memory back to the register file
            MemRead=1;    //read address in data memory 
            MemWrite=0;   //no nedd for data memory to write
           
        end
        `add_op:begin       //when opcode is 6'b001100 it's I type addi instruction 
            write=1;        //while immediate add enable write in the register
            ALUop=`I_add;   //while immediate add instruction ALU add exended immediate value
            regdst=0;       //regdst refer to choose the I type instruction arrange in the first MUX
            ALUsrc=1;       //choose the immediate value in the second MUX
            MemRead=0;      //no need for data memory to read
            MemWrite=0;     //no nedd for data memory to write
            MemtoReg=0;     //choose to deliever the ALU result back to the register file
           
        end
        `sub_op:begin       //when opcode is 6'b001101 it's I type subi instruction 
            write=1;        //while immediate add enable write in the register
            ALUop=`I_sub;   //while immediate sub instruction ALU substract exended immediate value
            regdst=0;       //regdst refer to choose the I type instruction arrange in the first MUX
            ALUsrc=1;       //choose the immediate value in the second MUX
            MemRead=0;      //no need for data memory to read
            MemWrite=0;     //no nedd for data memory to write
            MemtoReg=0;     //choose to deliever the ALU result back to the register file
         
        end
        default: begin
        write=0;
        ALUop=2'b11;
        MemRead=0;      //no need for data memory to read
        MemWrite=0;     //no nedd for data memory to write
        end
    endcase    
end  
endmodule