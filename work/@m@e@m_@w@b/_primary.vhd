library verilog;
use verilog.vl_types.all;
entity MEM_WB is
    port(
        clk             : in     vl_logic;
        write_EM        : in     vl_logic;
        MemtoReg_EM     : in     vl_logic;
        write_MW        : out    vl_logic;
        MemtoReg_MW     : out    vl_logic;
        Addr_EM         : in     vl_logic_vector(4 downto 0);
        Mrdata          : in     vl_logic_vector(31 downto 0);
        ALUResult_EM    : in     vl_logic_vector(31 downto 0);
        Rd_addr         : out    vl_logic_vector(4 downto 0);
        Mrdata_MW       : out    vl_logic_vector(31 downto 0);
        ALUResult_MW    : out    vl_logic_vector(31 downto 0)
    );
end MEM_WB;
