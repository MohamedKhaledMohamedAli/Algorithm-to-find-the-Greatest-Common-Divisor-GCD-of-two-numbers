module gcd_top_tb;

//Setup the clock signal
parameter clk_prd = 1ns;
reg clk = 0;

always #(clk_prd/2) clk = ~clk;

//Create input/output ports
parameter WIDTH = 5;
reg rst_tb;                     //Reset
reg start;                      //Start Signal
reg [WIDTH - 1 : 0] A_tb;       //Input 1
reg [WIDTH - 1 : 0] B_tb;       //Input 2 
wire [WIDTH - 1 : 0] out_tb;    //Output

//Create instaneous from gcd_top module
gcd_top #(.WIDTH(WIDTH)) dut (.clk(clk), .start(start), .rst(rst_tb), .A(A_tb), .B(B_tb), .final_value(out_tb));

//Reset Task
task reset(); begin

        //Set Reset signal
        rst_tb = 1;

        // Wait to make sure of reseting
        #(clk_prd);

        //Clear Reset signal
        rst_tb = 0;

        #(clk_prd);
    end
endtask


//testing Task
task test(input [WIDTH - 1 : 0] in1, input [WIDTH - 1 : 0] in2); begin

        //Reset
        reset();

        //Send Start Signal
        start = 1;

        #(clk_prd);

        //Send values to gcd_top module
        A_tb = in1;
        B_tb = in2;

        #(clk_prd/2);

        //Stop module
        start = 0;

        #(clk_prd);

        //Wait until it finishes
        @(out_tb);

        //Display the value
        $display("Greatest Common Divisor between %d and %d is %d",in1 ,in2 ,out_tb);
    end
endtask

initial begin

    //test 1
    test(24,18);

    //test 2
    test(12,15);

    //test 3
    test(10,15);
            
    //Finish simulation
    $finish();
end

endmodule