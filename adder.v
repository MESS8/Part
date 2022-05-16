module adder (
    input [31:0] Addr_In,
    output [31:0] Addr_Out
);
assign Addr_Out=Addr_In+4;   //PC+4 
endmodule