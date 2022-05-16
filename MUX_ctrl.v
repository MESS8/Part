module ctrl_MUX (
    input stall,
    input write,
    input [1:0] ALUop,
    input MemtoReg,
    input MemRead,
    input MemWrite,
    input regdst,
    input ALUsrc,

    output reg write_stall,
    output reg [1:0] ALUop_stall,
    output reg MemtoReg_stall,
    output reg MemRead_stall,
    output reg MemWrite_stall,
    output reg regdst_stall,
    output reg ALUsrc_stall

  );
  always @(*)
  begin
    if (stall)
    begin
      write_stall=0;
      ALUop_stall=2'b11;
      MemtoReg_stall=0;
      MemRead_stall=0;
      MemWrite_stall=0;
      regdst_stall=0;
      ALUsrc_stall=0;
    end
    else
    begin
      write_stall=write;
      ALUop_stall=ALUop;
      MemtoReg_stall=MemtoReg;
      MemRead_stall=MemRead;
      MemWrite_stall=MemWrite;
      regdst_stall=regdst;
      ALUsrc_stall=ALUsrc;
    end

  end
endmodule
