module mux5b (
    input choose,
    input [4:0] c0,
    input [4:0] c1,
    output [4:0] out5
);
assign out5=choose?c1:c0;

endmodule