`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2017 08:26:41 PM
// Design Name: 
// Module Name: Mux16X1
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


module Mux16X1(D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,D16,Sel,D);
input [15:0]D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,D16;
input [3:0] Sel;
output wire [15:0] D;
wire [15:0]D_out1,D_out2;
Mux8X1 U0(D1,D2,D3,D4,D5,D6,D7,D8,Sel[2:0],D_out1);
Mux8X1 U1(D9,D10,D11,D12,D13,D14,D15,D16,Sel[2:0],D_out2);
Mux2X1 U2(D_out1, D_out2, Sel[3], D);

endmodule
