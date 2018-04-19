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

    //reg [7:0] in;
    // reg in_valid;
    reg [31:0] mean_y, std_y;
    reg clr, clk, mean_y_valid, std_y_valid;
    wire [31:0] out;
    wire out_valid;
    
    ssim #(.NUM_INPUTS(784)) s(
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
        forever #1000 clk <= ~clk;
    end
    
    initial begin
        //in = 0;
        clr <= 1;
        mean_y_valid <= 0;
        //in_valid <= 0;
        std_y_valid <= 0;
        @(posedge clk);
        #2 clr <= 0;
        mean_y <= 32'h42745c1b;
        mean_y_valid <= 1;
        std_y <= 32'h429e9bd9;
        std_y_valid <= 1;
    end
endmodule
