`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2018 09:29:28 AM
// Design Name: 
// Module Name: average_mux
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


module average_mux(
sel,
in1_0, in2_0, in3_0, in4_0, in5_0, in6_0, in7_0,
in8_0, in9_0, in10_0, in11_0, in12_0, in13_0, in14_0,
in15_0, in16_0, in17_0, in18_0, in19_0, in20_0, in21_0,
in22_0, in23_0, in24_0, in25_0, in26_0, in27_0, in28_0,
in1_1, in2_1, in3_1, in4_1, in5_1, in6_1, in7_1,
in8_1, in9_1, in10_1, in11_1, in12_1, in13_1, in14_1,
in15_1, in16_1, in17_1, in18_1, in19_1, in20_1, in21_1,
in22_1, in23_1, in24_1, in25_1, in26_1, in27_1, in28_1,
in1_2, in2_2, in3_2, in4_2, in5_2, in6_2, in7_2,
in8_2, in9_2, in10_2, in11_2, in12_2, in13_2, in14_2,
in15_2, in16_2, in17_2, in18_2, in19_2, in20_2, in21_2,
in22_2, in23_2, in24_2, in25_2, in26_2, in27_2, in28_2,
in1_3, in2_3, in3_3, in4_3, in5_3, in6_3, in7_3,
in8_3, in9_3, in10_3, in11_3, in12_3, in13_3, in14_3,
in15_3, in16_3, in17_3, in18_3, in19_3, in20_3, in21_3,
in22_3, in23_3, in24_3, in25_3, in26_3, in27_3, in28_3,
in1_4, in2_4, in3_4, in4_4, in5_4, in6_4, in7_4,
in8_4, in9_4, in10_4, in11_4, in12_4, in13_4, in14_4,
in15_4, in16_4, in17_4, in18_4, in19_4, in20_4, in21_4,
in22_4, in23_4, in24_4, in25_4, in26_4, in27_4, in28_4,
in1_5, in2_5, in3_5, in4_5, in5_5, in6_5, in7_5,
in8_5, in9_5, in10_5, in11_5, in12_5, in13_5, in14_5,
in15_5, in16_5, in17_5, in18_5, in19_5, in20_5, in21_5,
in22_5, in23_5, in24_5, in25_5, in26_5, in27_5, in28_5,
in1_6, in2_6, in3_6, in4_6, in5_6, in6_6, in7_6,
in8_6, in9_6, in10_6, in11_6, in12_6, in13_6, in14_6,
in15_6, in16_6, in17_6, in18_6, in19_6, in20_6, in21_6,
in22_6, in23_6, in24_6, in25_6, in26_6, in27_6, in28_6,
in1_7, in2_7, in3_7, in4_7, in5_7, in6_7, in7_7,
in8_7, in9_7, in10_7, in11_7, in12_7, in13_7, in14_7,
in15_7, in16_7, in17_7, in18_7, in19_7, in20_7, in21_7,
in22_7, in23_7, in24_7, in25_7, in26_7, in27_7, in28_7,
in1_8, in2_8, in3_8, in4_8, in5_8, in6_8, in7_8,
in8_8, in9_8, in10_8, in11_8, in12_8, in13_8, in14_8,
in15_8, in16_8, in17_8, in18_8, in19_8, in20_8, in21_8,
in22_8, in23_8, in24_8, in25_8, in26_8, in27_8, in28_8,
in1_9, in2_9, in3_9, in4_9, in5_9, in6_9, in7_9,
in8_9, in9_9, in10_9, in11_9, in12_9, in13_9, in14_9,
in15_9, in16_9, in17_9, in18_9, in19_9, in20_9, in21_9,
in22_9, in23_9, in24_9, in25_9, in26_9, in27_9, in28_9,
in_valid_0, in_valid_1, in_valid_2, in_valid_3, in_valid_4, in_valid_5, in_valid_6, in_valid_7, in_valid_8, in_valid_9,
out1, out2, out3, out4, out5, out6, out7,
out8, out9, out10, out11, out12, out13, out14,
out15, out16, out17, out18, out19, out20, out21,
out22, out23, out24, out25, out26, out27, out28,
out_valid
    );
    
    input [3:0] sel;
    
    input [31:0] in1_0, in2_0, in3_0, in4_0, in5_0, in6_0, in7_0;
    input [31:0] in8_0, in9_0, in10_0, in11_0, in12_0, in13_0, in14_0;
    input [31:0] in15_0, in16_0, in17_0, in18_0, in19_0, in20_0, in21_0;
    input [31:0] in22_0, in23_0, in24_0, in25_0, in26_0, in27_0, in28_0;
    
    input [31:0] in1_1, in2_1, in3_1, in4_1, in5_1, in6_1, in7_1;
    input [31:0] in8_1, in9_1, in10_1, in11_1, in12_1, in13_1, in14_1;
    input [31:0] in15_1, in16_1, in17_1, in18_1, in19_1, in20_1, in21_1;
    input [31:0] in22_1, in23_1, in24_1, in25_1, in26_1, in27_1, in28_1;
    
    input [31:0] in1_2, in2_2, in3_2, in4_2, in5_2, in6_2, in7_2;
    input [31:0] in8_2, in9_2, in10_2, in11_2, in12_2, in13_2, in14_2;
    input [31:0] in15_2, in16_2, in17_2, in18_2, in19_2, in20_2, in21_2;
    input [31:0] in22_2, in23_2, in24_2, in25_2, in26_2, in27_2, in28_2;
    
    input [31:0] in1_3, in2_3, in3_3, in4_3, in5_3, in6_3, in7_3;
    input [31:0] in8_3, in9_3, in10_3, in11_3, in12_3, in13_3, in14_3;
    input [31:0] in15_3, in16_3, in17_3, in18_3, in19_3, in20_3, in21_3;
    input [31:0] in22_3, in23_3, in24_3, in25_3, in26_3, in27_3, in28_3;
    
    input [31:0] in1_4, in2_4, in3_4, in4_4, in5_4, in6_4, in7_4;
    input [31:0] in8_4, in9_4, in10_4, in11_4, in12_4, in13_4, in14_4;
    input [31:0] in15_4, in16_4, in17_4, in18_4, in19_4, in20_4, in21_4;
    input [31:0] in22_4, in23_4, in24_4, in25_4, in26_4, in27_4, in28_4;
    
    input [31:0] in1_5, in2_5, in3_5, in4_5, in5_5, in6_5, in7_5;
    input [31:0] in8_5, in9_5, in10_5, in11_5, in12_5, in13_5, in14_5;
    input [31:0] in15_5, in16_5, in17_5, in18_5, in19_5, in20_5, in21_5;
    input [31:0] in22_5, in23_5, in24_5, in25_5, in26_5, in27_5, in28_5;
    
    input [31:0] in1_6, in2_6, in3_6, in4_6, in5_6, in6_6, in7_6;
    input [31:0] in8_6, in9_6, in10_6, in11_6, in12_6, in13_6, in14_6;
    input [31:0] in15_6, in16_6, in17_6, in18_6, in19_6, in20_6, in21_6;
    input [31:0] in22_6, in23_6, in24_6, in25_6, in26_6, in27_6, in28_6;
    
    input [31:0] in1_7, in2_7, in3_7, in4_7, in5_7, in6_7, in7_7;
    input [31:0] in8_7, in9_7, in10_7, in11_7, in12_7, in13_7, in14_7;
    input [31:0] in15_7, in16_7, in17_7, in18_7, in19_7, in20_7, in21_7;
    input [31:0] in22_7, in23_7, in24_7, in25_7, in26_7, in27_7, in28_7;
    
    input [31:0] in1_8, in2_8, in3_8, in4_8, in5_8, in6_8, in7_8;
    input [31:0] in8_8, in9_8, in10_8, in11_8, in12_8, in13_8, in14_8;
    input [31:0] in15_8, in16_8, in17_8, in18_8, in19_8, in20_8, in21_8;
    input [31:0] in22_8, in23_8, in24_8, in25_8, in26_8, in27_8, in28_8;
    
    input [31:0] in1_9, in2_9, in3_9, in4_9, in5_9, in6_9, in7_9;
    input [31:0] in8_9, in9_9, in10_9, in11_9, in12_9, in13_9, in14_9;
    input [31:0] in15_9, in16_9, in17_9, in18_9, in19_9, in20_9, in21_9;
    input [31:0] in22_9, in23_9, in24_9, in25_9, in26_9, in27_9, in28_9;
    
    input in_valid_0;
    input in_valid_1;
    input in_valid_2;
    input in_valid_3;
    input in_valid_4;
    input in_valid_5;
    input in_valid_6;
    input in_valid_7;
    input in_valid_8;
    input in_valid_9;
    
    output reg [31:0] out1, out2, out3, out4, out5, out6, out7;
    output reg [31:0] out8, out9, out10, out11, out12, out13, out14;
    output reg [31:0] out15, out16, out17, out18, out19, out20, out21;
    output reg [31:0] out22, out23, out24, out25, out26, out27, out28;
    
    output reg out_valid;
    
    always@(*) begin
        case(sel)
            0: begin
                out1 <= in1_0;
                out2 <= in2_0;
                out3 <= in3_0;
                out4 <= in4_0;
                out5 <= in5_0;
                out6 <= in6_0;
                out7 <= in7_0;
                out8 <= in8_0;
                out9 <= in9_0;
                out10 <= in10_0;
                out11 <= in11_0;
                out12 <= in12_0;
                out13 <= in13_0;
                out14 <= in14_0;
                out15 <= in15_0;
                out16 <= in16_0;
                out17 <= in17_0;
                out18 <= in18_0;
                out19 <= in19_0;
                out20 <= in20_0;
                out21 <= in21_0;
                out22 <= in22_0;
                out23 <= in23_0;
                out24 <= in24_0;
                out25 <= in25_0;
                out26 <= in26_0;
                out27 <= in27_0;
                out28 <= in28_0;
                out_valid <= in_valid_0;
            end
            1: begin
                out1 <= in1_1;
                out2 <= in2_1;
                out3 <= in3_1;
                out4 <= in4_1;
                out5 <= in5_1;
                out6 <= in6_1;
                out7 <= in7_1;
                out8 <= in8_1;
                out9 <= in9_1;
                out10 <= in10_1;
                out11 <= in11_1;
                out12 <= in12_1;
                out13 <= in13_1;
                out14 <= in14_1;
                out15 <= in15_1;
                out16 <= in16_1;
                out17 <= in17_1;
                out18 <= in18_1;
                out19 <= in19_1;
                out20 <= in20_1;
                out21 <= in21_1;
                out22 <= in22_1;
                out23 <= in23_1;
                out24 <= in24_1;
                out25 <= in25_1;
                out26 <= in26_1;
                out27 <= in27_1;
                out28 <= in28_1;
                out_valid <= in_valid_1;
            end
            2: begin
                out1 <= in1_2;
                out2 <= in2_2;
                out3 <= in3_2;
                out4 <= in4_2;
                out5 <= in5_2;
                out6 <= in6_2;
                out7 <= in7_2;
                out8 <= in8_2;
                out9 <= in9_2;
                out10 <= in10_2;
                out11 <= in11_2;
                out12 <= in12_2;
                out13 <= in13_2;
                out14 <= in14_2;
                out15 <= in15_2;
                out16 <= in16_2;
                out17 <= in17_2;
                out18 <= in18_2;
                out19 <= in19_2;
                out20 <= in20_2;
                out21 <= in21_2;
                out22 <= in22_2;
                out23 <= in23_2;
                out24 <= in24_2;
                out25 <= in25_2;
                out26 <= in26_2;
                out27 <= in27_2;
                out28 <= in28_2;
                out_valid <= in_valid_2;
            end
            3: begin
                out1 <= in1_3;
                out2 <= in2_3;
                out3 <= in3_3;
                out4 <= in4_3;
                out5 <= in5_3;
                out6 <= in6_3;
                out7 <= in7_3;
                out8 <= in8_3;
                out9 <= in9_3;
                out10 <= in10_3;
                out11 <= in11_3;
                out12 <= in12_3;
                out13 <= in13_3;
                out14 <= in14_3;
                out15 <= in15_3;
                out16 <= in16_3;
                out17 <= in17_3;
                out18 <= in18_3;
                out19 <= in19_3;
                out20 <= in20_3;
                out21 <= in21_3;
                out22 <= in22_3;
                out23 <= in23_3;
                out24 <= in24_3;
                out25 <= in25_3;
                out26 <= in26_3;
                out27 <= in27_3;
                out28 <= in28_3;
                out_valid <= in_valid_3;
            end
            4: begin
                out1 <= in1_4;
                out2 <= in2_4;
                out3 <= in3_4;
                out4 <= in4_4;
                out5 <= in5_4;
                out6 <= in6_4;
                out7 <= in7_4;
                out8 <= in8_4;
                out9 <= in9_4;
                out10 <= in10_4;
                out11 <= in11_4;
                out12 <= in12_4;
                out13 <= in13_4;
                out14 <= in14_4;
                out15 <= in15_4;
                out16 <= in16_4;
                out17 <= in17_4;
                out18 <= in18_4;
                out19 <= in19_4;
                out20 <= in20_4;
                out21 <= in21_4;
                out22 <= in22_4;
                out23 <= in23_4;
                out24 <= in24_4;
                out25 <= in25_4;
                out26 <= in26_4;
                out27 <= in27_4;
                out28 <= in28_4;
                out_valid <= in_valid_4;
            end
            5: begin
                out1 <= in1_5;
                out2 <= in2_5;
                out3 <= in3_5;
                out4 <= in4_5;
                out5 <= in5_5;
                out6 <= in6_5;
                out7 <= in7_5;
                out8 <= in8_5;
                out9 <= in9_5;
                out10 <= in10_5;
                out11 <= in11_5;
                out12 <= in12_5;
                out13 <= in13_5;
                out14 <= in14_5;
                out15 <= in15_5;
                out16 <= in16_5;
                out17 <= in17_5;
                out18 <= in18_5;
                out19 <= in19_5;
                out20 <= in20_5;
                out21 <= in21_5;
                out22 <= in22_5;
                out23 <= in23_5;
                out24 <= in24_5;
                out25 <= in25_5;
                out26 <= in26_5;
                out27 <= in27_5;
                out28 <= in28_5;
                out_valid <= in_valid_5;
            end
            6: begin
                out1 <= in1_6;
                out2 <= in2_6;
                out3 <= in3_6;
                out4 <= in4_6;
                out5 <= in5_6;
                out6 <= in6_6;
                out7 <= in7_6;
                out8 <= in8_6;
                out9 <= in9_6;
                out10 <= in10_6;
                out11 <= in11_6;
                out12 <= in12_6;
                out13 <= in13_6;
                out14 <= in14_6;
                out15 <= in15_6;
                out16 <= in16_6;
                out17 <= in17_6;
                out18 <= in18_6;
                out19 <= in19_6;
                out20 <= in20_6;
                out21 <= in21_6;
                out22 <= in22_6;
                out23 <= in23_6;
                out24 <= in24_6;
                out25 <= in25_6;
                out26 <= in26_6;
                out27 <= in27_6;
                out28 <= in28_6;
                out_valid <= in_valid_6;
            end
            7: begin
                out1 <= in1_7;
                out2 <= in2_7;
                out3 <= in3_7;
                out4 <= in4_7;
                out5 <= in5_7;
                out6 <= in6_7;
                out7 <= in7_7;
                out8 <= in8_7;
                out9 <= in9_7;
                out10 <= in10_7;
                out11 <= in11_7;
                out12 <= in12_7;
                out13 <= in13_7;
                out14 <= in14_7;
                out15 <= in15_7;
                out16 <= in16_7;
                out17 <= in17_7;
                out18 <= in18_7;
                out19 <= in19_7;
                out20 <= in20_7;
                out21 <= in21_7;
                out22 <= in22_7;
                out23 <= in23_7;
                out24 <= in24_7;
                out25 <= in25_7;
                out26 <= in26_7;
                out27 <= in27_7;
                out28 <= in28_7;
                out_valid <= in_valid_7;
            end
            8: begin
                out1 <= in1_8;
                out2 <= in2_8;
                out3 <= in3_8;
                out4 <= in4_8;
                out5 <= in5_8;
                out6 <= in6_8;
                out7 <= in7_8;
                out8 <= in8_8;
                out9 <= in9_8;
                out10 <= in10_8;
                out11 <= in11_8;
                out12 <= in12_8;
                out13 <= in13_8;
                out14 <= in14_8;
                out15 <= in15_8;
                out16 <= in16_8;
                out17 <= in17_8;
                out18 <= in18_8;
                out19 <= in19_8;
                out20 <= in20_8;
                out21 <= in21_8;
                out22 <= in22_8;
                out23 <= in23_8;
                out24 <= in24_8;
                out25 <= in25_8;
                out26 <= in26_8;
                out27 <= in27_8;
                out28 <= in28_8;
                out_valid <= in_valid_8;
            end
            9: begin
                out1 <= in1_9;
                out2 <= in2_9;
                out3 <= in3_9;
                out4 <= in4_9;
                out5 <= in5_9;
                out6 <= in6_9;
                out7 <= in7_9;
                out8 <= in8_9;
                out9 <= in9_9;
                out10 <= in10_9;
                out11 <= in11_9;
                out12 <= in12_9;
                out13 <= in13_9;
                out14 <= in14_9;
                out15 <= in15_9;
                out16 <= in16_9;
                out17 <= in17_9;
                out18 <= in18_9;
                out19 <= in19_9;
                out20 <= in20_9;
                out21 <= in21_9;
                out22 <= in22_9;
                out23 <= in23_9;
                out24 <= in24_9;
                out25 <= in25_9;
                out26 <= in26_9;
                out27 <= in27_9;
                out28 <= in28_9;
                out_valid <= in_valid_9;
            end
            default: begin
                out1 <= 0;
                out2 <= 0;
                out3 <= 0;
                out4 <= 0;
                out5 <= 0;
                out6 <= 0;
                out7 <= 0;
                out8 <= 0;
                out9 <= 0;
                out10 <= 0;
                out11 <= 0;
                out12 <= 0;
                out13 <= 0;
                out14 <= 0;
                out15 <= 0;
                out16 <= 0;
                out17 <= 0;
                out18 <= 0;
                out19 <= 0;
                out20 <= 0;
                out21 <= 0;
                out22 <= 0;
                out23 <= 0;
                out24 <= 0;
                out25 <= 0;
                out26 <= 0;
                out27 <= 0;
                out28 <= 0;
                out_valid <= 0;
            end
        endcase
    end
    
endmodule
