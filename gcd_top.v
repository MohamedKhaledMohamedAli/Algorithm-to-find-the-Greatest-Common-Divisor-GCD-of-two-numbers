module gcd_top #(parameter WIDTH = 1)(
    input clk,
    input rst, //reset
    input start,
    input [WIDTH - 1 : 0] A, //input 1
    input [WIDTH - 1 : 0] B, //input 2
    output [WIDTH - 1 : 0] final_value //output value
);

wire result;
wire sub_A;
wire sub_B;
wire ANEB;
wire AGTB;


gcd_datapath #(.WIDTH(WIDTH)) datapath (
    .result(result),
    .A(A),
    .B(B),
    .sub_A(sub_A),
    .sub_B(sub_B),
    .final_value(final_value),
    .ANEB(ANEB),
    .AGTB(AGTB)
);

gcd_controller controller (
    .start(start),
    .result(result),
    .clk(clk),
    .rst(rst),
    .sub_A(sub_A),
    .sub_B(sub_B),
    .ANEB(ANEB),
    .AGTB(AGTB)
);

endmodule