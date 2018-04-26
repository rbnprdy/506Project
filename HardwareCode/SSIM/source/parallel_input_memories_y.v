`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// parallel_input_memories_y.v
// Created by Ruben Purdy on 04/18/2018 10:39:56 PM
//////////////////////////////////////////////////////////////////////////////////

// This is for the average data, so it's 32 bits and should be each value subtracted by the mean.
module parallel_input_memories_y #(parameter NUM_ENTRIES = 28, ADDRESS_BIT_WIDTH = 5)(
clk, rst, start_a, start_b, valid_a, valid_b, 
out_a1, out_a2, out_a3, out_a4, out_a5, out_a6, out_a7, 
out_a8, out_a9, out_a10, out_a11, out_a12, out_a13, out_a14, 
out_a15, out_a16, out_a17, out_a18, out_a19, out_a20, out_a21, 
out_a22, out_a23, out_a24, out_a25, out_a26, out_a27, out_a28,
out_b1, out_b2, out_b3, out_b4, out_b5, out_b6, out_b7, 
out_b8, out_b9, out_b10, out_b11, out_b12, out_b13, out_b14, 
out_b15, out_b16, out_b17, out_b18, out_b19, out_b20, out_b21, 
out_b22, out_b23, out_b24, out_b25, out_b26, out_b27, out_b28
);

    input clk, rst, start_a, start_b;
   
    output valid_a, valid_b;
    output [31:0] out_a1, out_a2, out_a3, out_a4, out_a5, out_a6, out_a7;
    output [31:0] out_a8, out_a9, out_a10, out_a11, out_a12, out_a13, out_a14;
    output [31:0] out_a15, out_a16, out_a17, out_a18, out_a19, out_a20, out_a21;
    output [31:0] out_a22, out_a23, out_a24, out_a25, out_a26, out_a27, out_a28;    
    output [31:0] out_b1, out_b2, out_b3, out_b4, out_b5, out_b6, out_b7;
    output [31:0] out_b8, out_b9, out_b10, out_b11, out_b12, out_b13, out_b14;
    output [31:0] out_b15, out_b16, out_b17, out_b18, out_b19, out_b20, out_b21;
    output [31:0] out_b22, out_b23, out_b24, out_b25, out_b26, out_b27, out_b28;
    
    wire out_a1_valid, out_a2_valid, out_a3_valid, out_a4_valid, out_a5_valid, out_a6_valid, out_a7_valid;
    wire out_a8_valid, out_a9_valid, out_a10_valid, out_a11_valid, out_a12_valid, out_a13_valid, out_a14_valid;
    wire out_a15_valid, out_a16_valid, out_a17_valid, out_a18_valid, out_a19_valid, out_a20_valid, out_a21_valid;
    wire out_a22_valid, out_a23_valid, out_a24_valid, out_a25_valid, out_a26_valid, out_a27_valid, out_a28_valid;
    wire out_b1_valid, out_b2_valid, out_b3_valid, out_b4_valid, out_b5_valid, out_b6_valid, out_b7_valid;
    wire out_b8_valid, out_b9_valid, out_b10_valid, out_b11_valid, out_b12_valid, out_b13_valid, out_b14_valid;
    wire out_b15_valid, out_b16_valid, out_b17_valid, out_b18_valid, out_b19_valid, out_b20_valid, out_b21_valid;
    wire out_b22_valid, out_b23_valid, out_b24_valid, out_b25_valid, out_b26_valid, out_b27_valid, out_b28_valid;
    
    input_mem #(.FILE_NAME("row_1_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x1(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a1_valid),
        .valid_b(out_b1_valid),
        .out_a(out_a1),
        .out_b(out_b1)
    );    
   
    input_mem #(.FILE_NAME("row_2_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x2(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a2_valid),
        .valid_b(out_b2_valid),
        .out_a(out_a2),
        .out_b(out_b2)
    );    
    
    input_mem #(.FILE_NAME("row_3_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x3(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a3_valid),
        .valid_b(out_b3_valid),
        .out_a(out_a3),
        .out_b(out_b3)
    );    
    
    input_mem #(.FILE_NAME("row_4_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x4(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a4_valid),
        .valid_b(out_b4_valid),
        .out_a(out_a4),
        .out_b(out_b4)
    );
        
    input_mem #(.FILE_NAME("row_5_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x5(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .valid_a(out_a5_valid),
        .valid_b(out_b5_valid),
        .out_a(out_a5),
        .out_b(out_b5)
    );    
    
    input_mem #(.FILE_NAME("row_6_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x6(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a6_valid),
        .valid_b(out_b6_valid),
        .out_a(out_a6),
        .out_b(out_b6)
    );    
    
    input_mem #(.FILE_NAME("row_7_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x7(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a7_valid),
        .valid_b(out_b7_valid),
        .out_a(out_a7),
        .out_b(out_b7)
    );    
    
    input_mem #(.FILE_NAME("row_8_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x8(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a8_valid),
        .valid_b(out_b8_valid),
        .out_a(out_a8),
        .out_b(out_b8)
    );
    
        
    input_mem #(.FILE_NAME("row_9_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x9(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a9_valid),
        .valid_b(out_b9_valid),
        .out_a(out_a9),
        .out_b(out_b9)
    );    
    
    input_mem #(.FILE_NAME("row_10_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x10(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a10_valid),
        .valid_b(out_b10_valid),
        .out_a(out_a10),
        .out_b(out_b10)
    );    
    
    input_mem #(.FILE_NAME("row_11_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x11(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a11_valid),
        .valid_b(out_b11_valid),
        .out_a(out_a11),
        .out_b(out_b11)
    );    
    
    input_mem #(.FILE_NAME("row_12_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x12(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a12_valid),
        .valid_b(out_b12_valid),
        .out_a(out_a12),
        .out_b(out_b12)
    );
        
    input_mem #(.FILE_NAME("row_13_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x13(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a13_valid),
        .valid_b(out_b13_valid),
        .out_a(out_a13),
        .out_b(out_b13)
    );    
    
    input_mem #(.FILE_NAME("row_14_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x14(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a14_valid),
        .valid_b(out_b14_valid),
        .out_a(out_a14),
        .out_b(out_b14)
    );    
        
    input_mem #(.FILE_NAME("row_15_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x15(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a15_valid),
        .valid_b(out_b15_valid),
        .out_a(out_a15),
        .out_b(out_b15)
    );    
    
    input_mem #(.FILE_NAME("row_16_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x16(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a16_valid),
        .valid_b(out_b16_valid),
        .out_a(out_a16),
        .out_b(out_b16)
    );    
    
    input_mem #(.FILE_NAME("row_17_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x17(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a17_valid),
        .valid_b(out_b17_valid),
        .out_a(out_a17),
        .out_b(out_b17)
    );    
    
    input_mem #(.FILE_NAME("row_18_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x18(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a18_valid),
        .valid_b(out_b18_valid),
        .out_a(out_a18),
        .out_b(out_b18)
    );
        
    input_mem #(.FILE_NAME("row_19_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x19(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a19_valid),
        .valid_b(out_b19_valid),
        .out_a(out_a19),
        .out_b(out_b19)
    );    
    
    input_mem #(.FILE_NAME("row_20_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x20(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a20_valid),
        .valid_b(out_b20_valid),
        .out_a(out_a20),
        .out_b(out_b20)
    );    
    
    input_mem #(.FILE_NAME("row_21_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x21(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a21_valid),
        .valid_b(out_b21_valid),
        .out_a(out_a21),
        .out_b(out_b21)
    );    
    
    input_mem #(.FILE_NAME("row_22_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x22(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a22_valid),
        .valid_b(out_b22_valid),
        .out_a(out_a22),
        .out_b(out_b22)
    );
    
        
    input_mem #(.FILE_NAME("row_23_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x23(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a23_valid),
        .valid_b(out_b23_valid),
        .out_a(out_a23),
        .out_b(out_b23)
    );    
    
    input_mem #(.FILE_NAME("row_24_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x24(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a24_valid),
        .valid_b(out_b24_valid),
        .out_a(out_a24),
        .out_b(out_b24)
    );    
    
    input_mem #(.FILE_NAME("row_25_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x25(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a25_valid),
        .valid_b(out_b25_valid),
        .out_a(out_a25),
        .out_b(out_b25)
    );    
    
    input_mem #(.FILE_NAME("row_26_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x26(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a26_valid),
        .valid_b(out_b26_valid),
        .out_a(out_a26),
        .out_b(out_b26)
    );
        
    input_mem #(.FILE_NAME("row_27_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x27(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a27_valid),
        .valid_b(out_b27_valid),
        .out_a(out_a27),
        .out_b(out_b27)
    );    
    
    input_mem #(.FILE_NAME("row_28_average_5.txt"), .DATA_BIT_WIDTH(32), .NUM_ENTRIES(NUM_ENTRIES), .ADDRESS_BIT_WIDTH(ADDRESS_BIT_WIDTH)) x28(
        .clk(clk),
        .rst(rst),
        .start_a(start_a),
        .start_b(start_b),
        .valid_a(out_a28_valid),
        .valid_b(out_b28_valid),
        .out_a(out_a28),
        .out_b(out_b28)
    ); 
    
    and_gate and_a(
        .in1(out_a1_valid), .in2(out_a2_valid), .in3(out_a3_valid), .in4(out_a4_valid), .in5(out_a5_valid), .in6(out_a6_valid), .in7(out_a7_valid),
        .in8(out_a8_valid), .in9(out_a9_valid), .in10(out_a10_valid), .in11(out_a11_valid), .in12(out_a12_valid), .in13(out_a13_valid), .in14(out_a14_valid),        
        .in15(out_a15_valid), .in16(out_a16_valid), .in17(out_a17_valid), .in18(out_a18_valid), .in19(out_a19_valid), .in20(out_a20_valid), .in21(out_a21_valid),
        .in22(out_a22_valid), .in23(out_a23_valid), .in24(out_a24_valid), .in25(out_a25_valid), .in26(out_a26_valid), .in27(out_a27_valid), .in28(out_a28_valid),
        .out(valid_a)
    );   

endmodule
