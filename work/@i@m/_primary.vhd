library verilog;
use verilog.vl_types.all;
entity IM is
    port(
        instr           : out    vl_logic_vector(31 downto 0);
        Addr_In         : in     vl_logic_vector(31 downto 0)
    );
end IM;
