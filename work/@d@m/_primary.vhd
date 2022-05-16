library verilog;
use verilog.vl_types.all;
entity DM is
    port(
        Mrdata          : out    vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        Memaddr         : in     vl_logic_vector(31 downto 0);
        Mwdata          : in     vl_logic_vector(31 downto 0);
        MemRead         : in     vl_logic;
        MemWrite        : in     vl_logic
    );
end DM;
