`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2018 12:41:43 AM
// Design Name: 
// Module Name: average_memories
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


module average_memories(
clk, clr, num, start_a, out_valid,
out_a1, out_a2, out_a3, out_a4, out_a5, out_a6, out_a7, 
out_a8, out_a9, out_a10, out_a11, out_a12, out_a13, out_a14, 
out_a15, out_a16, out_a17, out_a18, out_a19, out_a20, out_a21, 
out_a22, out_a23, out_a24, out_a25, out_a26, out_a27, out_a28,
mean, stdev
);

    input clk, clr, start_a;
    input [3:0] num;
   
    output out_valid;
    output [31:0] out_a1, out_a2, out_a3, out_a4, out_a5, out_a6, out_a7;
    output [31:0] out_a8, out_a9, out_a10, out_a11, out_a12, out_a13, out_a14;
    output [31:0] out_a15, out_a16, out_a17, out_a18, out_a19, out_a20, out_a21;
    output [31:0] out_a22, out_a23, out_a24, out_a25, out_a26, out_a27, out_a28;
    
    output [31:0] mean, stdev;
    
    wire valid_a_0, valid_a_1, valid_a_2, valid_a_3, valid_a_4, valid_a_5, valid_a_6, valid_a_7, valid_a_8, valid_a_9;
    
    wire [31:0] out_a1_0, out_a2_0, out_a3_0, out_a4_0, out_a5_0, out_a6_0, out_a7_0;
    wire [31:0] out_a8_0, out_a9_0, out_a10_0, out_a11_0, out_a12_0, out_a13_0, out_a14_0;
    wire [31:0] out_a15_0, out_a16_0, out_a17_0, out_a18_0, out_a19_0, out_a20_0, out_a21_0;
    wire [31:0] out_a22_0, out_a23_0, out_a24_0, out_a25_0, out_a26_0, out_a27_0, out_a28_0;
    
    wire [31:0] out_a1_1, out_a2_1, out_a3_1, out_a4_1, out_a5_1, out_a6_1, out_a7_1;
    wire [31:0] out_a8_1, out_a9_1, out_a10_1, out_a11_1, out_a12_1, out_a13_1, out_a14_1;
    wire [31:0] out_a15_1, out_a16_1, out_a17_1, out_a18_1, out_a19_1, out_a20_1, out_a21_1;
    wire [31:0] out_a22_1, out_a23_1, out_a24_1, out_a25_1, out_a26_1, out_a27_1, out_a28_1;
    
    wire [31:0] out_a1_2, out_a2_2, out_a3_2, out_a4_2, out_a5_2, out_a6_2, out_a7_2;
    wire [31:0] out_a8_2, out_a9_2, out_a10_2, out_a11_2, out_a12_2, out_a13_2, out_a14_2;
    wire [31:0] out_a15_2, out_a16_2, out_a17_2, out_a18_2, out_a19_2, out_a20_2, out_a21_2;
    wire [31:0] out_a22_2, out_a23_2, out_a24_2, out_a25_2, out_a26_2, out_a27_2, out_a28_2;
    
    wire [31:0] out_a1_3, out_a2_3, out_a3_3, out_a4_3, out_a5_3, out_a6_3, out_a7_3;
    wire [31:0] out_a8_3, out_a9_3, out_a10_3, out_a11_3, out_a12_3, out_a13_3, out_a14_3;
    wire [31:0] out_a15_3, out_a16_3, out_a17_3, out_a18_3, out_a19_3, out_a20_3, out_a21_3;
    wire [31:0] out_a22_3, out_a23_3, out_a24_3, out_a25_3, out_a26_3, out_a27_3, out_a28_3;
    
    wire [31:0] out_a1_4, out_a2_4, out_a3_4, out_a4_4, out_a5_4, out_a6_4, out_a7_4;
    wire [31:0] out_a8_4, out_a9_4, out_a10_4, out_a11_4, out_a12_4, out_a13_4, out_a14_4;
    wire [31:0] out_a15_4, out_a16_4, out_a17_4, out_a18_4, out_a19_4, out_a20_4, out_a21_4;
    wire [31:0] out_a22_4, out_a23_4, out_a24_4, out_a25_4, out_a26_4, out_a27_4, out_a28_4;
    
    wire [31:0] out_a1_5, out_a2_5, out_a3_5, out_a4_5, out_a5_5, out_a6_5, out_a7_5;
    wire [31:0] out_a8_5, out_a9_5, out_a10_5, out_a11_5, out_a12_5, out_a13_5, out_a14_5;
    wire [31:0] out_a15_5, out_a16_5, out_a17_5, out_a18_5, out_a19_5, out_a20_5, out_a21_5;
    wire [31:0] out_a22_5, out_a23_5, out_a24_5, out_a25_5, out_a26_5, out_a27_5, out_a28_5;
    
    wire [31:0] out_a1_6, out_a2_6, out_a3_6, out_a4_6, out_a5_6, out_a6_6, out_a7_6;
    wire [31:0] out_a8_6, out_a9_6, out_a10_6, out_a11_6, out_a12_6, out_a13_6, out_a14_6;
    wire [31:0] out_a15_6, out_a16_6, out_a17_6, out_a18_6, out_a19_6, out_a20_6, out_a21_6;
    wire [31:0] out_a22_6, out_a23_6, out_a24_6, out_a25_6, out_a26_6, out_a27_6, out_a28_6;
    
    wire [31:0] out_a1_7, out_a2_7, out_a3_7, out_a4_7, out_a5_7, out_a6_7, out_a7_7;
    wire [31:0] out_a8_7, out_a9_7, out_a10_7, out_a11_7, out_a12_7, out_a13_7, out_a14_7;
    wire [31:0] out_a15_7, out_a16_7, out_a17_7, out_a18_7, out_a19_7, out_a20_7, out_a21_7;
    wire [31:0] out_a22_7, out_a23_7, out_a24_7, out_a25_7, out_a26_7, out_a27_7, out_a28_7;
    
    wire [31:0] out_a1_8, out_a2_8, out_a3_8, out_a4_8, out_a5_8, out_a6_8, out_a7_8;
    wire [31:0] out_a8_8, out_a9_8, out_a10_8, out_a11_8, out_a12_8, out_a13_8, out_a14_8;
    wire [31:0] out_a15_8, out_a16_8, out_a17_8, out_a18_8, out_a19_8, out_a20_8, out_a21_8;
    wire [31:0] out_a22_8, out_a23_8, out_a24_8, out_a25_8, out_a26_8, out_a27_8, out_a28_8;
    
    wire [31:0] out_a1_9, out_a2_9, out_a3_9, out_a4_9, out_a5_9, out_a6_9, out_a7_9;
    wire [31:0] out_a8_9, out_a9_9, out_a10_9, out_a11_9, out_a12_9, out_a13_9, out_a14_9;
    wire [31:0] out_a15_9, out_a16_9, out_a17_9, out_a18_9, out_a19_9, out_a20_9, out_a21_9;
    wire [31:0] out_a22_9, out_a23_9, out_a24_9, out_a25_9, out_a26_9, out_a27_9, out_a28_9;
    
    parallel_input_memories_y #(.NUM("0"), .NUM_ENTRIES(28), .ADDRESS_BIT_WIDTH(5)) mems_y_0(
        .clk(clk),
        .rst(clr),
        .start_a(start_a),
        .start_b(1'b0),
        .valid_a(valid_a_0),
        .out_a1(out_a1_0), .out_a2(out_a2_0), .out_a3(out_a3_0), .out_a4(out_a4_0), .out_a5(out_a5_0), .out_a6(out_a6_0), .out_a7(out_a7_0),
        .out_a8(out_a8_0), .out_a9(out_a9_0), .out_a10(out_a10_0), .out_a11(out_a11_0), .out_a12(out_a12_0), .out_a13(out_a13_0), .out_a14(out_a14_0),
        .out_a15(out_a15_0), .out_a16(out_a16_0), .out_a17(out_a17_0), .out_a18(out_a18_0), .out_a19(out_a19_0), .out_a20(out_a20_0), .out_a21(out_a21_0),
        .out_a22(out_a22_0), .out_a23(out_a23_0), .out_a24(out_a24_0), .out_a25(out_a25_0), .out_a26(out_a26_0), .out_a27(out_a27_0), .out_a28(out_a28_0)
    );
    
    parallel_input_memories_y #(.NUM("1"), .NUM_ENTRIES(28), .ADDRESS_BIT_WIDTH(5)) mems_y_1(
        .clk(clk),
        .rst(clr),
        .start_a(start_a),
        .start_b(1'b0),
        .valid_a(valid_a_1),
        .out_a1(out_a1_1), .out_a2(out_a2_1), .out_a3(out_a3_1), .out_a4(out_a4_1), .out_a5(out_a5_1), .out_a6(out_a6_1), .out_a7(out_a7_1),
        .out_a8(out_a8_1), .out_a9(out_a9_1), .out_a10(out_a10_1), .out_a11(out_a11_1), .out_a12(out_a12_1), .out_a13(out_a13_1), .out_a14(out_a14_1),
        .out_a15(out_a15_1), .out_a16(out_a16_1), .out_a17(out_a17_1), .out_a18(out_a18_1), .out_a19(out_a19_1), .out_a20(out_a20_1), .out_a21(out_a21_1),
        .out_a22(out_a22_1), .out_a23(out_a23_1), .out_a24(out_a24_1), .out_a25(out_a25_1), .out_a26(out_a26_1), .out_a27(out_a27_1), .out_a28(out_a28_1)
    );
    
    parallel_input_memories_y #(.NUM("2"), .NUM_ENTRIES(28), .ADDRESS_BIT_WIDTH(5)) mems_y_2(
        .clk(clk),
        .rst(clr),
        .start_a(start_a),
        .start_b(1'b0),
        .valid_a(valid_a_2),
        .out_a1(out_a1_2), .out_a2(out_a2_2), .out_a3(out_a3_2), .out_a4(out_a4_2), .out_a5(out_a5_2), .out_a6(out_a6_2), .out_a7(out_a7_2),
        .out_a8(out_a8_2), .out_a9(out_a9_2), .out_a10(out_a10_2), .out_a11(out_a11_2), .out_a12(out_a12_2), .out_a13(out_a13_2), .out_a14(out_a14_2),
        .out_a15(out_a15_2), .out_a16(out_a16_2), .out_a17(out_a17_2), .out_a18(out_a18_2), .out_a19(out_a19_2), .out_a20(out_a20_2), .out_a21(out_a21_2),
        .out_a22(out_a22_2), .out_a23(out_a23_2), .out_a24(out_a24_2), .out_a25(out_a25_2), .out_a26(out_a26_2), .out_a27(out_a27_2), .out_a28(out_a28_2)
    );
    
    parallel_input_memories_y #(.NUM("3"), .NUM_ENTRIES(28), .ADDRESS_BIT_WIDTH(5)) mems_y_3(
        .clk(clk),
        .rst(clr),
        .start_a(start_a),
        .start_b(1'b0),
        .valid_a(valid_a_3),
        .out_a1(out_a1_3), .out_a2(out_a2_3), .out_a3(out_a3_3), .out_a4(out_a4_3), .out_a5(out_a5_3), .out_a6(out_a6_3), .out_a7(out_a7_3),
        .out_a8(out_a8_3), .out_a9(out_a9_3), .out_a10(out_a10_3), .out_a11(out_a11_3), .out_a12(out_a12_3), .out_a13(out_a13_3), .out_a14(out_a14_3),
        .out_a15(out_a15_3), .out_a16(out_a16_3), .out_a17(out_a17_3), .out_a18(out_a18_3), .out_a19(out_a19_3), .out_a20(out_a20_3), .out_a21(out_a21_3),
        .out_a22(out_a22_3), .out_a23(out_a23_3), .out_a24(out_a24_3), .out_a25(out_a25_3), .out_a26(out_a26_3), .out_a27(out_a27_3), .out_a28(out_a28_3)
    );
    
    parallel_input_memories_y #(.NUM("4"), .NUM_ENTRIES(28), .ADDRESS_BIT_WIDTH(5)) mems_y_4(
        .clk(clk),
        .rst(clr),
        .start_a(start_a),
        .start_b(1'b0),
        .valid_a(valid_a_4),
        .out_a1(out_a1_4), .out_a2(out_a2_4), .out_a3(out_a3_4), .out_a4(out_a4_4), .out_a5(out_a5_4), .out_a6(out_a6_4), .out_a7(out_a7_4),
        .out_a8(out_a8_4), .out_a9(out_a9_4), .out_a10(out_a10_4), .out_a11(out_a11_4), .out_a12(out_a12_4), .out_a13(out_a13_4), .out_a14(out_a14_4),
        .out_a15(out_a15_4), .out_a16(out_a16_4), .out_a17(out_a17_4), .out_a18(out_a18_4), .out_a19(out_a19_4), .out_a20(out_a20_4), .out_a21(out_a21_4),
        .out_a22(out_a22_4), .out_a23(out_a23_4), .out_a24(out_a24_4), .out_a25(out_a25_4), .out_a26(out_a26_4), .out_a27(out_a27_4), .out_a28(out_a28_4)
    );
    
    parallel_input_memories_y #(.NUM("5"), .NUM_ENTRIES(28), .ADDRESS_BIT_WIDTH(5)) mems_y_5(
        .clk(clk),
        .rst(clr),
        .start_a(start_a),
        .start_b(1'b0),
        .valid_a(valid_a_5),
        .out_a1(out_a1_5), .out_a2(out_a2_5), .out_a3(out_a3_5), .out_a4(out_a4_5), .out_a5(out_a5_5), .out_a6(out_a6_5), .out_a7(out_a7_5),
        .out_a8(out_a8_5), .out_a9(out_a9_5), .out_a10(out_a10_5), .out_a11(out_a11_5), .out_a12(out_a12_5), .out_a13(out_a13_5), .out_a14(out_a14_5),
        .out_a15(out_a15_5), .out_a16(out_a16_5), .out_a17(out_a17_5), .out_a18(out_a18_5), .out_a19(out_a19_5), .out_a20(out_a20_5), .out_a21(out_a21_5),
        .out_a22(out_a22_5), .out_a23(out_a23_5), .out_a24(out_a24_5), .out_a25(out_a25_5), .out_a26(out_a26_5), .out_a27(out_a27_5), .out_a28(out_a28_5)
    );
    
    parallel_input_memories_y #(.NUM("6"), .NUM_ENTRIES(28), .ADDRESS_BIT_WIDTH(5)) mems_y_6(
        .clk(clk),
        .rst(clr),
        .start_a(start_a),
        .start_b(1'b0),
        .valid_a(valid_a_6),
        .out_a1(out_a1_6), .out_a2(out_a2_6), .out_a3(out_a3_6), .out_a4(out_a4_6), .out_a5(out_a5_6), .out_a6(out_a6_6), .out_a7(out_a7_6),
        .out_a8(out_a8_6), .out_a9(out_a9_6), .out_a10(out_a10_6), .out_a11(out_a11_6), .out_a12(out_a12_6), .out_a13(out_a13_6), .out_a14(out_a14_6),
        .out_a15(out_a15_6), .out_a16(out_a16_6), .out_a17(out_a17_6), .out_a18(out_a18_6), .out_a19(out_a19_6), .out_a20(out_a20_6), .out_a21(out_a21_6),
        .out_a22(out_a22_6), .out_a23(out_a23_6), .out_a24(out_a24_6), .out_a25(out_a25_6), .out_a26(out_a26_6), .out_a27(out_a27_6), .out_a28(out_a28_6)
    );
    
    parallel_input_memories_y #(.NUM("7"), .NUM_ENTRIES(28), .ADDRESS_BIT_WIDTH(5)) mems_y_7(
        .clk(clk),
        .rst(clr),
        .start_a(start_a),
        .start_b(1'b0),
        .valid_a(valid_a_7),
        .out_a1(out_a1_7), .out_a2(out_a2_7), .out_a3(out_a3_7), .out_a4(out_a4_7), .out_a5(out_a5_7), .out_a6(out_a6_7), .out_a7(out_a7_7),
        .out_a8(out_a8_7), .out_a9(out_a9_7), .out_a10(out_a10_7), .out_a11(out_a11_7), .out_a12(out_a12_7), .out_a13(out_a13_7), .out_a14(out_a14_7),
        .out_a15(out_a15_7), .out_a16(out_a16_7), .out_a17(out_a17_7), .out_a18(out_a18_7), .out_a19(out_a19_7), .out_a20(out_a20_7), .out_a21(out_a21_7),
        .out_a22(out_a22_7), .out_a23(out_a23_7), .out_a24(out_a24_7), .out_a25(out_a25_7), .out_a26(out_a26_7), .out_a27(out_a27_7), .out_a28(out_a28_7)
    );
    
    parallel_input_memories_y #(.NUM("8"), .NUM_ENTRIES(28), .ADDRESS_BIT_WIDTH(5)) mems_y_8(
        .clk(clk),
        .rst(clr),
        .start_a(start_a),
        .start_b(1'b0),
        .valid_a(valid_a_8),
        .out_a1(out_a1_8), .out_a2(out_a2_8), .out_a3(out_a3_8), .out_a4(out_a4_8), .out_a5(out_a5_8), .out_a6(out_a6_8), .out_a7(out_a7_8),
        .out_a8(out_a8_8), .out_a9(out_a9_8), .out_a10(out_a10_8), .out_a11(out_a11_8), .out_a12(out_a12_8), .out_a13(out_a13_8), .out_a14(out_a14_8),
        .out_a15(out_a15_8), .out_a16(out_a16_8), .out_a17(out_a17_8), .out_a18(out_a18_8), .out_a19(out_a19_8), .out_a20(out_a20_8), .out_a21(out_a21_8),
        .out_a22(out_a22_8), .out_a23(out_a23_8), .out_a24(out_a24_8), .out_a25(out_a25_8), .out_a26(out_a26_8), .out_a27(out_a27_8), .out_a28(out_a28_8)
    );
    
    parallel_input_memories_y #(.NUM("9"), .NUM_ENTRIES(28), .ADDRESS_BIT_WIDTH(5)) mems_y_9(
        .clk(clk),
        .rst(clr),
        .start_a(start_a),
        .start_b(1'b0),
        .valid_a(valid_a_9),
        .out_a1(out_a1_9), .out_a2(out_a2_9), .out_a3(out_a3_9), .out_a4(out_a4_9), .out_a5(out_a5_9), .out_a6(out_a6_9), .out_a7(out_a7_9),
        .out_a8(out_a8_9), .out_a9(out_a9_9), .out_a10(out_a10_9), .out_a11(out_a11_9), .out_a12(out_a12_9), .out_a13(out_a13_9), .out_a14(out_a14_9),
        .out_a15(out_a15_9), .out_a16(out_a16_9), .out_a17(out_a17_9), .out_a18(out_a18_9), .out_a19(out_a19_9), .out_a20(out_a20_9), .out_a21(out_a21_9),
        .out_a22(out_a22_9), .out_a23(out_a23_9), .out_a24(out_a24_9), .out_a25(out_a25_9), .out_a26(out_a26_9), .out_a27(out_a27_9), .out_a28(out_a28_9)
    );
    
    average_mux mux(
        .sel(num),
        .in1_0(out_a1_0), .in2_0(out_a2_0), .in3_0(out_a3_0), .in4_0(out_a4_0), .in5_0(out_a5_0), .in6_0(out_a6_0), .in7_0(out_a7_0),
        .in8_0(out_a8_0), .in9_0(out_a9_0), .in10_0(out_a10_0), .in11_0(out_a11_0), .in12_0(out_a12_0), .in13_0(out_a13_0), .in14_0(out_a14_0),
        .in15_0(out_a15_0), .in16_0(out_a16_0), .in17_0(out_a17_0), .in18_0(out_a18_0), .in19_0(out_a19_0), .in20_0(out_a20_0), .in21_0(out_a21_0),
        .in22_0(out_a22_0), .in23_0(out_a23_0), .in24_0(out_a24_0), .in25_0(out_a25_0), .in26_0(out_a26_0), .in27_0(out_a27_0), .in28_0(out_a28_0),
        .in1_1(out_a1_1), .in2_1(out_a2_1), .in3_1(out_a3_1), .in4_1(out_a4_1), .in5_1(out_a5_1), .in6_1(out_a6_1), .in7_1(out_a7_1),
        .in8_1(out_a8_1), .in9_1(out_a9_1), .in10_1(out_a10_1), .in11_1(out_a11_1), .in12_1(out_a12_1), .in13_1(out_a13_1), .in14_1(out_a14_1),
        .in15_1(out_a15_1), .in16_1(out_a16_1), .in17_1(out_a17_1), .in18_1(out_a18_1), .in19_1(out_a19_1), .in20_1(out_a20_1), .in21_1(out_a21_1),
        .in22_1(out_a22_1), .in23_1(out_a23_1), .in24_1(out_a24_1), .in25_1(out_a25_1), .in26_1(out_a26_1), .in27_1(out_a27_1), .in28_1(out_a28_1),
        .in1_2(out_a1_2), .in2_2(out_a2_2), .in3_2(out_a3_2), .in4_2(out_a4_2), .in5_2(out_a5_2), .in6_2(out_a6_2), .in7_2(out_a7_2),
        .in8_2(out_a8_2), .in9_2(out_a9_2), .in10_2(out_a10_2), .in11_2(out_a11_2), .in12_2(out_a12_2), .in13_2(out_a13_2), .in14_2(out_a14_2),
        .in15_2(out_a15_2), .in16_2(out_a16_2), .in17_2(out_a17_2), .in18_2(out_a18_2), .in19_2(out_a19_2), .in20_2(out_a20_2), .in21_2(out_a21_2),
        .in22_2(out_a22_2), .in23_2(out_a23_2), .in24_2(out_a24_2), .in25_2(out_a25_2), .in26_2(out_a26_2), .in27_2(out_a27_2), .in28_2(out_a28_2),
        .in1_3(out_a1_3), .in2_3(out_a2_3), .in3_3(out_a3_3), .in4_3(out_a4_3), .in5_3(out_a5_3), .in6_3(out_a6_3), .in7_3(out_a7_3),
        .in8_3(out_a8_3), .in9_3(out_a9_3), .in10_3(out_a10_3), .in11_3(out_a11_3), .in12_3(out_a12_3), .in13_3(out_a13_3), .in14_3(out_a14_3),
        .in15_3(out_a15_3), .in16_3(out_a16_3), .in17_3(out_a17_3), .in18_3(out_a18_3), .in19_3(out_a19_3), .in20_3(out_a20_3), .in21_3(out_a21_3),
        .in22_3(out_a22_3), .in23_3(out_a23_3), .in24_3(out_a24_3), .in25_3(out_a25_3), .in26_3(out_a26_3), .in27_3(out_a27_3), .in28_3(out_a28_3),
        .in1_4(out_a1_4), .in2_4(out_a2_4), .in3_4(out_a3_4), .in4_4(out_a4_4), .in5_4(out_a5_4), .in6_4(out_a6_4), .in7_4(out_a7_4),
        .in8_4(out_a8_4), .in9_4(out_a9_4), .in10_4(out_a10_4), .in11_4(out_a11_4), .in12_4(out_a12_4), .in13_4(out_a13_4), .in14_4(out_a14_4),
        .in15_4(out_a15_4), .in16_4(out_a16_4), .in17_4(out_a17_4), .in18_4(out_a18_4), .in19_4(out_a19_4), .in20_4(out_a20_4), .in21_4(out_a21_4),
        .in22_4(out_a22_4), .in23_4(out_a23_4), .in24_4(out_a24_4), .in25_4(out_a25_4), .in26_4(out_a26_4), .in27_4(out_a27_4), .in28_4(out_a28_4),
        .in1_5(out_a1_5), .in2_5(out_a2_5), .in3_5(out_a3_5), .in4_5(out_a4_5), .in5_5(out_a5_5), .in6_5(out_a6_5), .in7_5(out_a7_5),
        .in8_5(out_a8_5), .in9_5(out_a9_5), .in10_5(out_a10_5), .in11_5(out_a11_5), .in12_5(out_a12_5), .in13_5(out_a13_5), .in14_5(out_a14_5),
        .in15_5(out_a15_5), .in16_5(out_a16_5), .in17_5(out_a17_5), .in18_5(out_a18_5), .in19_5(out_a19_5), .in20_5(out_a20_5), .in21_5(out_a21_5),
        .in22_5(out_a22_5), .in23_5(out_a23_5), .in24_5(out_a24_5), .in25_5(out_a25_5), .in26_5(out_a26_5), .in27_5(out_a27_5), .in28_5(out_a28_5),
        .in1_6(out_a1_6), .in2_6(out_a2_6), .in3_6(out_a3_6), .in4_6(out_a4_6), .in5_6(out_a5_6), .in6_6(out_a6_6), .in7_6(out_a7_6),
        .in8_6(out_a8_6), .in9_6(out_a9_6), .in10_6(out_a10_6), .in11_6(out_a11_6), .in12_6(out_a12_6), .in13_6(out_a13_6), .in14_6(out_a14_6),
        .in15_6(out_a15_6), .in16_6(out_a16_6), .in17_6(out_a17_6), .in18_6(out_a18_6), .in19_6(out_a19_6), .in20_6(out_a20_6), .in21_6(out_a21_6),
        .in22_6(out_a22_6), .in23_6(out_a23_6), .in24_6(out_a24_6), .in25_6(out_a25_6), .in26_6(out_a26_6), .in27_6(out_a27_6), .in28_6(out_a28_6),
        .in1_7(out_a1_7), .in2_7(out_a2_7), .in3_7(out_a3_7), .in4_7(out_a4_7), .in5_7(out_a5_7), .in6_7(out_a6_7), .in7_7(out_a7_7),
        .in8_7(out_a8_7), .in9_7(out_a9_7), .in10_7(out_a10_7), .in11_7(out_a11_7), .in12_7(out_a12_7), .in13_7(out_a13_7), .in14_7(out_a14_7),
        .in15_7(out_a15_7), .in16_7(out_a16_7), .in17_7(out_a17_7), .in18_7(out_a18_7), .in19_7(out_a19_7), .in20_7(out_a20_7), .in21_7(out_a21_7),
        .in22_7(out_a22_7), .in23_7(out_a23_7), .in24_7(out_a24_7), .in25_7(out_a25_7), .in26_7(out_a26_7), .in27_7(out_a27_7), .in28_7(out_a28_7),
        .in1_8(out_a1_8), .in2_8(out_a2_8), .in3_8(out_a3_8), .in4_8(out_a4_8), .in5_8(out_a5_8), .in6_8(out_a6_8), .in7_8(out_a7_8),
        .in8_8(out_a8_8), .in9_8(out_a9_8), .in10_8(out_a10_8), .in11_8(out_a11_8), .in12_8(out_a12_8), .in13_8(out_a13_8), .in14_8(out_a14_8),
        .in15_8(out_a15_8), .in16_8(out_a16_8), .in17_8(out_a17_8), .in18_8(out_a18_8), .in19_8(out_a19_8), .in20_8(out_a20_8), .in21_8(out_a21_8),
        .in22_8(out_a22_8), .in23_8(out_a23_8), .in24_8(out_a24_8), .in25_8(out_a25_8), .in26_8(out_a26_8), .in27_8(out_a27_8), .in28_8(out_a28_8),
        .in1_9(out_a1_9), .in2_9(out_a2_9), .in3_9(out_a3_9), .in4_9(out_a4_9), .in5_9(out_a5_9), .in6_9(out_a6_9), .in7_9(out_a7_9),
        .in8_9(out_a8_9), .in9_9(out_a9_9), .in10_9(out_a10_9), .in11_9(out_a11_9), .in12_9(out_a12_9), .in13_9(out_a13_9), .in14_9(out_a14_9),
        .in15_9(out_a15_9), .in16_9(out_a16_9), .in17_9(out_a17_9), .in18_9(out_a18_9), .in19_9(out_a19_9), .in20_9(out_a20_9), .in21_9(out_a21_9),
        .in22_9(out_a22_9), .in23_9(out_a23_9), .in24_9(out_a24_9), .in25_9(out_a25_9), .in26_9(out_a26_9), .in27_9(out_a27_9), .in28_9(out_a28_9),
        .in_valid_0(valid_a_0),
        .in_valid_1(valid_a_1),
        .in_valid_2(valid_a_2),
        .in_valid_3(valid_a_3),
        .in_valid_4(valid_a_4),
        .in_valid_5(valid_a_5),
        .in_valid_6(valid_a_6),
        .in_valid_7(valid_a_7),
        .in_valid_8(valid_a_8),
        .in_valid_9(valid_a_9),
        .out1(out_a1), .out2(out_a2), .out3(out_a3), .out4(out_a4), .out5(out_a5), .out6(out_a6), .out7(out_a7),
        .out8(out_a8), .out9(out_a9), .out10(out_a10), .out11(out_a11), .out12(out_a12), .out13(out_a13), .out14(out_a14),
        .out15(out_a15), .out16(out_a16), .out17(out_a17), .out18(out_a18), .out19(out_a19), .out20(out_a20), .out21(out_a21),
        .out22(out_a22), .out23(out_a23), .out24(out_a24), .out25(out_a25), .out26(out_a26), .out27(out_a27), .out28(out_a28),
        .out_valid(out_valid)
    );
    
    mean_stdev_mux m_s_mux(.sel(num), .mean(mean), .stdev(stdev));
    
endmodule
