library verilog;
use verilog.vl_types.all;
entity RF is
    port(
        Rs_data         : out    vl_logic_vector(31 downto 0);
        Rt_data         : out    vl_logic_vector(31 downto 0);
        write           : in     vl_logic;
        clk             : in     vl_logic;
        Rs_addr         : in     vl_logic_vector(4 downto 0);
        Rd_addr         : in     vl_logic_vector(4 downto 0);
        Rt_addr         : in     vl_logic_vector(4 downto 0);
        Rd_data         : in     vl_logic_vector(31 downto 0)
    );
end RF;
