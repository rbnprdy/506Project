`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2018 04:39:44 PM
// Design Name: 
// Module Name: parallel_multipliers
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


module parallel_multipliers(
clk, rst,
// in_a
in_a1, in_a2, in_a3, in_a4, in_a5, in_a6, in_a7,
in_a8, in_a9, in_a10, in_a11, in_a12, in_a13, in_a14,
in_a15, in_a16, in_a17, in_a18, in_a19, in_a20, in_a21,
in_a22, in_a23, in_a24, in_a25, in_a26, in_a27, in_a28,
// in_a_valid
in_a1_valid, in_a2_valid, in_a3_valid, in_a4_valid, in_a5_valid, in_a6_valid, in_a7_valid,
in_a8_valid, in_a9_valid, in_a10_valid, in_a11_valid, in_a12_valid, in_a13_valid, in_a14_valid,
in_a15_valid, in_a16_valid, in_a17_valid, in_a18_valid, in_a19_valid, in_a20_valid, in_a21_valid,
in_a22_valid, in_a23_valid, in_a24_valid, in_a25_valid, in_a26_valid, in_a27_valid, in_a28_valid,
// in_b
in_b1, in_b2, in_b3, in_b4, in_b5, in_b6, in_b7,
in_b8, in_b9, in_b10, in_b11, in_b12, in_b13, in_b14,
in_b15, in_b16, in_b17, in_b18, in_b19, in_b20, in_b21,
in_b22, in_b23, in_b24, in_b25, in_b26, in_b27, in_b28,
// in_b_valid
in_b1_valid, in_b2_valid, in_b3_valid, in_b4_valid, in_b5_valid, in_b6_valid, in_b7_valid,
in_b8_valid, in_b9_valid, in_b10_valid, in_b11_valid, in_b12_valid, in_b13_valid, in_b14_valid,
in_b15_valid, in_b16_valid, in_b17_valid, in_b18_valid, in_b19_valid, in_b20_valid, in_b21_valid,
in_b22_valid, in_b23_valid, in_b24_valid, in_b25_valid, in_b26_valid, in_b27_valid, in_b28_valid,
// result_ready
result_1_ready, result_2_ready, result_3_ready, result_4_ready, result_5_ready, result_6_ready, result_7_ready,
result_8_ready, result_9_ready, result_10_ready, result_11_ready, result_12_ready, result_13_ready, result_14_ready,
result_15_ready, result_16_ready, result_17_ready, result_18_ready, result_19_ready, result_20_ready, result_21_ready,
result_22_ready, result_23_ready, result_24_ready, result_25_ready, result_26_ready, result_27_ready, result_28_ready,
// in_a_ready
in_a1_ready, in_a2_ready, in_a3_ready, in_a4_ready, in_a5_ready, in_a6_ready, in_a7_ready,
in_a8_ready, in_a9_ready, in_a10_ready, in_a11_ready, in_a12_ready, in_a13_ready, in_a14_ready,
in_a15_ready, in_a16_ready, in_a17_ready, in_a18_ready, in_a19_ready, in_a20_ready, in_a21_ready,
in_a22_ready, in_a23_ready, in_a24_ready, in_a25_ready, in_a26_ready, in_a27_ready, in_a28_ready,
// in_b_ready
in_b1_ready, in_b2_ready, in_b3_ready, in_b4_ready, in_b5_ready, in_b6_ready, in_b7_ready,
in_b8_ready, in_b9_ready, in_b10_ready, in_b11_ready, in_b12_ready, in_b13_ready, in_b14_ready,
in_b15_ready, in_b16_ready, in_b17_ready, in_b18_ready, in_b19_ready, in_b20_ready, in_b21_ready,
in_b22_ready, in_b23_ready, in_b24_ready, in_b25_ready, in_b26_ready, in_b27_ready, in_b28_ready,
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

    input clk, rst;
    
    input [31:0] in_a1, in_a2, in_a3, in_a4, in_a5, in_a6, in_a7;
    input [31:0] in_a8, in_a9, in_a10, in_a11, in_a12, in_a13, in_a14;
    input [31:0] in_a15, in_a16, in_a17, in_a18, in_a19, in_a20, in_a21;
    input [31:0] in_a22, in_a23, in_a24, in_a25, in_a26, in_a27, in_a28;
    // in_a_valid
    input in_a1_valid, in_a2_valid, in_a3_valid, in_a4_valid, in_a5_valid, in_a6_valid, in_a7_valid;
    input in_a8_valid, in_a9_valid, in_a10_valid, in_a11_valid, in_a12_valid, in_a13_valid, in_a14_valid;
    input in_a15_valid, in_a16_valid, in_a17_valid, in_a18_valid, in_a19_valid, in_a20_valid, in_a21_valid;
    input in_a22_valid, in_a23_valid, in_a24_valid, in_a25_valid, in_a26_valid, in_a27_valid, in_a28_valid;
    // in_b
    input [31:0] in_b1, in_b2, in_b3, in_b4, in_b5, in_b6, in_b7;
    input [31:0] in_b8, in_b9, in_b10, in_b11, in_b12, in_b13, in_b14;
    input [31:0] in_b15, in_b16, in_b17, in_b18, in_b19, in_b20, in_b21;
    input [31:0] in_b22, in_b23, in_b24, in_b25, in_b26, in_b27, in_b28;
    // in_b_valid
    input in_b1_valid, in_b2_valid, in_b3_valid, in_b4_valid, in_b5_valid, in_b6_valid, in_b7_valid;
    input in_b8_valid, in_b9_valid, in_b10_valid, in_b11_valid, in_b12_valid, in_b13_valid, in_b14_valid;
    input in_b15_valid, in_b16_valid, in_b17_valid, in_b18_valid, in_b19_valid, in_b20_valid, in_b21_valid;
    input in_b22_valid, in_b23_valid, in_b24_valid, in_b25_valid, in_b26_valid, in_b27_valid, in_b28_valid;
    // result_ready
    input result_1_ready, result_2_ready, result_3_ready, result_4_ready, result_5_ready, result_6_ready, result_7_ready;
    input result_8_ready, result_9_ready, result_10_ready, result_11_ready, result_12_ready, result_13_ready, result_14_ready;
    input result_15_ready, result_16_ready, result_17_ready, result_18_ready, result_19_ready, result_20_ready, result_21_ready;
    input result_22_ready, result_23_ready, result_24_ready, result_25_ready, result_26_ready, result_27_ready, result_28_ready;
    // in_a_ready
    output in_a1_ready, in_a2_ready, in_a3_ready, in_a4_ready, in_a5_ready, in_a6_ready, in_a7_ready;
    output in_a8_ready, in_a9_ready, in_a10_ready, in_a11_ready, in_a12_ready, in_a13_ready, in_a14_ready;
    output in_a15_ready, in_a16_ready, in_a17_ready, in_a18_ready, in_a19_ready, in_a20_ready, in_a21_ready;
    output in_a22_ready, in_a23_ready, in_a24_ready, in_a25_ready, in_a26_ready, in_a27_ready, in_a28_ready;
    // in_b_ready
    output in_b1_ready, in_b2_ready, in_b3_ready, in_b4_ready, in_b5_ready, in_b6_ready, in_b7_ready;
    output in_b8_ready, in_b9_ready, in_b10_ready, in_b11_ready, in_b12_ready, in_b13_ready, in_b14_ready;
    output in_b15_ready, in_b16_ready, in_b17_ready, in_b18_ready, in_b19_ready, in_b20_ready, in_b21_ready;
    output in_b22_ready, in_b23_ready, in_b24_ready, in_b25_ready, in_b26_ready, in_b27_ready, in_b28_ready;
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
    
    multiplier_floating_point mult1 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a1_valid),
        .s_axis_a_tready(in_a1_ready),
        .s_axis_a_tdata(in_a1),
        .s_axis_b_tvalid(in_b1_valid),
        .s_axis_b_tready(in_b1_ready),
        .s_axis_b_tdata(in_b1),
        .m_axis_result_tvalid(out1_valid),
        .m_axis_result_tready(result_1_ready),
        .m_axis_result_tdata(out1)
    );
     
    multiplier_floating_point mult2 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a2_valid),
        .s_axis_a_tready(in_a2_ready),
        .s_axis_a_tdata(in_a2),
        .s_axis_b_tvalid(in_b2_valid),
        .s_axis_b_tready(in_b2_ready),
        .s_axis_b_tdata(in_b2),
        .m_axis_result_tvalid(out2_valid),
        .m_axis_result_tready(result_2_ready),
        .m_axis_result_tdata(out2)
    );
     
    multiplier_floating_point mult3 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a3_valid),
        .s_axis_a_tready(in_a3_ready),
        .s_axis_a_tdata(in_a3),
        .s_axis_b_tvalid(in_b3_valid),
        .s_axis_b_tready(in_b3_ready),
        .s_axis_b_tdata(in_b3),
        .m_axis_result_tvalid(out3_valid),
        .m_axis_result_tready(result_3_ready),
        .m_axis_result_tdata(out3)
    );
     
    multiplier_floating_point mult4 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a4_valid),
        .s_axis_a_tready(in_a4_ready),
        .s_axis_a_tdata(in_a4),
        .s_axis_b_tvalid(in_b4_valid),
        .s_axis_b_tready(in_b4_ready),
        .s_axis_b_tdata(in_b4),
        .m_axis_result_tvalid(out4_valid),
        .m_axis_result_tready(result_4_ready),
        .m_axis_result_tdata(out4)
    );
     
    multiplier_floating_point mult5 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a5_valid),
        .s_axis_a_tready(in_a5_ready),
        .s_axis_a_tdata(in_a5),
        .s_axis_b_tvalid(in_b5_valid),
        .s_axis_b_tready(in_b5_ready),
        .s_axis_b_tdata(in_b5),
        .m_axis_result_tvalid(out5_valid),
        .m_axis_result_tready(result_5_ready),
        .m_axis_result_tdata(out5)
    );
     
    multiplier_floating_point mult6 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a6_valid),
        .s_axis_a_tready(in_a6_ready),
        .s_axis_a_tdata(in_a6),
        .s_axis_b_tvalid(in_b6_valid),
        .s_axis_b_tready(in_b6_ready),
        .s_axis_b_tdata(in_b6),
        .m_axis_result_tvalid(out6_valid),
        .m_axis_result_tready(result_6_ready),
        .m_axis_result_tdata(out6)
    );
     
    multiplier_floating_point mult7 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a7_valid),
        .s_axis_a_tready(in_a7_ready),
        .s_axis_a_tdata(in_a7),
        .s_axis_b_tvalid(in_b7_valid),
        .s_axis_b_tready(in_b7_ready),
        .s_axis_b_tdata(in_b7),
        .m_axis_result_tvalid(out7_valid),
        .m_axis_result_tready(result_7_ready),
        .m_axis_result_tdata(out7)
    );
     
    multiplier_floating_point mult8 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a8_valid),
        .s_axis_a_tready(in_a8_ready),
        .s_axis_a_tdata(in_a8),
        .s_axis_b_tvalid(in_b8_valid),
        .s_axis_b_tready(in_b8_ready),
        .s_axis_b_tdata(in_b8),
        .m_axis_result_tvalid(out8_valid),
        .m_axis_result_tready(result_8_ready),
        .m_axis_result_tdata(out8)
    );
     
    multiplier_floating_point mult9 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a9_valid),
        .s_axis_a_tready(in_a9_ready),
        .s_axis_a_tdata(in_a9),
        .s_axis_b_tvalid(in_b9_valid),
        .s_axis_b_tready(in_b9_ready),
        .s_axis_b_tdata(in_b9),
        .m_axis_result_tvalid(out9_valid),
        .m_axis_result_tready(result_9_ready),
        .m_axis_result_tdata(out9)
    );
     
    multiplier_floating_point mult10 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a10_valid),
        .s_axis_a_tready(in_a10_ready),
        .s_axis_a_tdata(in_a10),
        .s_axis_b_tvalid(in_b10_valid),
        .s_axis_b_tready(in_b10_ready),
        .s_axis_b_tdata(in_b10),
        .m_axis_result_tvalid(out10_valid),
        .m_axis_result_tready(result_10_ready),
        .m_axis_result_tdata(out10)
    );
     
    multiplier_floating_point mult11 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a11_valid),
        .s_axis_a_tready(in_a11_ready),
        .s_axis_a_tdata(in_a11),
        .s_axis_b_tvalid(in_b11_valid),
        .s_axis_b_tready(in_b11_ready),
        .s_axis_b_tdata(in_b11),
        .m_axis_result_tvalid(out11_valid),
        .m_axis_result_tready(result_11_ready),
        .m_axis_result_tdata(out11)
    );
     
    multiplier_floating_point mult12 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a12_valid),
        .s_axis_a_tready(in_a12_ready),
        .s_axis_a_tdata(in_a12),
        .s_axis_b_tvalid(in_b12_valid),
        .s_axis_b_tready(in_b12_ready),
        .s_axis_b_tdata(in_b12),
        .m_axis_result_tvalid(out12_valid),
        .m_axis_result_tready(result_12_ready),
        .m_axis_result_tdata(out12)
    );
     
    multiplier_floating_point mult13 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a13_valid),
        .s_axis_a_tready(in_a13_ready),
        .s_axis_a_tdata(in_a13),
        .s_axis_b_tvalid(in_b13_valid),
        .s_axis_b_tready(in_b13_ready),
        .s_axis_b_tdata(in_b13),
        .m_axis_result_tvalid(out13_valid),
        .m_axis_result_tready(result_13_ready),
        .m_axis_result_tdata(out13)
    );
     
    multiplier_floating_point mult14 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a14_valid),
        .s_axis_a_tready(in_a14_ready),
        .s_axis_a_tdata(in_a14),
        .s_axis_b_tvalid(in_b14_valid),
        .s_axis_b_tready(in_b14_ready),
        .s_axis_b_tdata(in_b14),
        .m_axis_result_tvalid(out14_valid),
        .m_axis_result_tready(result_14_ready),
        .m_axis_result_tdata(out14)
    );
     
    multiplier_floating_point mult15 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a15_valid),
        .s_axis_a_tready(in_a15_ready),
        .s_axis_a_tdata(in_a15),
        .s_axis_b_tvalid(in_b15_valid),
        .s_axis_b_tready(in_b15_ready),
        .s_axis_b_tdata(in_b15),
        .m_axis_result_tvalid(out15_valid),
        .m_axis_result_tready(result_15_ready),
        .m_axis_result_tdata(out15)
    );
     
    multiplier_floating_point mult16 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a16_valid),
        .s_axis_a_tready(in_a16_ready),
        .s_axis_a_tdata(in_a16),
        .s_axis_b_tvalid(in_b16_valid),
        .s_axis_b_tready(in_b16_ready),
        .s_axis_b_tdata(in_b16),
        .m_axis_result_tvalid(out16_valid),
        .m_axis_result_tready(result_16_ready),
        .m_axis_result_tdata(out16)
    );
     
    multiplier_floating_point mult17 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a17_valid),
        .s_axis_a_tready(in_a17_ready),
        .s_axis_a_tdata(in_a17),
        .s_axis_b_tvalid(in_b17_valid),
        .s_axis_b_tready(in_b17_ready),
        .s_axis_b_tdata(in_b17),
        .m_axis_result_tvalid(out17_valid),
        .m_axis_result_tready(result_17_ready),
        .m_axis_result_tdata(out17)
    );
     
    multiplier_floating_point mult18 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a18_valid),
        .s_axis_a_tready(in_a18_ready),
        .s_axis_a_tdata(in_a18),
        .s_axis_b_tvalid(in_b18_valid),
        .s_axis_b_tready(in_b18_ready),
        .s_axis_b_tdata(in_b18),
        .m_axis_result_tvalid(out18_valid),
        .m_axis_result_tready(result_18_ready),
        .m_axis_result_tdata(out18)
    );
     
    multiplier_floating_point mult19 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a19_valid),
        .s_axis_a_tready(in_a19_ready),
        .s_axis_a_tdata(in_a19),
        .s_axis_b_tvalid(in_b19_valid),
        .s_axis_b_tready(in_b19_ready),
        .s_axis_b_tdata(in_b19),
        .m_axis_result_tvalid(out19_valid),
        .m_axis_result_tready(result_19_ready),
        .m_axis_result_tdata(out19)
    );
     
    multiplier_floating_point mult20 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a20_valid),
        .s_axis_a_tready(in_a20_ready),
        .s_axis_a_tdata(in_a20),
        .s_axis_b_tvalid(in_b20_valid),
        .s_axis_b_tready(in_b20_ready),
        .s_axis_b_tdata(in_b20),
        .m_axis_result_tvalid(out20_valid),
        .m_axis_result_tready(result_20_ready),
        .m_axis_result_tdata(out20)
    );
     
    multiplier_floating_point mult21 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a21_valid),
        .s_axis_a_tready(in_a21_ready),
        .s_axis_a_tdata(in_a21),
        .s_axis_b_tvalid(in_b21_valid),
        .s_axis_b_tready(in_b21_ready),
        .s_axis_b_tdata(in_b21),
        .m_axis_result_tvalid(out21_valid),
        .m_axis_result_tready(result_21_ready),
        .m_axis_result_tdata(out21)
    );
     
    multiplier_floating_point mult22 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a22_valid),
        .s_axis_a_tready(in_a22_ready),
        .s_axis_a_tdata(in_a22),
        .s_axis_b_tvalid(in_b22_valid),
        .s_axis_b_tready(in_b22_ready),
        .s_axis_b_tdata(in_b22),
        .m_axis_result_tvalid(out22_valid),
        .m_axis_result_tready(result_22_ready),
        .m_axis_result_tdata(out22)
    );
     
    multiplier_floating_point mult23 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a23_valid),
        .s_axis_a_tready(in_a23_ready),
        .s_axis_a_tdata(in_a23),
        .s_axis_b_tvalid(in_b23_valid),
        .s_axis_b_tready(in_b23_ready),
        .s_axis_b_tdata(in_b23),
        .m_axis_result_tvalid(out23_valid),
        .m_axis_result_tready(result_23_ready),
        .m_axis_result_tdata(out23)
    );
     
    multiplier_floating_point mult24 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a24_valid),
        .s_axis_a_tready(in_a24_ready),
        .s_axis_a_tdata(in_a24),
        .s_axis_b_tvalid(in_b24_valid),
        .s_axis_b_tready(in_b24_ready),
        .s_axis_b_tdata(in_b24),
        .m_axis_result_tvalid(out24_valid),
        .m_axis_result_tready(result_24_ready),
        .m_axis_result_tdata(out24)
    );
     
    multiplier_floating_point mult25 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a25_valid),
        .s_axis_a_tready(in_a25_ready),
        .s_axis_a_tdata(in_a25),
        .s_axis_b_tvalid(in_b25_valid),
        .s_axis_b_tready(in_b25_ready),
        .s_axis_b_tdata(in_b25),
        .m_axis_result_tvalid(out25_valid),
        .m_axis_result_tready(result_25_ready),
        .m_axis_result_tdata(out25)
    );
     
    multiplier_floating_point mult26 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a26_valid),
        .s_axis_a_tready(in_a26_ready),
        .s_axis_a_tdata(in_a26),
        .s_axis_b_tvalid(in_b26_valid),
        .s_axis_b_tready(in_b26_ready),
        .s_axis_b_tdata(in_b26),
        .m_axis_result_tvalid(out26_valid),
        .m_axis_result_tready(result_26_ready),
        .m_axis_result_tdata(out26)
    );
     
    multiplier_floating_point mult27 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a27_valid),
        .s_axis_a_tready(in_a27_ready),
        .s_axis_a_tdata(in_a27),
        .s_axis_b_tvalid(in_b27_valid),
        .s_axis_b_tready(in_b27_ready),
        .s_axis_b_tdata(in_b27),
        .m_axis_result_tvalid(out27_valid),
        .m_axis_result_tready(result_27_ready),
        .m_axis_result_tdata(out27)
    );
     
    multiplier_floating_point mult28 (
        .aclk(clk),
        .aresetn(!rst),
        .s_axis_a_tvalid(in_a28_valid),
        .s_axis_a_tready(in_a28_ready),
        .s_axis_a_tdata(in_a28),
        .s_axis_b_tvalid(in_b28_valid),
        .s_axis_b_tready(in_b28_ready),
        .s_axis_b_tdata(in_b28),
        .m_axis_result_tvalid(out28_valid),
        .m_axis_result_tready(result_28_ready),
        .m_axis_result_tdata(out28)
    );

endmodule
