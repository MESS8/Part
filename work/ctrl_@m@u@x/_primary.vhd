library verilog;
use verilog.vl_types.all;
entity ctrl_MUX is
    port(
        stall           : in     vl_logic;
        write           : in     vl_logic;
        ALUop           : in     vl_logic_vector(1 downto 0);
        MemtoReg        : in     vl_logic;
        MemRead         : in     vl_logic;
        MemWrite        : in     vl_logic;
        regdst          : in     vl_logic;
        ALUsrc          : in     vl_logic;
        write_stall     : out    vl_logic;
        ALUop_stall     : out    vl_logic_vector(1 downto 0);
        MemtoReg_stall  : out    vl_logic;
        MemRead_stall   : out    vl_logic;
        MemWrite_stall  : out    vl_logic;
        regdst_stall    : out    vl_logic;
        ALUsrc_stall    : out    vl_logic
    );
end ctrl_MUX;
