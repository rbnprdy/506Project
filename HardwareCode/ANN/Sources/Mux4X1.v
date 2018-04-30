`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2017 08:13:54 PM
// Design Name: 
// Module Name: Mux4X1
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


module Mux4X1 (D1,D2,D3,D4,Sel,D);
input [15:0] D1,D2,D3,D4;
input [1:0]Sel;
output reg [15:0] D;
always @(*)begin
    case (Sel) 
        2'b00 : D <= D1;
        2'b01 : D <= D2;
        2'b10 : D <= D3;
        2'b11 : D <= D4;
    endcase
end
endmodule
