module MEM_WB (
    input clk,
    //WB
    input write_EM,
    input MemtoReg_EM ,

    output reg write_MW,
    output reg MemtoReg_MW,
    //data
    input [4:0] Addr_EM,
    input [31:0] Mrdata,
    input [31:0] ALUResult_EM,

    output reg [4:0] Rd_addr,
    output reg [31:0] Mrdata_MW,
    output reg [31:0] ALUResult_MW
  );
  reg WB_write;
  reg WB_MemtoReg;
  reg [31:0] D_Mrdata;
  reg [4:0] D_addr;
  reg [31:0] D_ALUResult;
  always @(clk)//triger when clk change
  begin
    if (clk)
    begin     //read in data when posedge clk
      //WB
      WB_write=write_EM;
      WB_MemtoReg=MemtoReg_EM;
      //data
      D_Mrdata=Mrdata;
      D_addr=Addr_EM;
      D_ALUResult=ALUResult_EM;
    end
    else    //output when negedge of clk
    begin
      //WB
      write_MW= WB_write;
      MemtoReg_MW=WB_MemtoReg;
      //data
      Mrdata_MW=D_Mrdata;
      Rd_addr=D_addr;
      ALUResult_MW=D_ALUResult;
    end
  end

endmodule
