module gcd_datapath #(parameter WIDTH = 1)(
    input [WIDTH - 1 : 0] A, //input 1
    input [WIDTH - 1 : 0] B, //input 2
    input result,
    input sub_A,
    input sub_B,
    output reg [WIDTH - 1 : 0] final_value, //output value
    output reg ANEB, //A Not Equal B
    output reg AGTB  //A Greater Than B
);

reg [WIDTH - 1 : 0] input_1;
reg [WIDTH - 1 : 0] input_2;

always @(*) begin

    input_1 = A;
    input_2 = B;    
end

always @(*) begin

    //default value
    final_value = 0;

    if(input_1 != input_2) begin
        ANEB = 1;
    end
    else begin
        ANEB = 0;
    end

    if(input_1 > input_2) begin
        AGTB = 1;
    end
    else begin
        AGTB = 0;
    end

    if(sub_A) begin
        input_1 = input_1 - input_2;
    end
    else begin
        input_1 = input_1;
    end

    if(sub_B) begin
        input_2 = input_2 - input_1;
    end
    else begin
        input_2 = input_2;
    end
    
    if(result) begin
        final_value = input_1;
    end
end

endmodule