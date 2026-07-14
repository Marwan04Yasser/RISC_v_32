module Main_decoder(
input [6:0] OP,
output Branch, MemWrite, ALUSrc, RegWrite,Jump,
output [1:0] ALUOp, ImmSrc, ResultSrc
);
reg [8:0] out;
assign {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp,Jump} = out;
always @(*) begin
    casex (OP)
       7'b0000011 :out = 9'b10010010000;
       7'b0100011 :out = 9'b00111xx0000;
       7'b0110011 :out = 9'b1xx00000100;
       7'b1100011 :out = 9'b01000xx1010;
       7'b0010011 :out = 9'b10010000100;
       7'b1101111 :out = 9'b111x0100xx1;
        default: out = 9'b0000000000;
    endcase
end
endmodule