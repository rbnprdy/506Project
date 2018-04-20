`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2018 05:11:08 PM
// Design Name: 
// Module Name: parallel_float_to_fixed
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


module parallel_float_to_fixed(
clk,
// in
in1, in2, in3, in4, in5, in6, in7,
in8, in9, in10, in11, in12, in13, in14,
in15, in16, in17, in18, in19, in20, in21,
in22, in23, in24, in25, in26, in27, in28,
// in_valid
in1_valid, in2_valid, in3_valid, in4_valid, in5_valid, in6_valid, in7_valid,
in8_valid, in9_valid, in10_valid, in11_valid, in12_valid, in13_valid, in14_valid,
in15_valid, in16_valid, in17_valid, in18_valid, in19_valid, in20_valid, in21_valid,
in22_valid, in23_valid, in24_valid, in25_valid, in26_valid, in27_valid, in28_valid,
// result_ready
result_1_ready, result_2_ready, result_3_ready, result_4_ready, result_5_ready, result_6_ready, result_7_ready,
result_8_ready, result_9_ready, result_10_ready, result_11_ready, result_12_ready, result_13_ready, result_14_ready,
result_15_ready, result_16_ready, result_17_ready, result_18_ready, result_19_ready, result_20_ready, result_21_ready,
result_22_ready, result_23_ready, result_24_ready, result_25_ready, result_26_ready, result_27_ready, result_28_ready,
// in_ready
in1_ready, in2_ready, in3_ready, in4_ready, in5_ready, in6_ready, in7_ready,
in8_ready, in9_ready, in10_ready, in11_ready, in12_ready, in13_ready, in14_ready,
in15_ready, in16_ready, in17_ready, in18_ready, in19_ready, in20_ready, in21_ready,
in22_ready, in23_ready, in24_ready, in25_ready, in26_ready, in27_ready, in28_ready,
// out
out1, out2, out3, out4, out5, out6, out7,
out8, out9, out10, out11, out12, out13, out14,
out15, out16, out17, out18, out19, out20, out21,
out22, out23, out24, out25, out26, out27, out28,
// out_valid
out1_valid, out2_valid, out3_valid, out4_valid, out5_valid, out6_valid, out7_valid,
out8_valid, out9_valid, out10_valid, out11_valid, out12_valid, out13_valid, out14_valid,
out15_valid, out16_valid, out17_valid, out18_valid, out19_valid, out20_valid, out21_valid,
out22_valid, out23_valid, out24_valid, out25_valid, out26_valid, out27_valid, out28_valid
);

    input clk;
    // in
    input [31:0] in1, in2, in3, in4, in5, in6, in7;
    input [31:0] in8, in9, in10, in11, in12, in13, in14;
    input [31:0] in15, in16, in17, in18, in19, in20, in21;
    input [31:0] in22, in23, in24, in25, in26, in27, in28;
    // in_valid
    input in1_valid, in2_valid, in3_valid, in4_valid, in5_valid, in6_valid, in7_valid;
    input in8_valid, in9_valid, in10_valid, in11_valid, in12_valid, in13_valid, in14_valid;
    input in15_valid, in16_valid, in17_valid, in18_valid, in19_valid, in20_valid, in21_valid;
    input in22_valid, in23_valid, in24_valid, in25_valid, in26_valid, in27_valid, in28_valid;
    // result_ready
    input result_1_ready, result_2_ready, result_3_ready, result_4_ready, result_5_ready, result_6_ready, result_7_ready;
    input result_8_ready, result_9_ready, result_10_ready, result_11_ready, result_12_ready, result_13_ready, result_14_ready;
    input result_15_ready, result_16_ready, result_17_ready, result_18_ready, result_19_ready, result_20_ready, result_21_ready;
    input result_22_ready, result_23_ready, result_24_ready, result_25_ready, result_26_ready, result_27_ready, result_28_ready;
    // in_ready
    input in1_ready, in2_ready, in3_ready, in4_ready, in5_ready, in6_ready, in7_ready;
    input in8_ready, in9_ready, in10_ready, in11_ready, in12_ready, in13_ready, in14_ready;
    input in15_ready, in16_ready, in17_ready, in18_ready, in19_ready, in20_ready, in21_ready;
    input in22_ready, in23_ready, in24_ready, in25_ready, in26_ready, in27_ready, in28_ready;
    // out
    output [31:0] out1, out2, out3, out4, out5, out6, out7;
    output [31:0] out8, out9, out10, out11, out12, out13, out14;
    output [31:0] out15, out16, out17, out18, out19, out20, out21;
    output [31:0] out22, out23, out24, out25, out26, out27, out28;
    // out_valid
    output out1_valid, out2_valid, out3_valid, out4_valid, out5_valid, out6_valid, out7_valid;
    output out8_valid, out9_valid, out10_valid, out11_valid, out12_valid, out13_valid, out14_valid;
    output out15_valid, out16_valid, out17_valid, out18_valid, out19_valid, out20_valid, out21_valid;
    output out22_valid, out23_valid, out24_valid, out25_valid, out26_valid, out27_valid, out28_valid;
    
    float_to_fixed_converter float_to_fixed_1(
        .aclk(clk),
        .s_axis_a_tvalid(in1_valid),
        .s_axis_a_tready(in1_ready),
        .s_axis_a_tdata(in1),
        .m_axis_result_tvalid(out1_valid),
        .m_axis_result_tready(result_1_ready),
        .m_axis_result_tdata(out1)
    );
     
    float_to_fixed_converter float_to_fixed_2(
        .aclk(clk),
        .s_axis_a_tvalid(in2_valid),
        .s_axis_a_tready(in2_ready),
        .s_axis_a_tdata(in2),
        .m_axis_result_tvalid(out2_valid),
        .m_axis_result_tready(result_2_ready),
        .m_axis_result_tdata(out2)
    );
     
    float_to_fixed_converter float_to_fixed_3(
        .aclk(clk),
        .s_axis_a_tvalid(in3_valid),
        .s_axis_a_tready(in3_ready),
        .s_axis_a_tdata(in3),
        .m_axis_result_tvalid(out3_valid),
        .m_axis_result_tready(result_3_ready),
        .m_axis_result_tdata(out3)
    );
     
    float_to_fixed_converter float_to_fixed_4(
        .aclk(clk),
        .s_axis_a_tvalid(in4_valid),
        .s_axis_a_tready(in4_ready),
        .s_axis_a_tdata(in4),
        .m_axis_result_tvalid(out4_valid),
        .m_axis_result_tready(result_4_ready),
        .m_axis_result_tdata(out4)
    );
     
    float_to_fixed_converter float_to_fixed_5(
        .aclk(clk),
        .s_axis_a_tvalid(in5_valid),
        .s_axis_a_tready(in5_ready),
        .s_axis_a_tdata(in5),
        .m_axis_result_tvalid(out5_valid),
        .m_axis_result_tready(result_5_ready),
        .m_axis_result_tdata(out5)
    );
     
    float_to_fixed_converter float_to_fixed_6(
        .aclk(clk),
        .s_axis_a_tvalid(in6_valid),
        .s_axis_a_tready(in6_ready),
        .s_axis_a_tdata(in6),
        .m_axis_result_tvalid(out6_valid),
        .m_axis_result_tready(result_6_ready),
        .m_axis_result_tdata(out6)
    );
     
    float_to_fixed_converter float_to_fixed_7(
        .aclk(clk),
        .s_axis_a_tvalid(in7_valid),
        .s_axis_a_tready(in7_ready),
        .s_axis_a_tdata(in7),
        .m_axis_result_tvalid(out7_valid),
        .m_axis_result_tready(result_7_ready),
        .m_axis_result_tdata(out7)
    );
     
    float_to_fixed_converter float_to_fixed_8(
        .aclk(clk),
        .s_axis_a_tvalid(in8_valid),
        .s_axis_a_tready(in8_ready),
        .s_axis_a_tdata(in8),
        .m_axis_result_tvalid(out8_valid),
        .m_axis_result_tready(result_8_ready),
        .m_axis_result_tdata(out8)
    );
     
    float_to_fixed_converter float_to_fixed_9(
        .aclk(clk),
        .s_axis_a_tvalid(in9_valid),
        .s_axis_a_tready(in9_ready),
        .s_axis_a_tdata(in9),
        .m_axis_result_tvalid(out9_valid),
        .m_axis_result_tready(result_9_ready),
        .m_axis_result_tdata(out9)
    );
     
    float_to_fixed_converter float_to_fixed_10(
        .aclk(clk),
        .s_axis_a_tvalid(in10_valid),
        .s_axis_a_tready(in10_ready),
        .s_axis_a_tdata(in10),
        .m_axis_result_tvalid(out10_valid),
        .m_axis_result_tready(result_10_ready),
        .m_axis_result_tdata(out10)
    );
     
    float_to_fixed_converter float_to_fixed_11(
        .aclk(clk),
        .s_axis_a_tvalid(in11_valid),
        .s_axis_a_tready(in11_ready),
        .s_axis_a_tdata(in11),
        .m_axis_result_tvalid(out11_valid),
        .m_axis_result_tready(result_11_ready),
        .m_axis_result_tdata(out11)
    );
     
    float_to_fixed_converter float_to_fixed_12(
        .aclk(clk),
        .s_axis_a_tvalid(in12_valid),
        .s_axis_a_tready(in12_ready),
        .s_axis_a_tdata(in12),
        .m_axis_result_tvalid(out12_valid),
        .m_axis_result_tready(result_12_ready),
        .m_axis_result_tdata(out12)
    );
     
    float_to_fixed_converter float_to_fixed_13(
        .aclk(clk),
        .s_axis_a_tvalid(in13_valid),
        .s_axis_a_tready(in13_ready),
        .s_axis_a_tdata(in13),
        .m_axis_result_tvalid(out13_valid),
        .m_axis_result_tready(result_13_ready),
        .m_axis_result_tdata(out13)
    );
     
    float_to_fixed_converter float_to_fixed_14(
        .aclk(clk),
        .s_axis_a_tvalid(in14_valid),
        .s_axis_a_tready(in14_ready),
        .s_axis_a_tdata(in14),
        .m_axis_result_tvalid(out14_valid),
        .m_axis_result_tready(result_14_ready),
        .m_axis_result_tdata(out14)
    );
     
    float_to_fixed_converter float_to_fixed_15(
        .aclk(clk),
        .s_axis_a_tvalid(in15_valid),
        .s_axis_a_tready(in15_ready),
        .s_axis_a_tdata(in15),
        .m_axis_result_tvalid(out15_valid),
        .m_axis_result_tready(result_15_ready),
        .m_axis_result_tdata(out15)
    );
     
    float_to_fixed_converter float_to_fixed_16(
        .aclk(clk),
        .s_axis_a_tvalid(in16_valid),
        .s_axis_a_tready(in16_ready),
        .s_axis_a_tdata(in16),
        .m_axis_result_tvalid(out16_valid),
        .m_axis_result_tready(result_16_ready),
        .m_axis_result_tdata(out16)
    );
     
    float_to_fixed_converter float_to_fixed_17(
        .aclk(clk),
        .s_axis_a_tvalid(in17_valid),
        .s_axis_a_tready(in17_ready),
        .s_axis_a_tdata(in17),
        .m_axis_result_tvalid(out17_valid),
        .m_axis_result_tready(result_17_ready),
        .m_axis_result_tdata(out17)
    );
     
    float_to_fixed_converter float_to_fixed_18(
        .aclk(clk),
        .s_axis_a_tvalid(in18_valid),
        .s_axis_a_tready(in18_ready),
        .s_axis_a_tdata(in18),
        .m_axis_result_tvalid(out18_valid),
        .m_axis_result_tready(result_18_ready),
        .m_axis_result_tdata(out18)
    );
     
    float_to_fixed_converter float_to_fixed_19(
        .aclk(clk),
        .s_axis_a_tvalid(in19_valid),
        .s_axis_a_tready(in19_ready),
        .s_axis_a_tdata(in19),
        .m_axis_result_tvalid(out19_valid),
        .m_axis_result_tready(result_19_ready),
        .m_axis_result_tdata(out19)
    );
     
    float_to_fixed_converter float_to_fixed_20(
        .aclk(clk),
        .s_axis_a_tvalid(in20_valid),
        .s_axis_a_tready(in20_ready),
        .s_axis_a_tdata(in20),
        .m_axis_result_tvalid(out20_valid),
        .m_axis_result_tready(result_20_ready),
        .m_axis_result_tdata(out20)
    );
     
    float_to_fixed_converter float_to_fixed_21(
        .aclk(clk),
        .s_axis_a_tvalid(in21_valid),
        .s_axis_a_tready(in21_ready),
        .s_axis_a_tdata(in21),
        .m_axis_result_tvalid(out21_valid),
        .m_axis_result_tready(result_21_ready),
        .m_axis_result_tdata(out21)
    );
     
    float_to_fixed_converter float_to_fixed_22(
        .aclk(clk),
        .s_axis_a_tvalid(in22_valid),
        .s_axis_a_tready(in22_ready),
        .s_axis_a_tdata(in22),
        .m_axis_result_tvalid(out22_valid),
        .m_axis_result_tready(result_22_ready),
        .m_axis_result_tdata(out22)
    );
     
    float_to_fixed_converter float_to_fixed_23(
        .aclk(clk),
        .s_axis_a_tvalid(in23_valid),
        .s_axis_a_tready(in23_ready),
        .s_axis_a_tdata(in23),
        .m_axis_result_tvalid(out23_valid),
        .m_axis_result_tready(result_23_ready),
        .m_axis_result_tdata(out23)
    );
     
    float_to_fixed_converter float_to_fixed_24(
        .aclk(clk),
        .s_axis_a_tvalid(in24_valid),
        .s_axis_a_tready(in24_ready),
        .s_axis_a_tdata(in24),
        .m_axis_result_tvalid(out24_valid),
        .m_axis_result_tready(result_24_ready),
        .m_axis_result_tdata(out24)
    );
     
    float_to_fixed_converter float_to_fixed_25(
        .aclk(clk),
        .s_axis_a_tvalid(in25_valid),
        .s_axis_a_tready(in25_ready),
        .s_axis_a_tdata(in25),
        .m_axis_result_tvalid(out25_valid),
        .m_axis_result_tready(result_25_ready),
        .m_axis_result_tdata(out25)
    );
     
    float_to_fixed_converter float_to_fixed_26(
        .aclk(clk),
        .s_axis_a_tvalid(in26_valid),
        .s_axis_a_tready(in26_ready),
        .s_axis_a_tdata(in26),
        .m_axis_result_tvalid(out26_valid),
        .m_axis_result_tready(result_26_ready),
        .m_axis_result_tdata(out26)
    );
     
    float_to_fixed_converter float_to_fixed_27(
        .aclk(clk),
        .s_axis_a_tvalid(in27_valid),
        .s_axis_a_tready(in27_ready),
        .s_axis_a_tdata(in27),
        .m_axis_result_tvalid(out27_valid),
        .m_axis_result_tready(result_27_ready),
        .m_axis_result_tdata(out27)
    );
     
    float_to_fixed_converter float_to_fixed_28(
        .aclk(clk),
        .s_axis_a_tvalid(in28_valid),
        .s_axis_a_tready(in28_ready),
        .s_axis_a_tdata(in28),
        .m_axis_result_tvalid(out28_valid),
        .m_axis_result_tready(result_28_ready),
        .m_axis_result_tdata(out28)
    );
    
endmodule
