module mux_2_1 #(
    parameter size = 32
) (
    input sel,
    input  [31:0] in1 , in0 ,
    output [31:0] out
);
    
    assign out = (sel)? in1 : in0;

endmodule