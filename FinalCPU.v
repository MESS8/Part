/*
 * Declaration of top entry for this project.
 * CAUTION: DONT MODIFY THE NAME AND I/O DECLARATION.
 */
module FinalCPU(
    // Outputs
    output	wire			PCWrite,
    output  wire  [31:0]  Addr_Out,
    // Inputs
    input wire  [31:0]  Addr_In,
    input wire    clk
  );
  wire ALUsrc ;
  wire  MemtoReg;
  wire MemRead;
  wire MemWrite;
  wire write;
  wire [1:0] ALUop;
  wire [5:0] funct;
  wire [5:0] funct_ctrl;
  wire [5:0] out5;
  wire [31:0] out32;
  wire [31:0] instr;
  wire [31:0] extended;
  wire [31:0]  Rs_data ;
  wire [31:0]  Rt_data ;
  wire [31:0] Rd_data;
  wire [31:0] ALUResult;
  wire [31:0]  Mrdata;
  wire [31:0] instrr;
  wire regdst_s;
  wire ALUsrc_s;
  wire [1:0] ALUop_s ;
  wire  [4:0]  Rd_addr_IE;
  wire  [4:0]  Rt_addr_IE;
  wire  [4:0]  Rs_addr_IE;
  wire  [31:0] Rs_data_IE;
  wire  [31:0] Rt_data_IE;
  wire  [31:0] imm_v     ;
  wire  write_IE   ;
  wire  MemtoReg_IE;
  wire  MemRead_IE ;
  wire  MemWrite_IE;
  wire write_EM   ;
  wire write_MW   ;
  wire MemtoReg_EM;
  wire MemRead_EM ;
  wire MemWrite_EM;
  wire [4:0]   Addr_EM     ;
  wire [31:0]  Rt_data_EM  ;
  wire [31:0]  ALUResult_EM;
  wire [4:0] Rd_addr ;
  wire [31:0] Mrdata_MW   ;
  wire [31:0] ALUResult_MW;
  wire [1:0] ForwardA;
  wire [1:0] ForwardB;
  wire [31:0] outA3;
  wire [31:0] outB3;
  wire stall;
  wire IF_ID_Write;
  wire  write_stall   ;
  wire [1:0] ALUop_stall   ;
  wire  MemtoReg_stall;
  wire  MemRead_stall ;
  wire  MemWrite_stall;
  wire  regdst_stall  ;
  wire  ALUsrc_stall  ;
  wire  MemtoReg_MW   ;
  wire  regdst        ;
  /*
   * Declaration of instrruction Memory.
   * CAUTION: DONT MODIFY THE NAME.
   */
  IM Instr_Memory(
       // Outputs
       .instr                   ( instr    [31:0] ),
       // Inputs
       .Addr_In                 ( Addr_In  [31:0] )
     );
     //
  IF_ID  u_IF_ID (
           .clk                     ( clk            ),
           .instr                   ( instr   [31:0] ),
           .IF_ID_Write             (IF_ID_Write      ),
          // Outputs
           .instrr                  ( instrr  [31:0] )
         );
  detect  u_detect (
            .Rt_addr_IE              ( Rt_addr_IE   [4:0] ),
            .Rs_addr                 ( instrr     [25:21] ),
            .Rt_addr                 ( instrr     [20:16] ),
            .MemRead_IE              ( MemRead_IE         ),
            // Outputs
            .stall                   ( stall              ),
            .IF_ID_Write             ( IF_ID_Write        ),
            .PCWrite                ( PCWrite           )
          );
 ctrl_MUX  u_ctrl_MUX (
            .stall                   ( stall                 ),
            .write                   ( write                 ),
            .ALUop                   ( ALUop_s           [1:0] ),
            .MemtoReg                ( MemtoReg              ),
            .MemRead                 ( MemRead               ),
            .MemWrite                ( MemWrite              ),
            .regdst                  ( regdst_s                ),
            .ALUsrc                  ( ALUsrc_s                ),
            // Outputs
            .write_stall             ( write_stall           ),
            .ALUop_stall             ( ALUop_stall     [1:0] ),
            .MemtoReg_stall          ( MemtoReg_stall        ),
            .MemRead_stall           ( MemRead_stall         ),
            .MemWrite_stall          ( MemWrite_stall        ),
            .regdst_stall            ( regdst_stall          ),
            .ALUsrc_stall            ( ALUsrc_stall          )
        );
  signext  u_signext (//sign extend the immediate value
             .orgin                   ( instrr     [15:0] ),
            // Outputs
             .extended                ( extended  [31:0] )
           );
  control  u_control (//control unit process the opcode and output the control signal
             .opcode                  ( instrr          [31:26] ),
             //output
             .write                   ( write                 ),
             .MemtoReg                ( MemtoReg              ),
             .MemRead                 ( MemRead               ),
             .MemWrite                ( MemWrite              ),
             .regdst                  ( regdst_s              ),
             .ALUsrc                  ( ALUsrc_s              ),
             .ALUop                   ( ALUop_s         [1:0] )
           );
  mux5b  u1_mux5b (//5bit MUX choose the register depend on instrution type
           .choose                  ( regdst      ),
           .c0                      ( Rt_addr_IE  [4:0] ),
           .c1                      ( Rd_addr_IE  [4:0] ),
          // Outputs
           .out5                    ( out5    [4:0] )
         );
  mux32b  u0_mux32b (//first 32bit MUX choose the input for the ALU
            .choose                  ( ALUsrc        ),
            .c0                      ( outB3    [31:0] ),
            .c1                      ( imm_v              [31:0] ),

            .out32                   ( out32   [31:0] )
          );
  ALU  u_ALU (//ALU do the caculation work
         .Src_1                   ( outA3    [31:0] ),
         .Src_2                   ( out32   [31:0] ),
         .shamt                   ( imm_v               [10:6]  ),
         .funct                     ( funct                [5:0]  ),
        // Outputs
         .ALUResult                 ( ALUResult    [31:0]      )
       );
  M3to1  A_M3to1 (
           .c1                      ( Rs_data_IE  [31:0]   ),
           .c2                      ( Rd_data    [31:0]    ),
           .c3                      ( ALUResult_EM  [31:0] ),
           .choose                  ( ForwardA    [1:0] ),
          // Outputs
           .out3                    ( outA3    [31:0] )
         );
  M3to1  B_M3to1 (
           .c1                      ( Rt_data_IE  [31:0]   ),
           .c2                      ( Rd_data    [31:0]    ),
           .c3                      ( ALUResult_EM  [31:0] ),
           .choose                  ( ForwardB    [1:0] ),
          // Outputs
           .out3                    ( outB3    [31:0] )
         );
  foward  u_foward (
            .write_EM                ( write_EM           ),
            .write_MW                ( write_MW           ),
            .Rd_addr                 ( Rd_addr     [4:0]  ),
            .Addr_EM                 ( Addr_EM     [4:0]  ),
            .Rs_addr_IE              ( Rs_addr_IE  [4:0] ),
            .Rt_addr_IE              ( Rt_addr_IE  [4:0] ),
          // Outputs
            .ForwardA                ( ForwardA    [1:0]  ),
            .ForwardB                ( ForwardB    [1:0]  )
          );
  EX_MEM  u_EX_MEM (
            .clk                     ( clk                  ),
            .write_IE                ( write_IE             ),
            .MemtoReg_IE             ( MemtoReg_IE          ),
            .MemRead_IE              ( MemRead_IE           ),
            .MemWrite_IE             ( MemWrite_IE          ),
            .Addr_IE                 ( out5          [4:0]  ),
            .Rt_data_IE              ( outB3    [31:0] ),
            .ALUResult               ( ALUResult     [31:0] ),
          // Outputs
            .write_EM                ( write_EM             ),
            .MemtoReg_EM             ( MemtoReg_EM          ),
            .MemRead_EM              ( MemRead_EM           ),
            .MemWrite_EM             ( MemWrite_EM          ),
            .Addr_EM                 ( Addr_EM       [4:0]  ),
            .Rt_data_EM              ( Rt_data_EM    [31:0] ),
            .ALUResult_EM            ( ALUResult_EM  [31:0] )
          );
  mux32b  u1_mux32b (//second MUX choose between ALU result or memory
            .choose                  ( MemtoReg_MW         ),
            .c0                      (ALUResult_MW  [31:0]),
            .c1                      (  Mrdata_MW     [31:0]),
          // Outputs
            .out32                   ( Rd_data    [31:0] )
          );
  /*
   * Declaration of Register File.
   * CAUTION: DONT MODIFY THE NAME.
   */
  RF Register_File(//register flie deliever data of selected address
       // Outputs
       .Rs_data                 ( Rs_data  [31:0] ),
       .Rt_data                 ( Rt_data  [31:0] ),
       // Inputs
       .write                   ( write_MW           ),
       .clk                     ( clk             ),
       .Rs_addr                 ( instrr  [25:21]  ),//
       .Rd_addr                 ( Rd_addr   [4:0]  ),
       .Rt_addr                 ( instrr  [20:16]  ),
       .Rd_data                 ( Rd_data  [31:0] )
     );
  ID_EX  u_ID_EX (
           .clk                     ( clk                    ),
           .write                   ( write_stall                  ),
           .MemtoReg                ( MemtoReg_stall              ),
           .MemRead                 ( MemRead_stall                ),
           .MemWrite                ( MemWrite_stall               ),
           .regdst_s                ( regdst_stall               ),
           .ALUsrc_s                ( ALUsrc_stall               ),
           .ALUop_s                 ( ALUop_stall         [1:0]  ),
           .Rd_addr                 ( instrr          [15:11]),
           .Rt_addr                 ( instrr          [20:16]),
           .Rs_addr                 ( instrr          [25:21]),
           .Rs_data                 ( Rs_data         [31:0] ),
           .Rt_data                 ( Rt_data         [31:0] ),
           .extended                ( extended        [31:0] ),//instrr     [15:0]
          // Outputs
           .write_IE                ( write_IE               ),
           .MemtoReg_IE             ( MemtoReg_IE            ),
           .MemRead_IE              ( MemRead_IE             ),
           .MemWrite_IE             ( MemWrite_IE            ),
           .regdst                  ( regdst                 ),
           .ALUsrc                  ( ALUsrc                 ),
           . ALUop                  ( ALUop           [1:0]  ),
           .Rd_addr_IE              ( Rd_addr_IE      [4:0]  ),
           .Rt_addr_IE              ( Rt_addr_IE      [4:0]  ),
           .Rs_addr_IE              ( Rs_addr_IE      [4:0]  ),
           .Rs_data_IE              ( Rs_data_IE      [31:0] ),
           .Rt_data_IE              ( Rt_data_IE      [31:0] ),
           .imm_v                   ( imm_v           [31:0] ) //instrr     [15:0]
         );

  ALU_ctrl  u_ALU_ctrl (//control ALU according to ALUop code
              .funct_ctrl              ( imm_v            [5:0]  ),
              .ALUop                   ( ALUop            [1:0]  ),
            // Outputs
              .funct         (  funct    [5:0]    )
            );
  adder  u_adder (//PC+4
           .Addr_In                 ( Addr_In   [31:0] ),
          // Outputs
           .Addr_Out                ( Addr_Out  [31:0] )
         );
  /*
   * Declaration of Data Memory.
   * CAUTION: DONT MODIFY THE NAME.
   */
  DM Data_Memory(//data
       .clk                     ( clk              ),
       .Memaddr                 ( ALUResult_EM   [31:0] ),
       .Mwdata                  ( Rt_data_EM    [31:0] ),
       .MemRead                 ( MemRead_EM          ),
       .MemWrite                ( MemWrite_EM         ),
       //output
       .Mrdata                  ( Mrdata    [31:0] )
     );
  MEM_WB  u_MEM_WB (
            .clk                     ( clk                  ),
            .write_EM                ( write_EM             ),
            .MemtoReg_EM             ( MemtoReg_EM          ),
            .Addr_EM                 ( Addr_EM       [4:0]  ),
            .Mrdata                  ( Mrdata        [31:0] ),
            .ALUResult_EM            ( ALUResult_EM  [31:0] ),
            // Outputs
            .write_MW                ( write_MW                ),
            .MemtoReg_MW             ( MemtoReg_MW             ),
            .Rd_addr                 ( Rd_addr       [4:0]  ),
            .Mrdata_MW               ( Mrdata_MW     [31:0] ),
            .ALUResult_MW            ( ALUResult_MW  [31:0] )
          );

endmodule
