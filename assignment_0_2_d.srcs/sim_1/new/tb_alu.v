`timescale 1ns / 1ps

module tb_alu;

//Inputs
reg [31 : 0] A;
reg [31 : 0] B;
reg [3 : 0] ALU_Control;

//Outputs
wire [31 : 0] ALU_Out;
wire OVF;

//Instantiate DUT
alu DUT( .A(A), .B(B), .ALU_Control(ALU_Control), .ALU_Out(ALU_Out), .OVF(OVF) );

initial
begin
    A = 32'h00000100;   // 7fffffff
    B = 32'h00000004;   // 80000000
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

