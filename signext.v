module signext (
    input [15:0] orgin,
    output [31:0] extended
);
assign extended={16'b0,orgin[15:0]};
endmodule