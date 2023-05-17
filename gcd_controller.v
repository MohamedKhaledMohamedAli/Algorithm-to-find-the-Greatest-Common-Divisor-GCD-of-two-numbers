module gcd_controller (
    input clk,
    input rst, //reset
    input start,
    input ANEB, //A Not Equal B
    input AGTB, //A Greater Than B
    output reg result,
    output reg sub_A,
    output reg sub_B
);

parameter state_reg_width = 2;
parameter [state_reg_width-1 : 0]   WNS  = 2'b00,
                                    NE   = 2'b01,
                                    WISG = 2'b10,
                                    res  = 2'b11;

reg [state_reg_width-1 : 0] curr_state, next_state;

always @(posedge clk or posedge rst) begin

    if(rst) begin
        curr_state <= WNS;
    end
    else begin
        curr_state <= next_state;
    end
end

always @(*) begin

    //default value
    result = 0;
    sub_A = 0;
    sub_B = 0;

    case (curr_state)
        WNS: begin
            if(start == 1) begin
                @(negedge start);
                next_state = NE;
            end
            else begin
                next_state = WNS;
            end
        end
        NE: begin

            if(ANEB == 1) begin
                next_state = WISG;
            end
            else begin
                next_state = res;
            end
        end
        WISG: begin
            next_state = NE;
            if(AGTB == 1) begin

                //Subtract A
                sub_A = 1;
            end
            else begin

                //Subtract B
                sub_B = 1;
            end
        end
        res: begin
            next_state = WNS;
            result = 1;
        end
    endcase
end

endmodule