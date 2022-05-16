library verilog;
use verilog.vl_types.all;
entity foward is
    port(
        write_EM        : in     vl_logic;
        write_MW        : in     vl_logic;
        Rd_addr         : in     vl_logic_vector(4 downto 0);
        Addr_EM         : in     vl_logic_vector(4 downto 0);
        Rs_addr_IE      : in     vl_logic_vector(4 downto 0);
        Rt_addr_IE      : in     vl_logic_vector(4 downto 0);
        ForwardA        : out    vl_logic_vector(1 downto 0);
        ForwardB        : out    vl_logic_vector(1 downto 0)
    );
end foward;
