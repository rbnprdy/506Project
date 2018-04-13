`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2018 11:06:36 PM
// Design Name: 
// Module Name: input_mem
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


module input_mem(clk, rst, start, valid, out);

    input clk, rst, start;
    output reg valid;
    output reg [7:0] out;
    
    reg [7:0] memory [0:783];
    reg [9:0] address;
    
    initial begin
        address = 0;
        valid = 0;
        out = 0;
        $readmemh("input.txt", memory);
    end
    
    always@(posedge clk) begin
        if (!rst && start) begin
            valid = 1;
            if (address < 783) begin
                out = memory[address];
                address = address + 1;
            end
            else
                out = 0;
        end
    end
endmodule
