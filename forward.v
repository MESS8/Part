module foward (
    input write_EM,
    input write_MW,
    input [4:0] Rd_addr,
    input [4:0] Addr_EM,
    input [4:0] Rs_addr_IE,
    input [4:0] Rt_addr_IE,

    output reg [1:0] ForwardA,
    output reg [1:0] ForwardB
  );
    

  always @(*) //add all input to sensitivity list
  begin
    //for MUX A
    //MEM hazard:
    if (write_MW && (Rd_addr != 0) && (Rd_addr == Rs_addr_IE))
    //&& !(write_EM && (Addr_EM != 0) && (Addr_EM != Rs_data_IE))
    begin
      ForwardA = 2'b01;//pick the value from the register MEM/WB
    end
    //EX hazard:
    else if (write_EM && (Addr_EM != 0) && (Addr_EM == Rs_addr_IE))
    begin
      ForwardA = 2'b10;//pick the value from the register EX/MEM
    end
    else
    //no hazard:
    begin
      ForwardA = 2'b00;
    end
    //for MUX B
    //MEM hazard:
    if (write_MW && (Rd_addr != 0) && (Rd_addr == Rt_addr_IE))
    //&& !(write_EM && (Addr_EM != 0) && (Addr_EM != Rt_addr_IE))
    begin
      ForwardB = 2'b01;//pick the value from the register MEM/WB
    end
    //EX hazard:
    else if (write_EM && (Addr_EM != 0) && (Addr_EM == Rt_addr_IE))
    begin
      ForwardB = 2'b10;//pick the value from the register EX/MEM
    end
    else
    //no hazard:
    begin
      ForwardB=2'b00;
    end
  end
endmodule
