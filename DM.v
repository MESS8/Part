/*
 * Macro of size declaration of data memory
 * CAUTION: DONT MODIFY THE NAME AND VALUE.
 */
`define DATA_MEM_SIZE	128	// Bytes

/*
 * Declaration of Data Memory for this project.
 * CAUTION: DONT MODIFY THE NAME.
 */
module DM(
    // Outputs
    output [31:0] Mrdata,
    // Inputs
    input clk,
    input [31:0] Memaddr,
    input [31:0] Mwdata,
    input MemRead,
    input MemWrite

  );
  integer m_1=0,
          m_2=0,
          m_3=0;
  /*
   * Declaration of data memory.
   * CAUTION: DONT MODIFY THE NAME AND SIZE.
   */
  reg [7:0]DataMem[0:`DATA_MEM_SIZE - 1];
  always @(posedge clk )
  begin	//when positive clock edge write enable
    if (MemWrite)
    begin
      m_1=Memaddr+1;	//write data in big endian
      m_2=Memaddr+2;
      m_3=Memaddr+3;
      {DataMem[Memaddr],DataMem[Memaddr+1],DataMem[Memaddr+2],DataMem[Memaddr+3]}=Mwdata;

    end
  end
  assign Mrdata=MemRead?{DataMem[Memaddr],DataMem[Memaddr+1],DataMem[Memaddr+2],DataMem[Memaddr+3]}:32'b0;
endmodule
