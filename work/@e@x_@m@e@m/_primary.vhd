library verilog;
use verilog.vl_types.all;
entity EX_MEM is
    port(
        clk             : in     vl_logic;
        write_IE        : in     vl_logic;
        MemtoReg_IE     : in     vl_logic;
        write_EM        : out    vl_logic;
        MemtoReg_EM     : out    vl_logic;
        MemRead_IE      : in     vl_logic;
        MemWrite_IE     : in     vl_logic;
        MemRead_EM      : out    vl_logic;
        MemWrite_EM     : out    vl_logic;
        Addr_IE         : in     vl_logic_vector(4 downto 0);
        Rt_data_IE      : in     vl_logic_vector(31 downto 0);
        ALUResult       : in     vl_logic_vector(31 downto 0);
        Addr_EM         : out    vl_logic_vector(4 downto 0);
        Rt_data_EM      : out    vl_logic_vector(31 downto 0);
        ALUResult_EM    : out    vl_logic_vector(31 downto 0)
    );
end EX_MEM;
