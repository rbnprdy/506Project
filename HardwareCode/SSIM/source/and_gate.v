`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2018 02:45:56 PM
// Design Name: 
// Module Name: and_gate
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


module and_gate(
in1, in2, in3, in4, in5, in6, in7, 
in8, in9, in10, in11, in12, in13, in14, 
in15, in16, in17, in18, in19, in20, in21, 
in22, in23, in24, in25, in26, in27, in28,
out);

    input in1, in2, in3, in4, in5, in6, in7;
    input in8, in9, in10, in11, in12, in13, in14;
    input in15, in16, in17, in18, in19, in20, in21;
    input in22, in23, in24, in25, in26, in27, in28;
    
    output reg out;
    
    always@(*) begin
        out <= in1 & in2 & in3 & in4 & in5 & in6 & in7 & in8 & in9 & in10 & in11 & in12 & in13 & in14 & in15 & in16 & in17 & in18 & in19 & in20 & in21 & in22 & in23 & in24 & in25 & in26 & in27 & in28;
    end

endmodule
