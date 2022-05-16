library verilog;
use verilog.vl_types.all;
entity M3to1 is
    port(
        c1              : in     vl_logic_vector(31 downto 0);
        c2              : in     vl_logic_vector(31 downto 0);
        c3              : in     vl_logic_vector(31 downto 0);
        choose          : in     vl_logic_vector(1 downto 0);
        out3            : out    vl_logic_vector(31 downto 0)
    );
end M3to1;
