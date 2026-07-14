module ALU (
input [31:0] srcA,srcB,
input [2:0]alu_control,
output reg [31:0] alu_res,
output  Zero
);
always @(*) begin
    case (alu_control)
        3'b000 : alu_res = srcA + srcB ;
        3'b001 : alu_res = srcA - srcB ;
        3'b010 : alu_res = srcA & srcB ;
        3'b100 : alu_res = srcA | srcB ;
        default: alu_res = srcA + srcB ;
    endcase
end
assign Zero = (alu_res == 32'b0) ? 1 : 0 ;
    
endmodule