`timescale 1ns / 1ps

module alu
(
    input [31:0] A,B,
    input [3:0] ALU_Control,
    output reg [31:0] ALU_Out,
    output reg OVF
);
    
    always @(*)
    begin
        case(ALU_Control)
        4'b0000: // Addition
           ALU_Out = A + B;
        4'b0001: // Subtraction
           ALU_Out = A - B;
        4'b0010: // Logical shift-left
           ALU_Out = A << 1;
        4'b0011: // Logical shift-right
           ALU_Out = A >> 1;
        4'b0100: // Logical variable shift-left
           ALU_Out = A << B;
        4'b0101: // Logical variabel shift-right
           ALU_Out = A >> B;
        4'b0110: //  Bitwise and
           ALU_Out = A & B;
        4'b0111: //  Bitwise or
           ALU_Out = A | B;
        4'b1000: //  Bitwise xor
           ALU_Out = A ^ B;
        4'b1001: // Logical xnor
           ALU_Out = ~(A ^ B);
          default: ALU_Out = A + B;
        endcase
    end
    
    always @ (*)
    case (ALU_Control)
        4'b0000: OVF <= ( A[31] & B[31] & ~ALU_Out[31] ) | ( ~A[31] & ~B[31] & ALU_Out[31] );
        4'b0001: OVF <= ( ~A[31] & B[31] & ALU_Out[31] ) | ( A[31] & ~B[31] & ~ALU_Out[31] );
        default: OVF <= 1'b0;
    endcase
endmodule

