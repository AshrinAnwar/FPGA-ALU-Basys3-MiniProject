module alu_4bit (
input [3:0] A, // 4-bit input A
input [3:0] B, // 4-bit input B
input [2:0] ALU_Sel, // 3-bit ALU operation select
output reg [3:0] ALU_Out, // 4-bit ALU output
output reg CarryOut // Carry Out flag
);

always @(*) begin
case (ALU_Sel)
3'b000: (CarryOut, ALU_Out) = A + B; // Addition
3'b001: (CarryOut, ALU_Out) = A - B; // Subtraction
3'b010: ALU_Out = A & B; // AND
3'b011: ALU_Out = A | B; // OR
3'b100: ALU_Out = A^ B; // XOR
b101: ALU_Out = ~(A | B); // NOR
default: ALU_Out = 4'b0000; // Default case
endcase
end

endmodule