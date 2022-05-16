library verilog;
use verilog.vl_types.all;
entity detect is
    port(
        Rt_addr_IE      : in     vl_logic_vector(4 downto 0);
        Rs_addr         : in     vl_logic_vector(4 downto 0);
        Rt_addr         : in     vl_logic_vector(4 downto 0);
        MemRead_IE      : in     vl_logic;
        stall           : out    vl_logic;
        IF_ID_Write     : out    vl_logic;
        PCWrite         : out    vl_logic
    );
end detect;
