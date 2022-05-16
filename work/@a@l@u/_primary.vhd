library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        Src_1           : in     vl_logic_vector(31 downto 0);
        Src_2           : in     vl_logic_vector(31 downto 0);
        shamt           : in     vl_logic_vector(4 downto 0);
        funct           : in     vl_logic_vector(5 downto 0);
        ALUResult       : out    vl_logic_vector(31 downto 0)
    );
end ALU;
