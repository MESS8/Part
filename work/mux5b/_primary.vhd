library verilog;
use verilog.vl_types.all;
entity mux5b is
    port(
        choose          : in     vl_logic;
        c0              : in     vl_logic_vector(4 downto 0);
        c1              : in     vl_logic_vector(4 downto 0);
        out5            : out    vl_logic_vector(4 downto 0)
    );
end mux5b;
