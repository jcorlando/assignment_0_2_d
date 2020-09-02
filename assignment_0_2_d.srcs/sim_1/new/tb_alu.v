`timescale 1ns / 1ps

module tb_alu;

// Parameters
parameter WL = 32;

//Inputs
reg [WL - 1 : 0] A;
reg [WL - 1 : 0] B;
reg [3 : 0] ALU_Control;

//Outputs
wire [WL - 1 : 0] ALU_Out;
wire OVF;

//Instantiate DUT
alu # ( .WL(WL) )
    DUT( .A(A), .B(B), .ALU_Control(ALU_Control), .ALU_Out(ALU_Out), .OVF(OVF) );

initial
begin
    A = 32'h7fffffff;   // 7fffffff
    B = 32'h00000001;   // 00000001
end

initial
begin
    ALU_Control = 4'b0000;
    # 100 ALU_Control = 4'b0001;
    # 100 ALU_Control = 4'b0010;
    # 100 ALU_Control = 4'b0011;
    # 100 ALU_Control = 4'b0100;
    # 100 ALU_Control = 4'b0101;
    # 100 ALU_Control = 4'b0110;
    # 100 ALU_Control = 4'b0111;
    # 100 ALU_Control = 4'b1000;
    # 100 ALU_Control = 4'b1001;
end

endmodule

