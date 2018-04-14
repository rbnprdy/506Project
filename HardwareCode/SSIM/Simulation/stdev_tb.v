`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2018 08:26:21 PM
// Design Name: 
// Module Name: stdev_tb
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


module stdev_tb();

    reg [31:0] in, u;
    reg clr, clk, in_valid, u_valid;
    wire [31:0] out;
    wire out_valid;
    
    stdev #(.NUM_INPUTS(5)) s(
        .in(in), 
        .u(u), 
        .clk(clk), 
        .clr(clr), 
        .in_valid(in_valid), 
        .u_valid(u_valid), 
        .out(out), 
        .out_valid(out_valid)
    );
    
    initial begin
        clk <= 1'b0;
        forever #10 clk <= ~clk;
    end
    
    initial begin
        in = 0;
        u = 32'h40c00000; // 6.0
        clr <= 1;
        in_valid <= 0;
        u_valid <= 1;
        @(posedge clk);
        #2 clr <= 0;
        // needed for post-implementation simulation
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
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
        //#2 in = 6;
    end
endmodule
