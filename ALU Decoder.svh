module ALU_Decoder(
input [1:0] ALUOp,
input [2:0] Funct3,
input op,Funct7,
output reg [2:0] ALUcontrol
);
    
always @(*) begin
    case (ALUOp)
       2'b00 : ALUcontrol = 3'b000; 
       2'b01 : ALUcontrol = 3'b001; 
       2'b10 : begin
       casex ({Funct3,op,Funct7})
       5'b00000 : ALUcontrol = 3'b000;
       5'b00001 : ALUcontrol = 3'b000;
       5'b00010 : ALUcontrol = 3'b000;
       5'b00011 : ALUcontrol = 3'b001;
       5'b110xx : ALUcontrol = 3'b011;
       5'b111xx : ALUcontrol = 3'b010;
        default:  ALUcontrol = 3'b000;
       endcase
        end
        default:  ALUcontrol = 3'b000;
    endcase
end

endmodule