module ID_EX (
    input clk,
    //WB
    input  write,
    input  MemtoReg,

    output reg write_IE,
    output reg MemtoReg_IE,
    //M
    input  MemRead,
    input  MemWrite,

    output reg MemRead_IE,
    output reg MemWrite_IE,
    //EX
    input regdst_s,
    input ALUsrc_s,
    input [1:0] ALUop_s,

    output reg regdst,
    output reg ALUsrc,
    output reg[1:0] ALUop,
    //data
    input [4:0] Rd_addr,
    input [4:0] Rt_addr,

    input [31:0] Rs_data,
    input [31:0] Rt_data,
    input [31:0] extended,

    output reg [4:0] Rd_addr_IE,
    output reg [4:0] Rt_addr_IE,
    output reg [31:0] Rs_data_IE,
    output reg [31:0] Rt_data_IE,
    output reg [31:0] imm_v,
    //special for forwarding unit
    input [4:0] Rs_addr,

    output reg [4:0] Rs_addr_IE
  );

  reg WB_write;
  reg WB_MemtoReg;
  reg M_MemRead;
  reg M_MemWrite;
  reg[1:0] EX_ALUop;
  reg EX_Regdst;
  reg EX_ALUsrc;
  reg [31:0] D_Rs_data;
  reg [31:0] D_Rt_data;
  reg [4:0] D_Rd_addr;
  reg [4:0] D_Rt_addr;
  reg [4:0] D_Rs_addr;
  reg [31:0] D_imm;

  always @(clk )  //triger when clk change
  begin
    if (clk)      //read in data when posedge clk
    begin
      //WB
      WB_write=write;
      WB_MemtoReg=MemtoReg;
      //M
      M_MemRead=MemRead;
      M_MemWrite=MemWrite;
      //EX
      EX_Regdst=regdst_s;
      EX_ALUsrc=ALUsrc_s;
      EX_ALUop=ALUop_s;
      //data
      D_Rs_data=Rs_data;
      D_Rt_data=Rt_data;
      D_Rd_addr=Rd_addr;
      D_Rt_addr=Rt_addr;
      D_Rs_addr=Rs_addr;
      D_imm=extended;
    end
    else       //write when negedge of clk
    begin
      //WB
      write_IE= WB_write;
      MemtoReg_IE=WB_MemtoReg;
      //M
      MemRead_IE=M_MemRead;
      MemWrite_IE=M_MemWrite;
      //EX
      regdst=EX_Regdst;
      ALUsrc=EX_ALUsrc;
      ALUop=EX_ALUop;
      //data
      Rs_data_IE=D_Rs_data;
      Rt_data_IE=D_Rt_data;
      Rd_addr_IE=D_Rd_addr;
      Rt_addr_IE=D_Rt_addr;
      Rs_addr_IE=D_Rs_addr;
      imm_v=D_imm;
    end
  end

endmodule
