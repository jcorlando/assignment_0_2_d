`timescale 1ns / 1ps

module alu
(
    input [31:0] A,B,
    input [3:0] ALU_Control,
    output reg [31:0] ALU_Out,
    output OVF
);

    wire [32:0] tmp;
    assign tmp = {1'b0,A} + {1'b0,B};
    assign OVF = tmp[32];
    
    always @(*)
    begin
        case(ALU_Control)
        4'b0000: // Addition
           ALU_Out = A + B;
        4'b0001: // Subtraction
           ALU_Out = A - B;
        4'b0010: // Logical shift left
           ALU_Out = A<<1;
        4'b0011: // Logical shift right
           ALU_Out = A>>1;
        4'b0100: // Logical variable shift-left
          ALU_Out = A<<B;
        4'b0101: // Logical variabel shift-right
        ALU_Out = A<<B;
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
endmodule

