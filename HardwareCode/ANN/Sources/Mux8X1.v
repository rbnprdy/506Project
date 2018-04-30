`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2017 08:18:07 PM
// Design Name: 
// Module Name: Mux8X1
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


module Mux8X1 (D1,D2,D3,D4,D5,D6,D7,D8,Sel,D);
input [15:0] D1,D2,D3,D4,D5,D6,D7,D8;
input [2:0] Sel;
output wire [15:0] D;
wire [15:0] D_out1, D_out2;
Mux4X1 U0 (D1,D2,D3,D4,Sel[1:0],D_out1);
Mux4X1 U1 (D5,D6,D7,D8,Sel[1:0],D_out2);
Mux2X1 U2 (D_out1, D_out2, Sel[2], D);

endmodule
