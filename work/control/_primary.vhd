library verilog;
use verilog.vl_types.all;
entity control is
    port(
        write           : out    vl_logic;
        ALUop           : out    vl_logic_vector(1 downto 0);
        MemtoReg        : out    vl_logic;
        MemRead         : out    vl_logic;
        MemWrite        : out    vl_logic;
        regdst          : out    vl_logic;
        ALUsrc          : out    vl_logic;
        opcode          : in     vl_logic_vector(5 downto 0)
    );
end control;
