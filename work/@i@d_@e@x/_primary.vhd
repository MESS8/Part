library verilog;
use verilog.vl_types.all;
entity ID_EX is
    port(
        clk             : in     vl_logic;
        write           : in     vl_logic;
        MemtoReg        : in     vl_logic;
        write_IE        : out    vl_logic;
        MemtoReg_IE     : out    vl_logic;
        MemRead         : in     vl_logic;
        MemWrite        : in     vl_logic;
        MemRead_IE      : out    vl_logic;
        MemWrite_IE     : out    vl_logic;
        regdst_s        : in     vl_logic;
        ALUsrc_s        : in     vl_logic;
        ALUop_s         : in     vl_logic_vector(1 downto 0);
        regdst          : out    vl_logic;
        ALUsrc          : out    vl_logic;
        ALUop           : out    vl_logic_vector(1 downto 0);
        Rd_addr         : in     vl_logic_vector(4 downto 0);
        Rt_addr         : in     vl_logic_vector(4 downto 0);
        Rs_addr         : in     vl_logic_vector(4 downto 0);
        Rs_data         : in     vl_logic_vector(31 downto 0);
        Rt_data         : in     vl_logic_vector(31 downto 0);
        extended        : in     vl_logic_vector(31 downto 0);
        Rd_addr_IE      : out    vl_logic_vector(4 downto 0);
        Rt_addr_IE      : out    vl_logic_vector(4 downto 0);
        Rs_addr_IE      : out    vl_logic_vector(4 downto 0);
        Rs_data_IE      : out    vl_logic_vector(31 downto 0);
        Rt_data_IE      : out    vl_logic_vector(31 downto 0);
        imm_v           : out    vl_logic_vector(31 downto 0)
    );
end ID_EX;
