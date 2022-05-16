library verilog;
use verilog.vl_types.all;
entity IF_ID is
    port(
        clk             : in     vl_logic;
        instr           : in     vl_logic_vector(31 downto 0);
        IF_ID_Write     : in     vl_logic;
        instrr          : out    vl_logic_vector(31 downto 0)
    );
end IF_ID;
