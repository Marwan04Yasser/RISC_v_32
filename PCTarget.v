module PCTarget(
    input  [31:0] ImmExt,
    input  [31:0] PC,
    output [31:0] PCTarget
);

    assign PCTarget = ImmExt + PC;

endmodule 