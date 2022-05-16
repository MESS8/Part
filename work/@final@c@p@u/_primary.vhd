library verilog;
use verilog.vl_types.all;
entity FinalCPU is
    port(
        PCWrite         : out    vl_logic;
        Addr_Out        : out    vl_logic_vector(31 downto 0);
        Addr_In         : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic
    );
end FinalCPU;
