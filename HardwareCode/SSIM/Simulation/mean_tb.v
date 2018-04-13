`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2018 09:05:45 PM
// Design Name: 
// Module Name: mean_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mean_tb();
    reg [31:0] in;
    reg clr, clk, in_valid, result_ready;
    wire [31:0] out;
    wire out_valid;
    
    //integer i;
    
    mean #(.NUM_INPUTS(5)) m(
        .in(in),
        .clr(clr), 
        .clk(clk), 
        .in_valid(in_valid), 
        .result_ready(result_ready),
        .out(out), 
        .out_valid(out_valid)
    );

    initial begin
        clk <= 1'b0;
        forever #10 clk <= ~clk;
    end
    
    initial begin
        in = 0;
        clr <= 1;
        in_valid <= 0;
        result_ready <= 1;
        @(posedge clk);
        clr <= 0;
        @(posedge clk);
        // needed for post-implementation simulation
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        ////////////////////////////////////////////
        @(negedge clk);
        #2 in = 2;
        in_valid <= 1;
        @(negedge clk);
        #2 in = 4;
        @(negedge clk);
        #2 in = 6;
        @(negedge clk);
        #2 in = 8;
        @(negedge clk);
        #2 in = 10;
        @(negedge clk);
        #2 in = 0;
        //in_valid <= 0;
        @(negedge clk);
        // Add garabage to test valid signal
        //#2 in = 5;
        // Valid @ 830 ns, 6.0 @ 990 ns
        // Set result_ready to 0, delay 40 clock cycles, set to 1 and see if the 6.0 number changes to test result_ready flag.
    end
endmodule
