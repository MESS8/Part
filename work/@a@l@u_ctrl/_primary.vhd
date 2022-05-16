library verilog;
use verilog.vl_types.all;
entity ALU_ctrl is
    port(
        funct           : out    vl_logic_vector(5 downto 0);
        funct_ctrl      : in     vl_logic_vector(5 downto 0);
        ALUop           : in     vl_logic_vector(1 downto 0)
    );
end ALU_ctrl;
