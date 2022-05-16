library verilog;
use verilog.vl_types.all;
entity mux32b is
    port(
        choose          : in     vl_logic;
        c0              : in     vl_logic_vector(31 downto 0);
        c1              : in     vl_logic_vector(31 downto 0);
        out32           : out    vl_logic_vector(31 downto 0)
    );
end mux32b;
