module ALU (
input [7:0] A, // 8-bit input A
input [7:0] B, // 8-bit input B
input [2:0] ALU_Sel, // 3-bit control input to select the ALU operation
output reg [7:0] ALU_Out, // 8-bit ALU result output
output reg CarryOut // Carry Out flag for addition and subtraction 
);

always @(*) begin
case (ALU_Sel)
3'b000: (CarryOut, ALU_Out) = A +B;
// Addition
3'b001: (CarryOut, ALU_Out) = A - B
// Subtraction
3'b010: ALU_Out = A & B;
//AND
3'b011: ALU_Out = A | B;
// OR
3'b100: ALU_Out = A^B;
// XOR
3'b101: ALU_Out = -A;
// NOT
default: ALU_Out = 8'b00000000;
// Default case
endcase
end

endmodule