`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2018 07:35:54 PM
// Design Name: 
// Module Name: data_counter\
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

// Feeds data through up until num, at which point it starts feeding through 0's 
module data_counter #(parameter BIT_WIDTH = 32, NUM = 784)(in, clk, ready, clr, out, done);
    input [BIT_WIDTH - 1:0] in;
    input clk, ready, clr;
    output reg [BIT_WIDTH - 1:0] out;
    output reg done;
    
    reg [BIT_WIDTH - 1:0] curr = 0;
    
    initial begin
        out <= 0;
        done <= 0;
    end
    
    always@(posedge clk) begin
        if (curr >= NUM - 1) begin
            done = 1;
            out = 0;
        end
        else if (ready && !clr)
            curr = curr + 1;
    end
    
    always@(in, clr) begin
        if (clr) begin
            curr <= 0;
            done <= 0;
        end
        else if (!done)
            out <= in;
    end
endmodule
