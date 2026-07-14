module Control_unit(
input [31:0] Instr,
input Zero,
output PCSrc, ResultSrc, MemWrite, ALUSrc, RegWrite,Jump,
output [1:0] ImmSrc,
input [2:0] ALUcontrol
);
wire Branch;
wire [1:0] ALUOp;
Main_decoder block1 ( Instr[6:0] , Branch, ResultSrc, MemWrite, ALUSrc, RegWrite, Jump, ALUOp, ImmSrc);
ALU_Decoder block2 ( ALUOp, Instr[14:12], Instr [5],Instr [30], ALUcontrol);
assign PCSrc = Branch & Zero;
    
endmodule