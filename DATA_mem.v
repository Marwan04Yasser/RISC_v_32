module data_mem #(
   parameter DEPTH = 100
) (
    input CLK , WE,
    input [31:0] A, WD,
    output reg [31:0] RD
);
    reg [31:0] mem_data [DEPTH-1:0];

    always @(posedge CLK ) begin
        if (WE) begin
            mem_data[A] <= WD;
        end 
    end
    // any read port is combinantional
    always @(*) begin
        if(!WE) begin
           RD =  mem_data[A];
        end   
    end

endmodule