`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2018 11:11:04 AM
// Design Name: 
// Module Name: Register
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


module Register(Clk, Rst, Write_En,  DI, Do);
    input Clk, Rst;
    input Write_En;
    input [15:0] DI;
    output reg[15:0] Do;
    reg [15:0] Mem;
    always @(posedge Clk) begin
        if (Rst == 1) begin
            Mem <= 16'd0;
        end
        else begin
            if (Write_En) begin
                 Mem <= DI;
            end
        end
    end
    always @(*) begin
        Do <= Mem;
    end
endmodule
