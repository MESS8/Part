module detect (
    input [4:0] Rt_addr_IE,
    input [4:0] Rs_addr,
    input [4:0] Rt_addr,
    input MemRead_IE,

    output reg  stall,
    output reg  IF_ID_Write,
    output reg  PCWrite
  );

  initial
  begin
    stall=0;
    IF_ID_Write=1;
    PCWrite=1;
  end
  always @(*)
  begin
    if (MemRead_IE && ((Rt_addr_IE == Rs_addr) || (Rt_addr_IE == Rt_addr)))
    begin
      //if memory need to be read (which indicate lw) and the then
      //the destination register field of the load in the EX stage matches
      //either source register of the instructionin the ID stage.
      stall=1;      //insert nops
      IF_ID_Write=0;//preventing IF/ID pipeline register from changing
      PCWrite=0;    //preventing the PC register from changing
    end
    else
    begin         //keep movin'
      stall=0;
      IF_ID_Write=1;
      PCWrite=1;
    end
  end

endmodule
