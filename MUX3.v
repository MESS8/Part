module M3to1 (
    input [31:0] c1,
    input [31:0] c2,
    input [31:0] c3,
    input [1:0] choose,

    output reg [31:0] out3
  );
  always @(*)
  begin
    case (choose)
      2'b00: out3=c1;
      2'b01: out3=c2;
      2'b10: out3=c3;
    endcase
  end
endmodule
