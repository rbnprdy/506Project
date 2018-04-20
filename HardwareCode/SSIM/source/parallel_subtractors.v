`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2018 05:34:28 PM
// Design Name: 
// Module Name: parallel_subtractors
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


module parallel_subtractors(
clk, in_b, in_b_valid,
in_a1, in_a2, in_a3, in_a4, in_a5, in_a6, in_a7,
in_a8, in_a9, in_a10, in_a11, in_a12, in_a13, in_a14,
in_a15, in_a16, in_a17, in_a18, in_a19, in_a20, in_a21,
in_a22, in_a23, in_a24, in_a25, in_a26, in_a27, in_a28,
//
in_a1_valid, in_a2_valid, in_a3_valid, in_a4_valid, in_a5_valid, in_a6_valid, in_a7_valid,
in_a8_valid, in_a9_valid, in_a10_valid, in_a11_valid, in_a12_valid, in_a13_valid, in_a14_valid,
in_a15_valid, in_a16_valid, in_a17_valid, in_a18_valid, in_a19_valid, in_a20_valid, in_a21_valid,
in_a22_valid, in_a23_valid, in_a24_valid, in_a25_valid, in_a26_valid, in_a27_valid, in_a28_valid,
//
out1_ready, out2_ready, out3_ready, out4_ready, out5_ready, out6_ready, out7_ready,
out8_ready, out9_ready, out10_ready, out11_ready, out12_ready, out13_ready, out14_ready,
out15_ready, out16_ready, out17_ready, out18_ready, out19_ready, out20_ready, out21_ready,
out22_ready, out23_ready, out24_ready, out25_ready, out26_ready, out27_ready, out28_ready,
//
out1, out2, out3, out4, out5, out6, out7,
out8, out9, out10, out11, out12, out13, out14,
out15, out16, out17, out18, out19, out20, out21,
out22, out23, out24, out25, out26, out27, out28,
//
out1_valid, out2_valid, out3_valid, out4_valid, out5_valid, out6_valid, out7_valid,
out8_valid, out9_valid, out10_valid, out11_valid, out12_valid, out13_valid, out14_valid,
out15_valid, out16_valid, out17_valid, out18_valid, out19_valid, out20_valid, out21_valid,
out22_valid, out23_valid, out24_valid, out25_valid, out26_valid, out27_valid, out28_valid,
//
in_a1_ready, in_a2_ready, in_a3_ready, in_a4_ready, in_a5_ready, in_a6_ready, in_a7_ready,
in_a8_ready, in_a9_ready, in_a10_ready, in_a11_ready, in_a12_ready, in_a13_ready, in_a14_ready,
in_a15_ready, in_a16_ready, in_a17_ready, in_a18_ready, in_a19_ready, in_a20_ready, in_a21_ready,
in_a22_ready, in_a23_ready, in_a24_ready, in_a25_ready, in_a26_ready, in_a27_ready, in_a28_ready,
in_b_ready
);
    
    input clk;
    input [31:0] in_b;
    input in_b_valid;
    input [31:0] in_a1, in_a2, in_a3, in_a4, in_a5, in_a6, in_a7;
    input [31:0] in_a8, in_a9, in_a10, in_a11, in_a12, in_a13, in_a14;
    input [31:0] in_a15, in_a16, in_a17, in_a18, in_a19, in_a20, in_a21;
    input [31:0] in_a22, in_a23, in_a24, in_a25, in_a26, in_a27, in_a28;
    input in_a1_valid, in_a2_valid, in_a3_valid, in_a4_valid, in_a5_valid, in_a6_valid, in_a7_valid;
    input in_a8_valid, in_a9_valid, in_a10_valid, in_a11_valid, in_a12_valid, in_a13_valid, in_a14_valid;
    input in_a15_valid, in_a16_valid, in_a17_valid, in_a18_valid, in_a19_valid, in_a20_valid, in_a21_valid;
    input in_a22_valid, in_a23_valid, in_a24_valid, in_a25_valid, in_a26_valid, in_a27_valid, in_a28_valid;
    input out1_ready, out2_ready, out3_ready, out4_ready, out5_ready, out6_ready, out7_ready;
    input out8_ready, out9_ready, out10_ready, out11_ready, out12_ready, out13_ready, out14_ready;
    input out15_ready, out16_ready, out17_ready, out18_ready, out19_ready, out20_ready, out21_ready;
    input out22_ready, out23_ready, out24_ready, out25_ready, out26_ready, out27_ready, out28_ready;
    
    output [31:0] out1, out2, out3, out4, out5, out6, out7;
    output [31:0] out8, out9, out10, out11, out12, out13, out14;
    output [31:0] out15, out16, out17, out18, out19, out20, out21;
    output [31:0] out22, out23, out24, out25, out26, out27, out28;
    output out1_valid, out2_valid, out3_valid, out4_valid, out5_valid, out6_valid, out7_valid;
    output out8_valid, out9_valid, out10_valid, out11_valid, out12_valid, out13_valid, out14_valid;
    output out15_valid, out16_valid, out17_valid, out18_valid, out19_valid, out20_valid, out21_valid;
    output out22_valid, out23_valid, out24_valid, out25_valid, out26_valid, out27_valid, out28_valid;
    output in_a1_ready, in_a2_ready, in_a3_ready, in_a4_ready, in_a5_ready, in_a6_ready, in_a7_ready;
    output in_a8_ready, in_a9_ready, in_a10_ready, in_a11_ready, in_a12_ready, in_a13_ready, in_a14_ready;
    output in_a15_ready, in_a16_ready, in_a17_ready, in_a18_ready, in_a19_ready, in_a20_ready, in_a21_ready;
    output in_a22_ready, in_a23_ready, in_a24_ready, in_a25_ready, in_a26_ready, in_a27_ready, in_a28_ready;
    output in_b_ready;
    
    wire in_b1_ready, in_b2_ready, in_b3_ready, in_b4_ready, in_b5_ready, in_b6_ready, in_b7_ready;
    wire in_b8_ready, in_b9_ready, in_b10_ready, in_b11_ready, in_b12_ready, in_b13_ready, in_b14_ready;
    wire in_b15_ready, in_b16_ready, in_b17_ready, in_b18_ready, in_b19_ready, in_b20_ready, in_b21_ready;
    wire in_b22_ready, in_b23_ready, in_b24_ready, in_b25_ready, in_b26_ready, in_b27_ready, in_b28_ready;
    
    subtractor_floating_point sub1 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a1_valid),
        .s_axis_a_tready(in_a1_ready),
        .s_axis_a_tdata(in_a1),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b1_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out1_valid),
        .m_axis_result_tready(out1_ready),
        .m_axis_result_tdata(out1)
    );
     
    subtractor_floating_point sub2 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a2_valid),
        .s_axis_a_tready(in_a2_ready),
        .s_axis_a_tdata(in_a2),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b2_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out2_valid),
        .m_axis_result_tready(out2_ready),
        .m_axis_result_tdata(out2)
    );
     
    subtractor_floating_point sub3 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a3_valid),
        .s_axis_a_tready(in_a3_ready),
        .s_axis_a_tdata(in_a3),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b3_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out3_valid),
        .m_axis_result_tready(out3_ready),
        .m_axis_result_tdata(out3)
    );
     
    subtractor_floating_point sub4 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a4_valid),
        .s_axis_a_tready(in_a4_ready),
        .s_axis_a_tdata(in_a4),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b4_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out4_valid),
        .m_axis_result_tready(out4_ready),
        .m_axis_result_tdata(out4)
    );
     
    subtractor_floating_point sub5 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a5_valid),
        .s_axis_a_tready(in_a5_ready),
        .s_axis_a_tdata(in_a5),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b5_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out5_valid),
        .m_axis_result_tready(out5_ready),
        .m_axis_result_tdata(out5)
    );
     
    subtractor_floating_point sub6 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a6_valid),
        .s_axis_a_tready(in_a6_ready),
        .s_axis_a_tdata(in_a6),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b6_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out6_valid),
        .m_axis_result_tready(out6_ready),
        .m_axis_result_tdata(out6)
    );
     
    subtractor_floating_point sub7 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a7_valid),
        .s_axis_a_tready(in_a7_ready),
        .s_axis_a_tdata(in_a7),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b7_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out7_valid),
        .m_axis_result_tready(out7_ready),
        .m_axis_result_tdata(out7)
    );
     
    subtractor_floating_point sub8 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a8_valid),
        .s_axis_a_tready(in_a8_ready),
        .s_axis_a_tdata(in_a8),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b8_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out8_valid),
        .m_axis_result_tready(out8_ready),
        .m_axis_result_tdata(out8)
    );
     
    subtractor_floating_point sub9 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a9_valid),
        .s_axis_a_tready(in_a9_ready),
        .s_axis_a_tdata(in_a9),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b9_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out9_valid),
        .m_axis_result_tready(out9_ready),
        .m_axis_result_tdata(out9)
    );
     
    subtractor_floating_point sub10 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a10_valid),
        .s_axis_a_tready(in_a10_ready),
        .s_axis_a_tdata(in_a10),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b10_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out10_valid),
        .m_axis_result_tready(out10_ready),
        .m_axis_result_tdata(out10)
    );
     
    subtractor_floating_point sub11 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a11_valid),
        .s_axis_a_tready(in_a11_ready),
        .s_axis_a_tdata(in_a11),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b11_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out11_valid),
        .m_axis_result_tready(out11_ready),
        .m_axis_result_tdata(out11)
    );
     
    subtractor_floating_point sub12 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a12_valid),
        .s_axis_a_tready(in_a12_ready),
        .s_axis_a_tdata(in_a12),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b12_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out12_valid),
        .m_axis_result_tready(out12_ready),
        .m_axis_result_tdata(out12)
    );
     
    subtractor_floating_point sub13 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a13_valid),
        .s_axis_a_tready(in_a13_ready),
        .s_axis_a_tdata(in_a13),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b13_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out13_valid),
        .m_axis_result_tready(out13_ready),
        .m_axis_result_tdata(out13)
    );
     
    subtractor_floating_point sub14 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a14_valid),
        .s_axis_a_tready(in_a14_ready),
        .s_axis_a_tdata(in_a14),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b14_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out14_valid),
        .m_axis_result_tready(out14_ready),
        .m_axis_result_tdata(out14)
    );
     
    subtractor_floating_point sub15 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a15_valid),
        .s_axis_a_tready(in_a15_ready),
        .s_axis_a_tdata(in_a15),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b15_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out15_valid),
        .m_axis_result_tready(out15_ready),
        .m_axis_result_tdata(out15)
    );
     
    subtractor_floating_point sub16 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a16_valid),
        .s_axis_a_tready(in_a16_ready),
        .s_axis_a_tdata(in_a16),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b16_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out16_valid),
        .m_axis_result_tready(out16_ready),
        .m_axis_result_tdata(out16)
    );
     
    subtractor_floating_point sub17 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a17_valid),
        .s_axis_a_tready(in_a17_ready),
        .s_axis_a_tdata(in_a17),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b17_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out17_valid),
        .m_axis_result_tready(out17_ready),
        .m_axis_result_tdata(out17)
    );
     
    subtractor_floating_point sub18 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a18_valid),
        .s_axis_a_tready(in_a18_ready),
        .s_axis_a_tdata(in_a18),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b18_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out18_valid),
        .m_axis_result_tready(out18_ready),
        .m_axis_result_tdata(out18)
    );
     
    subtractor_floating_point sub19 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a19_valid),
        .s_axis_a_tready(in_a19_ready),
        .s_axis_a_tdata(in_a19),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b19_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out19_valid),
        .m_axis_result_tready(out19_ready),
        .m_axis_result_tdata(out19)
    );
     
    subtractor_floating_point sub20 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a20_valid),
        .s_axis_a_tready(in_a20_ready),
        .s_axis_a_tdata(in_a20),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b20_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out20_valid),
        .m_axis_result_tready(out20_ready),
        .m_axis_result_tdata(out20)
    );
     
    subtractor_floating_point sub21 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a21_valid),
        .s_axis_a_tready(in_a21_ready),
        .s_axis_a_tdata(in_a21),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b21_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out21_valid),
        .m_axis_result_tready(out21_ready),
        .m_axis_result_tdata(out21)
    );
     
    subtractor_floating_point sub22 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a22_valid),
        .s_axis_a_tready(in_a22_ready),
        .s_axis_a_tdata(in_a22),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b22_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out22_valid),
        .m_axis_result_tready(out22_ready),
        .m_axis_result_tdata(out22)
    );
     
    subtractor_floating_point sub23 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a23_valid),
        .s_axis_a_tready(in_a23_ready),
        .s_axis_a_tdata(in_a23),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b23_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out23_valid),
        .m_axis_result_tready(out23_ready),
        .m_axis_result_tdata(out23)
    );
     
    subtractor_floating_point sub24 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a24_valid),
        .s_axis_a_tready(in_a24_ready),
        .s_axis_a_tdata(in_a24),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b24_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out24_valid),
        .m_axis_result_tready(out24_ready),
        .m_axis_result_tdata(out24)
    );
     
    subtractor_floating_point sub25 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a25_valid),
        .s_axis_a_tready(in_a25_ready),
        .s_axis_a_tdata(in_a25),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b25_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out25_valid),
        .m_axis_result_tready(out25_ready),
        .m_axis_result_tdata(out25)
    );
     
    subtractor_floating_point sub26 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a26_valid),
        .s_axis_a_tready(in_a26_ready),
        .s_axis_a_tdata(in_a26),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b26_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out26_valid),
        .m_axis_result_tready(out26_ready),
        .m_axis_result_tdata(out26)
    );
     
    subtractor_floating_point sub27 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a27_valid),
        .s_axis_a_tready(in_a27_ready),
        .s_axis_a_tdata(in_a27),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b27_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out27_valid),
        .m_axis_result_tready(out27_ready),
        .m_axis_result_tdata(out27)
    );
     
    subtractor_floating_point sub28 (
        .aclk(clk),
        .s_axis_a_tvalid(in_a28_valid),
        .s_axis_a_tready(in_a28_ready),
        .s_axis_a_tdata(in_a28),
        .s_axis_b_tvalid(in_b_valid),
        .s_axis_b_tready(in_b28_ready),
        .s_axis_b_tdata(in_b),
        .m_axis_result_tvalid(out28_valid),
        .m_axis_result_tready(out28_ready),
        .m_axis_result_tdata(out28)
    );
    
    and_gate a(
        .in1(in_b1_ready), .in2(in_b2_ready), .in3(in_b3_ready), .in4(in_b4_ready), .in5(in_b5_ready), .in6(in_b6_ready), .in7(in_b7_ready),
        .in8(in_b8_ready), .in9(in_b9_ready), .in10(in_b10_ready), .in11(in_b11_ready), .in12(in_b12_ready), .in13(in_b13_ready), .in14(in_b14_ready),
        .in15(in_b15_ready), .in16(in_b16_ready), .in17(in_b17_ready), .in18(in_b18_ready), .in19(in_b19_ready), .in20(in_b20_ready), .in21(in_b21_ready),
        .in22(in_b22_ready), .in23(in_b23_ready), .in24(in_b24_ready), .in25(in_b25_ready), .in26(in_b26_ready), .in27(in_b27_ready), .in28(in_b28_ready),
        .out(in_b_ready)  
    );

endmodule
