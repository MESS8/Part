module IF_ID (
    input clk,
    input [31:0] instr,
    input IF_ID_Write,

    output  reg [31:0] instrr
  );
  reg [31:0] IF_ID;
  always @(clk)     //triger when clk change
  begin
    //if no harzerds input value to the register 
    if (clk&&IF_ID_Write)  
    begin
      IF_ID=instr;
    end
    else
    begin
      instrr=IF_ID;
    end
  end
endmodule
