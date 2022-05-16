module EX_MEM (
    input clk,
    //WB
    input write_IE,
    input MemtoReg_IE,

    output reg write_EM,
    output reg MemtoReg_EM,
    //M
    input MemRead_IE,
    input MemWrite_IE,

    output reg MemRead_EM,
    output reg MemWrite_EM,
    //data
    input [4:0] Addr_IE,
    input [31:0] Rt_data_IE,
    input [31:0] ALUResult,

    output reg [4:0] Addr_EM,
    output reg [31:0] Rt_data_EM,
    output reg [31:0] ALUResult_EM
  );
  reg WB_write;
  reg WB_MemtoReg;
  reg M_MemRead;
  reg M_MemWrite;
  reg [31:0] D_Rt_data;
  reg [4:0] D_addr;
  reg [31:0] D_ALUResult;
  always @( clk)
  begin
    if (clk)          //triger when clk change
    begin
      //WB
      WB_write=write_IE;
      WB_MemtoReg=MemtoReg_IE;
      //M
      M_MemRead=MemRead_IE;
      M_MemWrite=MemWrite_IE;
      //data
      D_Rt_data=Rt_data_IE;
      D_addr=Addr_IE;
      D_ALUResult=ALUResult;
    end
    else
    begin
      //WB
      write_EM= WB_write;
      MemtoReg_EM=WB_MemtoReg;
      //M
      MemRead_EM=M_MemRead;
      MemWrite_EM=M_MemWrite;
      //data
      Rt_data_EM=D_Rt_data;
      Addr_EM=D_addr;
      ALUResult_EM=D_ALUResult;
    end
  end

endmodule
