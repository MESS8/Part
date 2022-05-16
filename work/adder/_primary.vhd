library verilog;
use verilog.vl_types.all;
entity adder is
    port(
        Addr_In         : in     vl_logic_vector(31 downto 0);
        Addr_Out        : out    vl_logic_vector(31 downto 0)
    );
end adder;
