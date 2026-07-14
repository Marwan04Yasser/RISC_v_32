module reg_file(
    input CLK , WE3,
    input [4:0] A1, A2, A3,
    input [31:0] WD3,
    output reg [31:0] RD1, RD2
);
    
    reg [31:0] register [31:0];
 
    always @(*) begin
        RD1 = register[A1];
        RD2 = register[A2]; 
    end

    always @(posedge CLK ) begin
        if (WE3) begin
            register[A3] <= WD3  ;           
        end
    end

endmodule
