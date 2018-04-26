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
    reg clr, rst, clk, next_image, mean_y_valid, std_y_valid;
    wire [31:0] out;
    wire out_valid;
    
    integer i;
    
    ssim #(.NUM_INPUTS(784)) s(
        .mean_y(mean_y),
        .mean_y_valid(mean_y_valid),
        .std_y(std_y),
        .std_y_valid(std_y_valid),
        .clk(clk),
        .rst(rst),
        .clr(clr),
        .next_image(next_image),
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
        rst <= 1;
        next_image <= 0;
        mean_y_valid <= 0;
        //in_valid <= 0;
        std_y_valid <= 0;
        @(posedge clk);
        #2 clr <= 0;
        rst <= 0;
        mean_y <= 32'h4201c29d;
        mean_y_valid <= 1;
        std_y <= 32'h42342497;
        std_y_valid <= 1;
        for (i = 0; i < 80; i = i + 1) begin
            @(posedge clk);
        end
        clr <= 1;
        next_image <= 1;
        for (i = 0; i < 10; i = i + 1) begin
            @(posedge clk);
        end
        @(posedge clk);
        @(posedge clk);
        #2 clr <= 0;
        next_image <= 0;        
        for (i = 0; i < 80; i = i + 1) begin
            @(posedge clk);
        end
        clr <= 1;
        next_image <= 1;
        for (i = 0; i < 10; i = i + 1) begin
            @(posedge clk);
        end
        @(posedge clk);
        @(posedge clk);
        #2 clr <= 0;
        next_image <= 0;
    end
endmodule
