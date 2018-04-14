`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2018 07:24:07 PM
// Design Name: 
// Module Name: ssim_tb
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


module ssim_tb();

    reg [7:0] in;
    reg [31:0] mean_y, std_y;
    reg clr, clk, in_valid, mean_y_valid, std_y_valid;
    wire [31:0] out;
    wire out_valid;
    
    ssim #(.NUM_INPUTS(784)) s(
        .in(in),
        .in_valid(in_valid),
        .mean_y(mean_y),
        .mean_y_valid(mean_y_valid),
        .std_y(std_y),
        .std_y_valid(std_y_valid),
        .clk(clk),
        .clr(clr),
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
        mean_y_valid <= 0;
        in_valid <= 0;
        std_y_valid <= 0;
        @(posedge clk);
        #2 clr <= 0;
        mean_y <= 32'h426d7d68;
        mean_y_valid <= 1;
        std_y <= 32'h42995088;
        std_y_valid <= 1;
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
        #2 in = 0;
    end
endmodule
