`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2017 08:19:34 PM
// Design Name: 
// Module Name: Mux2X1
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


module Mux2X1 (D1, D2, Sel, D);
input [15:0] D1,D2;
input Sel;
output reg [15:0] D;
always @ (*) begin
    case (Sel)
        1'b0 : D <= D1;
        1'b1 : D <= D2;
    endcase
end
endmodule
