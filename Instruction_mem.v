module Instruction_mem #(
    parameter DEPTH = 100
) (
    input [31:0] A,
    output reg [31:0] RD
);
    reg [31:0] inst_mem [DEPTH-1:0];

     initial begin
        $readmemh("program.hex", inst_mem);
    end
    
    always @(*) begin
        RD = inst_mem[A>>2];
    end  
endmodule
