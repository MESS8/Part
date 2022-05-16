module mux32b (
    input choose,
    input [31:0] c0,
    input [31:0] c1,
    output [31:0] out32
);
assign out32=choose?c1:c0;

endmodule