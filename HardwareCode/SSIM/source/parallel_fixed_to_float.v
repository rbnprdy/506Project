`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2018 04:49:38 PM
// Design Name: 
// Module Name: parallel_fixed_to_float
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


module parallel_fixed_to_float(
clk, in_valid,
in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, 
in15, in16, in17, in18, in19, in20, in21, in22, in23, in24, in25, in26, in27, in28,
out1_ready, out2_ready, out3_ready, out4_ready, out5_ready, out6_ready, out7_ready,
out8_ready, out9_ready, out10_ready, out11_ready, out12_ready, out13_ready, out14_ready,
out15_ready, out16_ready, out17_ready, out18_ready, out19_ready, out20_ready, out21_ready,
out22_ready, out23_ready, out24_ready, out25_ready, out26_ready, out27_ready, out28_ready,
in1_ready, in2_ready, in3_ready, in4_ready, in5_ready, in6_ready, in7_ready, 
in8_ready, in9_ready, in10_ready, in11_ready, in12_ready, in13_ready, in14_ready, 
in15_ready, in16_ready, in17_ready, in18_ready, in19_ready, in20_ready, in21_ready, 
in22_ready, in23_ready, in24_ready, in25_ready, in26_ready, in27_ready, in28_ready,
out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, 
out15, out16, out17, out18, out19, out20, out21, out22, out23, out24, out25, out26, out27, out28,
out1_valid, out2_valid, out3_valid, out4_valid, out5_valid, out6_valid, out7_valid, 
out8_valid, out9_valid, out10_valid, out11_valid, out12_valid, out13_valid, out14_valid, 
out15_valid, out16_valid, out17_valid, out18_valid, out19_valid, out20_valid, out21_valid, 
out22_valid, out23_valid, out24_valid, out25_valid, out26_valid, out27_valid, out28_valid
);
    input clk, in_valid;
    
    input [31:0] in1, in2, in3, in4, in5, in6, in7;
    input [31:0] in8, in9, in10, in11, in12, in13, in14;
    input [31:0] in15, in16, in17, in18, in19, in20, in21;
    input [31:0] in22, in23, in24, in25, in26, in27, in28;    
    
    input out1_ready, out2_ready, out3_ready, out4_ready, out5_ready, out6_ready, out7_ready;
    input out8_ready, out9_ready, out10_ready, out11_ready, out12_ready, out13_ready, out14_ready;
    input out15_ready, out16_ready, out17_ready, out18_ready, out19_ready, out20_ready, out21_ready;
    input out22_ready, out23_ready, out24_ready, out25_ready, out26_ready, out27_ready, out28_ready;
    
    output in1_ready, in2_ready, in3_ready, in4_ready, in5_ready, in6_ready, in7_ready;
    output in8_ready, in9_ready, in10_ready, in11_ready, in12_ready, in13_ready, in14_ready;
    output in15_ready, in16_ready, in17_ready, in18_ready, in19_ready, in20_ready, in21_ready;
    output in22_ready, in23_ready, in24_ready, in25_ready, in26_ready, in27_ready, in28_ready;
    
    output [31:0] out1, out2, out3, out4, out5, out6, out7;
    output [31:0] out8, out9, out10, out11, out12, out13, out14;
    output [31:0] out15, out16, out17, out18, out19, out20, out21;
    output [31:0] out22, out23, out24, out25, out26, out27, out28;     
    
    output out1_valid, out2_valid, out3_valid, out4_valid, out5_valid, out6_valid, out7_valid;
    output out8_valid, out9_valid, out10_valid, out11_valid, out12_valid, out13_valid, out14_valid;
    output out15_valid, out16_valid, out17_valid, out18_valid, out19_valid, out20_valid, out21_valid;
    output out22_valid, out23_valid, out24_valid, out25_valid, out26_valid, out27_valid, out28_valid; 
  
    fixed_to_float_converter in_to_float1 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in1_ready),
        .s_axis_a_tdata(in1),
        .m_axis_result_tvalid(out1_valid),
        .m_axis_result_tready(out1_ready),
        .m_axis_result_tdata(out1)
    );
    
    fixed_to_float_converter in_to_float2 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in2_ready),
        .s_axis_a_tdata(in2),
        .m_axis_result_tvalid(out2_valid),
        .m_axis_result_tready(out2_ready),
        .m_axis_result_tdata(out2)
    );
    
    fixed_to_float_converter in_to_float3 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in3_ready),
        .s_axis_a_tdata(in3),
        .m_axis_result_tvalid(out3_valid),
        .m_axis_result_tready(out3_ready),
        .m_axis_result_tdata(out3)
    );
    
    fixed_to_float_converter in_to_float4 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in4_ready),
        .s_axis_a_tdata(in4),
        .m_axis_result_tvalid(out4_valid),
        .m_axis_result_tready(out4_ready),
        .m_axis_result_tdata(out4)
    );
    
    fixed_to_float_converter in_to_float5 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in5_ready),
        .s_axis_a_tdata(in5),
        .m_axis_result_tvalid(out5_valid),
        .m_axis_result_tready(out5_ready),
        .m_axis_result_tdata(out5)
    );
    
    fixed_to_float_converter in_to_float6 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in6_ready),
        .s_axis_a_tdata(in6),
        .m_axis_result_tvalid(out6_valid),
        .m_axis_result_tready(out6_ready),
        .m_axis_result_tdata(out6)
    );
    
    fixed_to_float_converter in_to_float7 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in7_ready),
        .s_axis_a_tdata(in7),
        .m_axis_result_tvalid(out7_valid),
        .m_axis_result_tready(out7_ready),
        .m_axis_result_tdata(out7)
    );
    
    fixed_to_float_converter in_to_float8 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in8_ready),
        .s_axis_a_tdata(in8),
        .m_axis_result_tvalid(out8_valid),
        .m_axis_result_tready(out8_ready),
        .m_axis_result_tdata(out8)
    );
    
    fixed_to_float_converter in_to_float9 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in9_ready),
        .s_axis_a_tdata(in9),
        .m_axis_result_tvalid(out9_valid),
        .m_axis_result_tready(out9_ready),
        .m_axis_result_tdata(out9)
    );
    
    fixed_to_float_converter in_to_float10 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in10_ready),
        .s_axis_a_tdata(in10),
        .m_axis_result_tvalid(out10_valid),
        .m_axis_result_tready(out10_ready),
        .m_axis_result_tdata(out10)
    );
    
    fixed_to_float_converter in_to_float11 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in11_ready),
        .s_axis_a_tdata(in11),
        .m_axis_result_tvalid(out11_valid),
        .m_axis_result_tready(out11_ready),
        .m_axis_result_tdata(out11)
    );
    
    fixed_to_float_converter in_to_float12 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in12_ready),
        .s_axis_a_tdata(in12),
        .m_axis_result_tvalid(out12_valid),
        .m_axis_result_tready(out12_ready),
        .m_axis_result_tdata(out12)
    );
    
    fixed_to_float_converter in_to_float13 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in13_ready),
        .s_axis_a_tdata(in13),
        .m_axis_result_tvalid(out13_valid),
        .m_axis_result_tready(out13_ready),
        .m_axis_result_tdata(out13)
    );
    
    fixed_to_float_converter in_to_float14 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in14_ready),
        .s_axis_a_tdata(in14),
        .m_axis_result_tvalid(out14_valid),
        .m_axis_result_tready(out14_ready),
        .m_axis_result_tdata(out14)
    );
    
    fixed_to_float_converter in_to_float15 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in15_ready),
        .s_axis_a_tdata(in15),
        .m_axis_result_tvalid(out15_valid),
        .m_axis_result_tready(out15_ready),
        .m_axis_result_tdata(out15)
    );
    
    fixed_to_float_converter in_to_float16 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in16_ready),
        .s_axis_a_tdata(in16),
        .m_axis_result_tvalid(out16_valid),
        .m_axis_result_tready(out16_ready),
        .m_axis_result_tdata(out16)
    );
    
    fixed_to_float_converter in_to_float17 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in17_ready),
        .s_axis_a_tdata(in17),
        .m_axis_result_tvalid(out17_valid),
        .m_axis_result_tready(out17_ready),
        .m_axis_result_tdata(out17)
    );
    
    fixed_to_float_converter in_to_float18 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in18_ready),
        .s_axis_a_tdata(in18),
        .m_axis_result_tvalid(out18_valid),
        .m_axis_result_tready(out18_ready),
        .m_axis_result_tdata(out18)
    );
    
    fixed_to_float_converter in_to_float19 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in19_ready),
        .s_axis_a_tdata(in19),
        .m_axis_result_tvalid(out19_valid),
        .m_axis_result_tready(out19_ready),
        .m_axis_result_tdata(out19)
    );
    
    fixed_to_float_converter in_to_float20 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in20_ready),
        .s_axis_a_tdata(in20),
        .m_axis_result_tvalid(out20_valid),
        .m_axis_result_tready(out20_ready),
        .m_axis_result_tdata(out20)
    );
    
    fixed_to_float_converter in_to_float21 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in21_ready),
        .s_axis_a_tdata(in21),
        .m_axis_result_tvalid(out21_valid),
        .m_axis_result_tready(out21_ready),
        .m_axis_result_tdata(out21)
    );
    
    fixed_to_float_converter in_to_float22 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in22_ready),
        .s_axis_a_tdata(in22),
        .m_axis_result_tvalid(out22_valid),
        .m_axis_result_tready(out22_ready),
        .m_axis_result_tdata(out22)
    );
    
    fixed_to_float_converter in_to_float23 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in23_ready),
        .s_axis_a_tdata(in23),
        .m_axis_result_tvalid(out23_valid),
        .m_axis_result_tready(out23_ready),
        .m_axis_result_tdata(out23)
    );
    
    fixed_to_float_converter in_to_float24 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in24_ready),
        .s_axis_a_tdata(in24),
        .m_axis_result_tvalid(out24_valid),
        .m_axis_result_tready(out24_ready),
        .m_axis_result_tdata(out24)
    );
    
    fixed_to_float_converter in_to_float25 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in25_ready),
        .s_axis_a_tdata(in25),
        .m_axis_result_tvalid(out25_valid),
        .m_axis_result_tready(out25_ready),
        .m_axis_result_tdata(out25)
    );
    
    fixed_to_float_converter in_to_float26 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in26_ready),
        .s_axis_a_tdata(in26),
        .m_axis_result_tvalid(out26_valid),
        .m_axis_result_tready(out26_ready),
        .m_axis_result_tdata(out26)
    );
    
    fixed_to_float_converter in_to_float27 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in27_ready),
        .s_axis_a_tdata(in27),
        .m_axis_result_tvalid(out27_valid),
        .m_axis_result_tready(out27_ready),
        .m_axis_result_tdata(out27)
    );
    
    fixed_to_float_converter in_to_float28 (
        .aclk(clk),
        .s_axis_a_tvalid(in_valid),
        .s_axis_a_tready(in28_ready),
        .s_axis_a_tdata(in28),
        .m_axis_result_tvalid(out28_valid),
        .m_axis_result_tready(out28_ready),
        .m_axis_result_tdata(out28)
    );   
endmodule
