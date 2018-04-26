`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// covariance.v
// Created by Ruben Purdy on 04/12/2018 09:40:54 PM
//////////////////////////////////////////////////////////////////////////////////

/*
    Calculates the covariance of two different input streams. For the x values, the mean and values should be
    seperated. The y values should be already subtracted by the mean.
    
    - inputs:
        - [31:0] in_x: The x input data, in fixed point.
        - [31:0] u_x: The x mean, in floating point.
        - [31:0] in_y: The y input data, in floating point. This is each value subtracted by the mean value.
        - clk: The clock.
        - clr: The clear signal.
        - in_x_valid: Indicates whether the input x data is valid.
        - u_x_valid: Indicates whether the x mean is valid.
        - in_y_valid: Indicates whether the input y data is valid.
    - outputs:
        - in_y_ready: Indicates whether the input is ready for the y data.
        - [31:0] out: The covariance, in floating point.
        - out_valid: Indicates whether the covariance value is valid.
*/
//module covariance #(parameter NUM_INPUTS = 784)(in_x, u_x, in_y, clk, clr, in_x_valid, u_x_valid, in_y_valid, in_y_ready, out, out_valid);
module covariance #(parameter NUM_INPUTS = 784)(
clk, clr,
in1, in2, in3, in4, in5, in6, in7, 
in8, in9, in10, in11, in12, in13, in14, 
in15, in16, in17, in18, in19, in20, in21, 
in22, in23, in24, in25, in26, in27, in28, 
in_y1, in_y2, in_y3, in_y4, in_y5, in_y6, in_y7,
in_y8, in_y9, in_y10, in_y11, in_y12, in_y13, in_y14,
in_y15, in_y16, in_y17, in_y18, in_y19, in_y20, in_y21,
in_y22, in_y23, in_y24, in_y25, in_y26, in_y27, in_y28,
u, in_valid, u_valid, in_y_valid, result_ready, in_ready, in_y_ready, out, out_valid);

    input [7:0] in1, in2, in3, in4, in5, in6, in7;
    input [7:0] in8, in9, in10, in11, in12, in13, in14;
    input [7:0] in15, in16, in17, in18, in19, in20, in21;
    input [7:0] in22, in23, in24, in25, in26, in27, in28; // 8-bits to represent 256 possible pixel values
    
    input [31:0] in_y1, in_y2, in_y3, in_y4, in_y5, in_y6, in_y7;
    input [31:0] in_y8, in_y9, in_y10, in_y11, in_y12, in_y13, in_y14;
    input [31:0] in_y15, in_y16, in_y17, in_y18, in_y19, in_y20, in_y21;
    input [31:0] in_y22, in_y23, in_y24, in_y25, in_y26, in_y27, in_y28;
    
    input [31:0] u;
    
    input clk, clr, in_valid, u_valid, in_y_valid, result_ready;
    
    output [31:0] out;
    output out_valid, in_ready, in_y_ready;
    
    // in_to_float outputs
    wire in1_ready, in2_ready, in3_ready, in4_ready, in5_ready, in6_ready, in7_ready;
    wire in8_ready, in9_ready, in10_ready, in11_ready, in12_ready, in13_ready, in14_ready;
    wire in15_ready, in16_ready, in17_ready, in18_ready, in19_ready, in20_ready, in21_ready;
    wire in22_ready, in23_ready, in24_ready, in25_ready, in26_ready, in27_ready, in28_ready;
        
    wire [31:0] in_float1, in_float2, in_float3, in_float4, in_float5, in_float6, in_float7;
    wire [31:0] in_float8, in_float9, in_float10, in_float11, in_float12, in_float13, in_float14;
    wire [31:0] in_float15, in_float16, in_float17, in_float18, in_float19, in_float20, in_float21;
    wire [31:0] in_float22, in_float23, in_float24, in_float25, in_float26, in_float27, in_float28;
    
    wire in_float1_valid, in_float2_valid, in_float3_valid, in_float4_valid, in_float5_valid, in_float6_valid, in_float7_valid;
    wire in_float8_valid, in_float9_valid, in_float10_valid, in_float11_valid, in_float12_valid, in_float13_valid, in_float14_valid;
    wire in_float15_valid, in_float16_valid, in_float17_valid, in_float18_valid, in_float19_valid, in_float20_valid, in_float21_valid;
    wire in_float22_valid, in_float23_valid, in_float24_valid, in_float25_valid, in_float26_valid, in_float27_valid, in_float28_valid;
    
    // FIXME: What to do with this?
    wire u_ready;
    
    // subtractor outputs
    wire sub_a1_ready, sub_a2_ready, sub_a3_ready, sub_a4_ready, sub_a5_ready, sub_a6_ready, sub_a7_ready;
    wire sub_a8_ready, sub_a9_ready, sub_a10_ready, sub_a11_ready, sub_a12_ready, sub_a13_ready, sub_a14_ready;
    wire sub_a15_ready, sub_a16_ready, sub_a17_ready, sub_a18_ready, sub_a19_ready, sub_a20_ready, sub_a21_ready;
    wire sub_a22_ready, sub_a23_ready, sub_a24_ready, sub_a25_ready, sub_a26_ready, sub_a27_ready, sub_a28_ready;

    wire [31:0] sub_out1, sub_out2, sub_out3, sub_out4, sub_out5, sub_out6, sub_out7;
    wire [31:0] sub_out8, sub_out9, sub_out10, sub_out11, sub_out12, sub_out13, sub_out14;
    wire [31:0] sub_out15, sub_out16, sub_out17, sub_out18, sub_out19, sub_out20, sub_out21;
    wire [31:0] sub_out22, sub_out23, sub_out24, sub_out25, sub_out26, sub_out27, sub_out28;

    wire sub_out1_valid, sub_out2_valid, sub_out3_valid, sub_out4_valid, sub_out5_valid, sub_out6_valid, sub_out7_valid;
    wire sub_out8_valid, sub_out9_valid, sub_out10_valid, sub_out11_valid, sub_out12_valid, sub_out13_valid, sub_out14_valid;
    wire sub_out15_valid, sub_out16_valid, sub_out17_valid, sub_out18_valid, sub_out19_valid, sub_out20_valid, sub_out21_valid;
    wire sub_out22_valid, sub_out23_valid, sub_out24_valid, sub_out25_valid, sub_out26_valid, sub_out27_valid, sub_out28_valid;
    
    // data counter outputs
    wire [31:0] data_counter_out1, data_counter_out2, data_counter_out3, data_counter_out4, data_counter_out5, data_counter_out6, data_counter_out7;
    wire [31:0] data_counter_out8, data_counter_out9, data_counter_out10, data_counter_out11, data_counter_out12, data_counter_out13, data_counter_out14;
    wire [31:0] data_counter_out15, data_counter_out16, data_counter_out17, data_counter_out18, data_counter_out19, data_counter_out20, data_counter_out21;
    wire [31:0] data_counter_out22, data_counter_out23, data_counter_out24, data_counter_out25, data_counter_out26, data_counter_out27, data_counter_out28;
    
    wire data_counter_done1, data_counter_done2, data_counter_done3, data_counter_done4, data_counter_done5, data_counter_done6, data_counter_done7;
    wire data_counter_done8, data_counter_done9, data_counter_done10, data_counter_done11, data_counter_done12, data_counter_done13, data_counter_done14;
    wire data_counter_done15, data_counter_done16, data_counter_done17, data_counter_done18, data_counter_done19, data_counter_done20, data_counter_done21;
    wire data_counter_done22, data_counter_done23, data_counter_done24, data_counter_done25, data_counter_done26, data_counter_done27, data_counter_done28;
    
    // multiplier outputs
    wire multiplier_a1_ready, multiplier_a2_ready, multiplier_a3_ready, multiplier_a4_ready, multiplier_a5_ready, multiplier_a6_ready, multiplier_a7_ready;
    wire multiplier_a8_ready, multiplier_a9_ready, multiplier_a10_ready, multiplier_a11_ready, multiplier_a12_ready, multiplier_a13_ready, multiplier_a14_ready;
    wire multiplier_a15_ready, multiplier_a16_ready, multiplier_a17_ready, multiplier_a18_ready, multiplier_a19_ready, multiplier_a20_ready, multiplier_a21_ready;
    wire multiplier_a22_ready, multiplier_a23_ready, multiplier_a24_ready, multiplier_a25_ready, multiplier_a26_ready, multiplier_a27_ready, multiplier_a28_ready;
    
    wire multiplier_b1_ready, multiplier_b2_ready, multiplier_b3_ready, multiplier_b4_ready, multiplier_b5_ready, multiplier_b6_ready, multiplier_b7_ready;
    wire multiplier_b8_ready, multiplier_b9_ready, multiplier_b10_ready, multiplier_b11_ready, multiplier_b12_ready, multiplier_b13_ready, multiplier_b14_ready;
    wire multiplier_b15_ready, multiplier_b16_ready, multiplier_b17_ready, multiplier_b18_ready, multiplier_b19_ready, multiplier_b20_ready, multiplier_b21_ready;
    wire multiplier_b22_ready, multiplier_b23_ready, multiplier_b24_ready, multiplier_b25_ready, multiplier_b26_ready, multiplier_b27_ready, multiplier_b28_ready;
    
    wire [31:0] multiplier_out1, multiplier_out2, multiplier_out3, multiplier_out4, multiplier_out5, multiplier_out6, multiplier_out7;
    wire [31:0] multiplier_out8, multiplier_out9, multiplier_out10, multiplier_out11, multiplier_out12, multiplier_out13, multiplier_out14;
    wire [31:0] multiplier_out15, multiplier_out16, multiplier_out17, multiplier_out18, multiplier_out19, multiplier_out20, multiplier_out21;
    wire [31:0] multiplier_out22, multiplier_out23, multiplier_out24, multiplier_out25, multiplier_out26, multiplier_out27, multiplier_out28;
    
    wire multiplier_out1_valid, multiplier_out2_valid, multiplier_out3_valid, multiplier_out4_valid, multiplier_out5_valid, multiplier_out6_valid, multiplier_out7_valid;
    wire multiplier_out8_valid, multiplier_out9_valid, multiplier_out10_valid, multiplier_out11_valid, multiplier_out12_valid, multiplier_out13_valid, multiplier_out14_valid;
    wire multiplier_out15_valid, multiplier_out16_valid, multiplier_out17_valid, multiplier_out18_valid, multiplier_out19_valid, multiplier_out20_valid, multiplier_out21_valid;
    wire multiplier_out22_valid, multiplier_out23_valid, multiplier_out24_valid, multiplier_out25_valid, multiplier_out26_valid, multiplier_out27_valid, multiplier_out28_valid;
    
    // multiplier_to_fixed outputs
    wire multiplier_to_fixed1_ready, multiplier_to_fixed2_ready, multiplier_to_fixed3_ready, multiplier_to_fixed4_ready, multiplier_to_fixed5_ready, multiplier_to_fixed6_ready, multiplier_to_fixed7_ready;
    wire multiplier_to_fixed8_ready, multiplier_to_fixed9_ready, multiplier_to_fixed10_ready, multiplier_to_fixed11_ready, multiplier_to_fixed12_ready, multiplier_to_fixed13_ready, multiplier_to_fixed14_ready;
    wire multiplier_to_fixed15_ready, multiplier_to_fixed16_ready, multiplier_to_fixed17_ready, multiplier_to_fixed18_ready, multiplier_to_fixed19_ready, multiplier_to_fixed20_ready, multiplier_to_fixed21_ready;
    wire multiplier_to_fixed22_ready, multiplier_to_fixed23_ready, multiplier_to_fixed24_ready, multiplier_to_fixed25_ready, multiplier_to_fixed26_ready, multiplier_to_fixed27_ready, multiplier_to_fixed28_ready;
    
    wire [31:0] multiplier_fixed_out1, multiplier_fixed_out2, multiplier_fixed_out3, multiplier_fixed_out4, multiplier_fixed_out5, multiplier_fixed_out6, multiplier_fixed_out7;
    wire [31:0] multiplier_fixed_out8, multiplier_fixed_out9, multiplier_fixed_out10, multiplier_fixed_out11, multiplier_fixed_out12, multiplier_fixed_out13, multiplier_fixed_out14;
    wire [31:0] multiplier_fixed_out15, multiplier_fixed_out16, multiplier_fixed_out17, multiplier_fixed_out18, multiplier_fixed_out19, multiplier_fixed_out20, multiplier_fixed_out21;
    wire [31:0] multiplier_fixed_out22, multiplier_fixed_out23, multiplier_fixed_out24, multiplier_fixed_out25, multiplier_fixed_out26, multiplier_fixed_out27, multiplier_fixed_out28;
    
    wire multiplier_fixed_out1_valid, multiplier_fixed_out2_valid, multiplier_fixed_out3_valid, multiplier_fixed_out4_valid, multiplier_fixed_out5_valid, multiplier_fixed_out6_valid, multiplier_fixed_out7_valid;
    wire multiplier_fixed_out8_valid, multiplier_fixed_out9_valid, multiplier_fixed_out10_valid, multiplier_fixed_out11_valid, multiplier_fixed_out12_valid, multiplier_fixed_out13_valid, multiplier_fixed_out14_valid;
    wire multiplier_fixed_out15_valid, multiplier_fixed_out16_valid, multiplier_fixed_out17_valid, multiplier_fixed_out18_valid, multiplier_fixed_out19_valid, multiplier_fixed_out20_valid, multiplier_fixed_out21_valid;
    wire multiplier_fixed_out22_valid, multiplier_fixed_out23_valid, multiplier_fixed_out24_valid, multiplier_fixed_out25_valid, multiplier_fixed_out26_valid, multiplier_fixed_out27_valid, multiplier_fixed_out28_valid;
    
    // accumulator out
    wire [31:0] accumulator_out1, accumulator_out2, accumulator_out3, accumulator_out4, accumulator_out5, accumulator_out6, accumulator_out7;
    wire [31:0] accumulator_out8, accumulator_out9, accumulator_out10, accumulator_out11, accumulator_out12, accumulator_out13, accumulator_out14;
    wire [31:0] accumulator_out15, accumulator_out16, accumulator_out17, accumulator_out18, accumulator_out19, accumulator_out20, accumulator_out21;
    wire [31:0] accumulator_out22, accumulator_out23, accumulator_out24, accumulator_out25, accumulator_out26, accumulator_out27, accumulator_out28;
    
    // adder out
    wire [31:0] adder_out;
    
    // adder_to_float out
    wire adder_to_float_in_ready;
    wire adder_to_float_valid;
    wire [31:0] adder_to_float_out;
    
    // div_b_to_float out
    wire div_b_to_float_ready;
    wire div_b_to_float_out_valid;
    wire [31:0] div_b_converter_out;
    
    // divider out
    wire div_a_ready, div_b_ready;
    wire divider_valid;
     
    assign in_ready = in1_ready;
    //assign in_y_ready = sub_out1_valid;
    assign in_y_ready = in_float1_valid;

    parallel_fixed_to_float in_to_float(
        .clk(clk), .in_valid(in_valid),
        // in
        .in1({24'd0, in1}), .in2({24'd0, in2}), .in3({24'd0, in3}), .in4({24'd0, in4}), .in5({24'd0, in5}), .in6({24'd0, in6}), .in7({24'd0, in7}),
        .in8({24'd0, in8}), .in9({24'd0, in9}), .in10({24'd0, in10}), .in11({24'd0, in11}), .in12({24'd0, in12}), .in13({24'd0, in13}), .in14({24'd0, in14}),
        .in15({24'd0, in15}), .in16({24'd0, in16}), .in17({24'd0, in17}), .in18({24'd0, in18}), .in19({24'd0, in19}), .in20({24'd0, in20}), .in21({24'd0, in21}),
        .in22({24'd0, in22}), .in23({24'd0, in23}), .in24({24'd0, in24}), .in25({24'd0, in25}), .in26({24'd0, in26}), .in27({24'd0, in27}), .in28({24'd0, in28}),
        // out_ready
        .out1_ready(sub_a1_ready), .out2_ready(sub_a2_ready), .out3_ready(sub_a3_ready), .out4_ready(sub_a4_ready), .out5_ready(sub_a5_ready), .out6_ready(sub_a6_ready), .out7_ready(sub_a7_ready),
        .out8_ready(sub_a8_ready), .out9_ready(sub_a9_ready), .out10_ready(sub_a10_ready), .out11_ready(sub_a11_ready), .out12_ready(sub_a12_ready), .out13_ready(sub_a13_ready), .out14_ready(sub_a14_ready),
        .out15_ready(sub_a15_ready), .out16_ready(sub_a16_ready), .out17_ready(sub_a17_ready), .out18_ready(sub_a18_ready), .out19_ready(sub_a19_ready), .out20_ready(sub_a20_ready), .out21_ready(sub_a21_ready),
        .out22_ready(sub_a22_ready), .out23_ready(sub_a23_ready), .out24_ready(sub_a24_ready), .out25_ready(sub_a25_ready), .out26_ready(sub_a26_ready), .out27_ready(sub_a27_ready), .out28_ready(sub_a28_ready),
        // in_ready
        .in1_ready(in1_ready), .in2_ready(in2_ready), .in3_ready(in3_ready), .in4_ready(in4_ready), .in5_ready(in5_ready), .in6_ready(in6_ready), .in7_ready(in7_ready),
        .in8_ready(in8_ready), .in9_ready(in9_ready), .in10_ready(in10_ready), .in11_ready(in11_ready), .in12_ready(in12_ready), .in13_ready(in13_ready), .in14_ready(in14_ready),
        .in15_ready(in15_ready), .in16_ready(in16_ready), .in17_ready(in17_ready), .in18_ready(in18_ready), .in19_ready(in19_ready), .in20_ready(in20_ready), .in21_ready(in21_ready),
        .in22_ready(in22_ready), .in23_ready(in23_ready), .in24_ready(in24_ready), .in25_ready(in25_ready), .in26_ready(in26_ready), .in27_ready(in27_ready), .in28_ready(in28_ready),
        // out
        .out1(in_float1), .out2(in_float2), .out3(in_float3), .out4(in_float4), .out5(in_float5), .out6(in_float6), .out7(in_float7),
        .out8(in_float8), .out9(in_float9), .out10(in_float10), .out11(in_float11), .out12(in_float12), .out13(in_float13), .out14(in_float14),
        .out15(in_float15), .out16(in_float16), .out17(in_float17), .out18(in_float18), .out19(in_float19), .out20(in_float20), .out21(in_float21),
        .out22(in_float22), .out23(in_float23), .out24(in_float24), .out25(in_float25), .out26(in_float26), .out27(in_float27), .out28(in_float28),
        // out_valid
        .out1_valid(in_float1_valid), .out2_valid(in_float2_valid), .out3_valid(in_float3_valid), .out4_valid(in_float4_valid), .out5_valid(in_float5_valid), .out6_valid(in_float6_valid), .out7_valid(in_float7_valid),
        .out8_valid(in_float8_valid), .out9_valid(in_float9_valid), .out10_valid(in_float10_valid), .out11_valid(in_float11_valid), .out12_valid(in_float12_valid), .out13_valid(in_float13_valid), .out14_valid(in_float14_valid),
        .out15_valid(in_float15_valid), .out16_valid(in_float16_valid), .out17_valid(in_float17_valid), .out18_valid(in_float18_valid), .out19_valid(in_float19_valid), .out20_valid(in_float20_valid), .out21_valid(in_float21_valid),
        .out22_valid(in_float22_valid), .out23_valid(in_float23_valid), .out24_valid(in_float24_valid), .out25_valid(in_float25_valid), .out26_valid(in_float26_valid), .out27_valid(in_float27_valid), .out28_valid(in_float28_valid)
    );
    
    parallel_subtractors subs(
        .clk(clk), .rst(clr), .in_b(u), .in_b_valid(u_valid),
        //
        .in_a1(in_float1), .in_a2(in_float2), .in_a3(in_float3), .in_a4(in_float4), .in_a5(in_float5), .in_a6(in_float6), .in_a7(in_float7),
        .in_a8(in_float8), .in_a9(in_float9), .in_a10(in_float10), .in_a11(in_float11), .in_a12(in_float12), .in_a13(in_float13), .in_a14(in_float14),
        .in_a15(in_float15), .in_a16(in_float16), .in_a17(in_float17), .in_a18(in_float18), .in_a19(in_float19), .in_a20(in_float20), .in_a21(in_float21),
        .in_a22(in_float22), .in_a23(in_float23), .in_a24(in_float24), .in_a25(in_float25), .in_a26(in_float26), .in_a27(in_float27), .in_a28(in_float28),
        //
        .in_a1_valid(in_float1_valid), .in_a2_valid(in_float2_valid), .in_a3_valid(in_float3_valid), .in_a4_valid(in_float4_valid), .in_a5_valid(in_float5_valid), .in_a6_valid(in_float6_valid), .in_a7_valid(in_float7_valid),
        .in_a8_valid(in_float8_valid), .in_a9_valid(in_float9_valid), .in_a10_valid(in_float10_valid), .in_a11_valid(in_float11_valid), .in_a12_valid(in_float12_valid), .in_a13_valid(in_float13_valid), .in_a14_valid(in_float14_valid),
        .in_a15_valid(in_float15_valid), .in_a16_valid(in_float16_valid), .in_a17_valid(in_float17_valid), .in_a18_valid(in_float18_valid), .in_a19_valid(in_float19_valid), .in_a20_valid(in_float20_valid), .in_a21_valid(in_float21_valid),
        .in_a22_valid(in_float22_valid), .in_a23_valid(in_float23_valid), .in_a24_valid(in_float24_valid), .in_a25_valid(in_float25_valid), .in_a26_valid(in_float26_valid), .in_a27_valid(in_float27_valid), .in_a28_valid(in_float28_valid),
        //
        .out1_ready(multiplier_a1_ready), .out2_ready(multiplier_a2_ready), .out3_ready(multiplier_a3_ready), .out4_ready(multiplier_a4_ready), .out5_ready(multiplier_a5_ready), .out6_ready(multiplier_a6_ready), .out7_ready(multiplier_a7_ready),
        .out8_ready(multiplier_a8_ready), .out9_ready(multiplier_a9_ready), .out10_ready(multiplier_a10_ready), .out11_ready(multiplier_a11_ready), .out12_ready(multiplier_a12_ready), .out13_ready(multiplier_a13_ready), .out14_ready(multiplier_a14_ready),
        .out15_ready(multiplier_a15_ready), .out16_ready(multiplier_a16_ready), .out17_ready(multiplier_a17_ready), .out18_ready(multiplier_a18_ready), .out19_ready(multiplier_a19_ready), .out20_ready(multiplier_a20_ready), .out21_ready(multiplier_a21_ready),
        .out22_ready(multiplier_a22_ready), .out23_ready(multiplier_a23_ready), .out24_ready(multiplier_a24_ready), .out25_ready(multiplier_a25_ready), .out26_ready(multiplier_a26_ready), .out27_ready(multiplier_a27_ready), .out28_ready(multiplier_a28_ready),
        // test
//        .out1_ready(1'b1), .out2_ready(1'b1), .out3_ready(1'b1), .out4_ready(1'b1), .out5_ready(1'b1), .out6_ready(1'b1), .out7_ready(1'b1),
//        .out8_ready(1'b1), .out9_ready(1'b1), .out10_ready(1'b1), .out11_ready(1'b1), .out12_ready(1'b1), .out13_ready(1'b1), .out14_ready(1'b1),
//        .out15_ready(1'b1), .out16_ready(1'b1), .out17_ready(1'b1), .out18_ready(1'b1), .out19_ready(1'b1), .out20_ready(1'b1), .out21_ready(1'b1),
//        .out22_ready(1'b1), .out23_ready(1'b1), .out24_ready(1'b1), .out25_ready(1'b1), .out26_ready(1'b1), .out27_ready(1'b1), .out28_ready(1'b1),
        //
        .out1(sub_out1), .out2(sub_out2), .out3(sub_out3), .out4(sub_out4), .out5(sub_out5), .out6(sub_out6), .out7(sub_out7),
        .out8(sub_out8), .out9(sub_out9), .out10(sub_out10), .out11(sub_out11), .out12(sub_out12), .out13(sub_out13), .out14(sub_out14),
        .out15(sub_out15), .out16(sub_out16), .out17(sub_out17), .out18(sub_out18), .out19(sub_out19), .out20(sub_out20), .out21(sub_out21),
        .out22(sub_out22), .out23(sub_out23), .out24(sub_out24), .out25(sub_out25), .out26(sub_out26), .out27(sub_out27), .out28(sub_out28),
        //
        .out1_valid(sub_out1_valid), .out2_valid(sub_out2_valid), .out3_valid(sub_out3_valid), .out4_valid(sub_out4_valid), .out5_valid(sub_out5_valid), .out6_valid(sub_out6_valid), .out7_valid(sub_out7_valid),
        .out8_valid(sub_out8_valid), .out9_valid(sub_out9_valid), .out10_valid(sub_out10_valid), .out11_valid(sub_out11_valid), .out12_valid(sub_out12_valid), .out13_valid(sub_out13_valid), .out14_valid(sub_out14_valid),
        .out15_valid(sub_out15_valid), .out16_valid(sub_out16_valid), .out17_valid(sub_out17_valid), .out18_valid(sub_out18_valid), .out19_valid(sub_out19_valid), .out20_valid(sub_out20_valid), .out21_valid(sub_out21_valid),
        .out22_valid(sub_out22_valid), .out23_valid(sub_out23_valid), .out24_valid(sub_out24_valid), .out25_valid(sub_out25_valid), .out26_valid(sub_out26_valid), .out27_valid(sub_out27_valid), .out28_valid(sub_out28_valid),
        //
        .in_a1_ready(sub_a1_ready), .in_a2_ready(sub_a2_ready), .in_a3_ready(sub_a3_ready), .in_a4_ready(sub_a4_ready), .in_a5_ready(sub_a5_ready), .in_a6_ready(sub_a6_ready), .in_a7_ready(sub_a7_ready),
        .in_a8_ready(sub_a8_ready), .in_a9_ready(sub_a9_ready), .in_a10_ready(sub_a10_ready), .in_a11_ready(sub_a11_ready), .in_a12_ready(sub_a12_ready), .in_a13_ready(sub_a13_ready), .in_a14_ready(sub_a14_ready),
        .in_a15_ready(sub_a15_ready), .in_a16_ready(sub_a16_ready), .in_a17_ready(sub_a17_ready), .in_a18_ready(sub_a18_ready), .in_a19_ready(sub_a19_ready), .in_a20_ready(sub_a20_ready), .in_a21_ready(sub_a21_ready),
        .in_a22_ready(sub_a22_ready), .in_a23_ready(sub_a23_ready), .in_a24_ready(sub_a24_ready), .in_a25_ready(sub_a25_ready), .in_a26_ready(sub_a26_ready), .in_a27_ready(sub_a27_ready), .in_a28_ready(sub_a28_ready),
        //
        .in_b_ready(u_ready)
    );
    
    parallel_data_counters data_counters (
        .clk(clk), .clr(clr || !sub_out1_valid),
        // in
        .in1(sub_out1), .in2(sub_out2), .in3(sub_out3), .in4(sub_out4), .in5(sub_out5), .in6(sub_out6), .in7(sub_out7),
        .in8(sub_out8), .in9(sub_out9), .in10(sub_out10), .in11(sub_out11), .in12(sub_out12), .in13(sub_out13), .in14(sub_out14),
        .in15(sub_out15), .in16(sub_out16), .in17(sub_out17), .in18(sub_out18), .in19(sub_out19), .in20(sub_out20), .in21(sub_out21),
        .in22(sub_out22), .in23(sub_out23), .in24(sub_out24), .in25(sub_out25), .in26(sub_out26), .in27(sub_out27), .in28(sub_out28),
        // ready
        .ready1(sub_out1_valid), .ready2(sub_out2_valid), .ready3(sub_out3_valid), .ready4(sub_out4_valid), .ready5(sub_out5_valid), .ready6(sub_out6_valid), .ready7(sub_out7_valid),
        .ready8(sub_out8_valid), .ready9(sub_out9_valid), .ready10(sub_out10_valid), .ready11(sub_out11_valid), .ready12(sub_out12_valid), .ready13(sub_out13_valid), .ready14(sub_out14_valid),
        .ready15(sub_out15_valid), .ready16(sub_out16_valid), .ready17(sub_out17_valid), .ready18(sub_out18_valid), .ready19(sub_out19_valid), .ready20(sub_out20_valid), .ready21(sub_out21_valid),
        .ready22(sub_out22_valid), .ready23(sub_out23_valid), .ready24(sub_out24_valid), .ready25(sub_out25_valid), .ready26(sub_out26_valid), .ready27(sub_out27_valid), .ready28(sub_out28_valid),
        // out
        .out1(data_counter_out1), .out2(data_counter_out2), .out3(data_counter_out3), .out4(data_counter_out4), .out5(data_counter_out5), .out6(data_counter_out6), .out7(data_counter_out7),
        .out8(data_counter_out8), .out9(data_counter_out9), .out10(data_counter_out10), .out11(data_counter_out11), .out12(data_counter_out12), .out13(data_counter_out13), .out14(data_counter_out14),
        .out15(data_counter_out15), .out16(data_counter_out16), .out17(data_counter_out17), .out18(data_counter_out18), .out19(data_counter_out19), .out20(data_counter_out20), .out21(data_counter_out21),
        .out22(data_counter_out22), .out23(data_counter_out23), .out24(data_counter_out24), .out25(data_counter_out25), .out26(data_counter_out26), .out27(data_counter_out27), .out28(data_counter_out28),
        // done
        .done1(data_counter_done1), .done2(data_counter_done2), .done3(data_counter_done3), .done4(data_counter_done4), .done5(data_counter_done5), .done6(data_counter_done6), .done7(data_counter_done7),
        .done8(data_counter_done8), .done9(data_counter_done9), .done10(data_counter_done10), .done11(data_counter_done11), .done12(data_counter_done12), .done13(data_counter_done13), .done14(data_counter_done14),
        .done15(data_counter_done15), .done16(data_counter_done16), .done17(data_counter_done17), .done18(data_counter_done18), .done19(data_counter_done19), .done20(data_counter_done20), .done21(data_counter_done21),
        .done22(data_counter_done22), .done23(data_counter_done23), .done24(data_counter_done24), .done25(data_counter_done25), .done26(data_counter_done26), .done27(data_counter_done27), .done28(data_counter_done28)
    );
    
    parallel_multipliers mults (
        .clk(clk), .rst(clr),
        // in_a
        .in_a1(data_counter_out1), .in_a2(data_counter_out2), .in_a3(data_counter_out3), .in_a4(data_counter_out4), .in_a5(data_counter_out5), .in_a6(data_counter_out6), .in_a7(data_counter_out7),
        .in_a8(data_counter_out8), .in_a9(data_counter_out9), .in_a10(data_counter_out10), .in_a11(data_counter_out11), .in_a12(data_counter_out12), .in_a13(data_counter_out13), .in_a14(data_counter_out14),
        .in_a15(data_counter_out15), .in_a16(data_counter_out16), .in_a17(data_counter_out17), .in_a18(data_counter_out18), .in_a19(data_counter_out19), .in_a20(data_counter_out20), .in_a21(data_counter_out21),
        .in_a22(data_counter_out22), .in_a23(data_counter_out23), .in_a24(data_counter_out24), .in_a25(data_counter_out25), .in_a26(data_counter_out26), .in_a27(data_counter_out27), .in_a28(data_counter_out28),
        // in_a_valid
        .in_a1_valid(sub_out1_valid), .in_a2_valid(sub_out2_valid), .in_a3_valid(sub_out3_valid), .in_a4_valid(sub_out4_valid), .in_a5_valid(sub_out5_valid), .in_a6_valid(sub_out6_valid), .in_a7_valid(sub_out7_valid),
        .in_a8_valid(sub_out8_valid), .in_a9_valid(sub_out9_valid), .in_a10_valid(sub_out10_valid), .in_a11_valid(sub_out11_valid), .in_a12_valid(sub_out12_valid), .in_a13_valid(sub_out13_valid), .in_a14_valid(sub_out14_valid),
        .in_a15_valid(sub_out15_valid), .in_a16_valid(sub_out16_valid), .in_a17_valid(sub_out17_valid), .in_a18_valid(sub_out18_valid), .in_a19_valid(sub_out19_valid), .in_a20_valid(sub_out20_valid), .in_a21_valid(sub_out21_valid),
        .in_a22_valid(sub_out22_valid), .in_a23_valid(sub_out23_valid), .in_a24_valid(sub_out24_valid), .in_a25_valid(sub_out25_valid), .in_a26_valid(sub_out26_valid), .in_a27_valid(sub_out27_valid), .in_a28_valid(sub_out28_valid),
//        .in_a1_valid(1), .in_a2_valid(1), .in_a3_valid(1), .in_a4_valid(1), .in_a5_valid(1), .in_a6_valid(1), .in_a7_valid(1),
//        .in_a8_valid(1), .in_a9_valid(1), .in_a10_valid(1), .in_a11_valid(1), .in_a12_valid(1), .in_a13_valid(1), .in_a14_valid(1),
//        .in_a15_valid(1), .in_a16_valid(1), .in_a17_valid(1), .in_a18_valid(1), .in_a19_valid(1), .in_a20_valid(1), .in_a21_valid(1),
//        .in_a22_valid(1), .in_a23_valid(1), .in_a24_valid(1), .in_a25_valid(1), .in_a26_valid(1), .in_a27_valid(1), .in_a28_valid(1),
        // in_b
        .in_b1(in_y1), .in_b2(in_y2), .in_b3(in_y3), .in_b4(in_y4), .in_b5(in_y5), .in_b6(in_y6), .in_b7(in_y7),
        .in_b8(in_y8), .in_b9(in_y9), .in_b10(in_y10), .in_b11(in_y11), .in_b12(in_y12), .in_b13(in_y13), .in_b14(in_y14),
        .in_b15(in_y15), .in_b16(in_y16), .in_b17(in_y17), .in_b18(in_y18), .in_b19(in_y19), .in_b20(in_y20), .in_b21(in_y21),
        .in_b22(in_y22), .in_b23(in_y23), .in_b24(in_y24), .in_b25(in_y25), .in_b26(in_y26), .in_b27(in_y27), .in_b28(in_y28),        
        // in_b_valid
        .in_b1_valid(in_y_valid), .in_b2_valid(in_y_valid), .in_b3_valid(in_y_valid), .in_b4_valid(in_y_valid), .in_b5_valid(in_y_valid), .in_b6_valid(in_y_valid), .in_b7_valid(in_y_valid),
        .in_b8_valid(in_y_valid), .in_b9_valid(in_y_valid), .in_b10_valid(in_y_valid), .in_b11_valid(in_y_valid), .in_b12_valid(in_y_valid), .in_b13_valid(in_y_valid), .in_b14_valid(in_y_valid),
        .in_b15_valid(in_y_valid), .in_b16_valid(in_y_valid), .in_b17_valid(in_y_valid), .in_b18_valid(in_y_valid), .in_b19_valid(in_y_valid), .in_b20_valid(in_y_valid), .in_b21_valid(in_y_valid),
        .in_b22_valid(in_y_valid), .in_b23_valid(in_y_valid), .in_b24_valid(in_y_valid), .in_b25_valid(in_y_valid), .in_b26_valid(in_y_valid), .in_b27_valid(in_y_valid), .in_b28_valid(in_y_valid),        
//        .in_b1_valid(1), .in_b2_valid(1), .in_b3_valid(1), .in_b4_valid(1), .in_b5_valid(1), .in_b6_valid(1), .in_b7_valid(1),
//        .in_b8_valid(1), .in_b9_valid(1), .in_b10_valid(1), .in_b11_valid(1), .in_b12_valid(1), .in_b13_valid(1), .in_b14_valid(1),
//        .in_b15_valid(1), .in_b16_valid(1), .in_b17_valid(1), .in_b18_valid(1), .in_b19_valid(1), .in_b20_valid(1), .in_b21_valid(1),
//        .in_b22_valid(1), .in_b23_valid(1), .in_b24_valid(1), .in_b25_valid(1), .in_b26_valid(1), .in_b27_valid(1), .in_b28_valid(1),
        // result_ready
//        .result_1_ready(multiplier_to_fixed1_ready), .result_2_ready(multiplier_to_fixed2_ready), .result_3_ready(multiplier_to_fixed3_ready), .result_4_ready(multiplier_to_fixed4_ready), .result_5_ready(multiplier_to_fixed5_ready), .result_6_ready(multiplier_to_fixed6_ready), .result_7_ready(multiplier_to_fixed7_ready),
//        .result_8_ready(multiplier_to_fixed8_ready), .result_9_ready(multiplier_to_fixed9_ready), .result_10_ready(multiplier_to_fixed10_ready), .result_11_ready(multiplier_to_fixed11_ready), .result_12_ready(multiplier_to_fixed12_ready), .result_13_ready(multiplier_to_fixed13_ready), .result_14_ready(multiplier_to_fixed14_ready),
//        .result_15_ready(multiplier_to_fixed15_ready), .result_16_ready(multiplier_to_fixed16_ready), .result_17_ready(multiplier_to_fixed17_ready), .result_18_ready(multiplier_to_fixed18_ready), .result_19_ready(multiplier_to_fixed19_ready), .result_20_ready(multiplier_to_fixed20_ready), .result_21_ready(multiplier_to_fixed21_ready),
//        .result_22_ready(multiplier_to_fixed22_ready), .result_23_ready(multiplier_to_fixed23_ready), .result_24_ready(multiplier_to_fixed24_ready), .result_25_ready(multiplier_to_fixed25_ready), .result_26_ready(multiplier_to_fixed26_ready), .result_27_ready(multiplier_to_fixed27_ready), .result_28_ready(multiplier_to_fixed28_ready),
        .result_1_ready(1), .result_2_ready(1), .result_3_ready(1), .result_4_ready(1), .result_5_ready(1), .result_6_ready(1), .result_7_ready(1),
        .result_8_ready(1), .result_9_ready(1), .result_10_ready(1), .result_11_ready(1), .result_12_ready(1), .result_13_ready(1), .result_14_ready(1),
        .result_15_ready(1), .result_16_ready(1), .result_17_ready(1), .result_18_ready(1), .result_19_ready(1), .result_20_ready(1), .result_21_ready(1),
        .result_22_ready(1), .result_23_ready(1), .result_24_ready(1), .result_25_ready(1), .result_26_ready(1), .result_27_ready(1), .result_28_ready(1),
        // in_a_ready
        .in_a1_ready(multiplier_a1_ready), .in_a2_ready(multiplier_a2_ready), .in_a3_ready(multiplier_a3_ready), .in_a4_ready(multiplier_a4_ready), .in_a5_ready(multiplier_a5_ready), .in_a6_ready(multiplier_a6_ready), .in_a7_ready(multiplier_a7_ready),
        .in_a8_ready(multiplier_a8_ready), .in_a9_ready(multiplier_a9_ready), .in_a10_ready(multiplier_a10_ready), .in_a11_ready(multiplier_a11_ready), .in_a12_ready(multiplier_a12_ready), .in_a13_ready(multiplier_a13_ready), .in_a14_ready(multiplier_a14_ready),
        .in_a15_ready(multiplier_a15_ready), .in_a16_ready(multiplier_a16_ready), .in_a17_ready(multiplier_a17_ready), .in_a18_ready(multiplier_a18_ready), .in_a19_ready(multiplier_a19_ready), .in_a20_ready(multiplier_a20_ready), .in_a21_ready(multiplier_a21_ready),
        .in_a22_ready(multiplier_a22_ready), .in_a23_ready(multiplier_a23_ready), .in_a24_ready(multiplier_a24_ready), .in_a25_ready(multiplier_a25_ready), .in_a26_ready(multiplier_a26_ready), .in_a27_ready(multiplier_a27_ready), .in_a28_ready(multiplier_a28_ready),
        // in_b_ready
        .in_b1_ready(multiplier_b1_ready), .in_b2_ready(multiplier_b2_ready), .in_b3_ready(multiplier_b3_ready), .in_b4_ready(multiplier_b4_ready), .in_b5_ready(multiplier_b5_ready), .in_b6_ready(multiplier_b6_ready), .in_b7_ready(multiplier_b7_ready),
        .in_b8_ready(multiplier_b8_ready), .in_b9_ready(multiplier_b9_ready), .in_b10_ready(multiplier_b10_ready), .in_b11_ready(multiplier_b11_ready), .in_b12_ready(multiplier_b12_ready), .in_b13_ready(multiplier_b13_ready), .in_b14_ready(multiplier_b14_ready),
        .in_b15_ready(multiplier_b15_ready), .in_b16_ready(multiplier_b16_ready), .in_b17_ready(multiplier_b17_ready), .in_b18_ready(multiplier_b18_ready), .in_b19_ready(multiplier_b19_ready), .in_b20_ready(multiplier_b20_ready), .in_b21_ready(multiplier_b21_ready),
        .in_b22_ready(multiplier_b22_ready), .in_b23_ready(multiplier_b23_ready), .in_b24_ready(multiplier_b24_ready), .in_b25_ready(multiplier_b25_ready), .in_b26_ready(multiplier_b26_ready), .in_b27_ready(multiplier_b27_ready), .in_b28_ready(multiplier_b28_ready),
        // out
        .out1(multiplier_out1), .out2(multiplier_out2), .out3(multiplier_out3), .out4(multiplier_out4), .out5(multiplier_out5), .out6(multiplier_out6), .out7(multiplier_out7),
        .out8(multiplier_out8), .out9(multiplier_out9), .out10(multiplier_out10), .out11(multiplier_out11), .out12(multiplier_out12), .out13(multiplier_out13), .out14(multiplier_out14),
        .out15(multiplier_out15), .out16(multiplier_out16), .out17(multiplier_out17), .out18(multiplier_out18), .out19(multiplier_out19), .out20(multiplier_out20), .out21(multiplier_out21),
        .out22(multiplier_out22), .out23(multiplier_out23), .out24(multiplier_out24), .out25(multiplier_out25), .out26(multiplier_out26), .out27(multiplier_out27), .out28(multiplier_out28),
        // out_valid
        .out1_valid(multiplier_out1_valid), .out2_valid(multiplier_out2_valid), .out3_valid(multiplier_out3_valid), .out4_valid(multiplier_out4_valid), .out5_valid(multiplier_out5_valid), .out6_valid(multiplier_out6_valid), .out7_valid(multiplier_out7_valid),
        .out8_valid(multiplier_out8_valid), .out9_valid(multiplier_out9_valid), .out10_valid(multiplier_out10_valid), .out11_valid(multiplier_out11_valid), .out12_valid(multiplier_out12_valid), .out13_valid(multiplier_out13_valid), .out14_valid(multiplier_out14_valid),
        .out15_valid(multiplier_out15_valid), .out16_valid(multiplier_out16_valid), .out17_valid(multiplier_out17_valid), .out18_valid(multiplier_out18_valid), .out19_valid(multiplier_out19_valid), .out20_valid(multiplier_out20_valid), .out21_valid(multiplier_out21_valid),
        .out22_valid(multiplier_out22_valid), .out23_valid(multiplier_out23_valid), .out24_valid(multiplier_out24_valid), .out25_valid(multiplier_out25_valid), .out26_valid(multiplier_out26_valid), .out27_valid(multiplier_out27_valid), .out28_valid(multiplier_out28_valid)
    );
    
    parallel_float_to_fixed multiplier_to_fixed (
        .clk(clk),
        // in
        .in1(multiplier_out1), .in2(multiplier_out2), .in3(multiplier_out3), .in4(multiplier_out4), .in5(multiplier_out5), .in6(multiplier_out6), .in7(multiplier_out7),
        .in8(multiplier_out8), .in9(multiplier_out9), .in10(multiplier_out10), .in11(multiplier_out11), .in12(multiplier_out12), .in13(multiplier_out13), .in14(multiplier_out14),
        .in15(multiplier_out15), .in16(multiplier_out16), .in17(multiplier_out17), .in18(multiplier_out18), .in19(multiplier_out19), .in20(multiplier_out20), .in21(multiplier_out21),
        .in22(multiplier_out22), .in23(multiplier_out23), .in24(multiplier_out24), .in25(multiplier_out25), .in26(multiplier_out26), .in27(multiplier_out27), .in28(multiplier_out28),
        // in_valid
        .in1_valid(multiplier_out1_valid), .in2_valid(multiplier_out2_valid), .in3_valid(multiplier_out3_valid), .in4_valid(multiplier_out4_valid), .in5_valid(multiplier_out5_valid), .in6_valid(multiplier_out6_valid), .in7_valid(multiplier_out7_valid),
        .in8_valid(multiplier_out8_valid), .in9_valid(multiplier_out9_valid), .in10_valid(multiplier_out10_valid), .in11_valid(multiplier_out11_valid), .in12_valid(multiplier_out12_valid), .in13_valid(multiplier_out13_valid), .in14_valid(multiplier_out14_valid),
        .in15_valid(multiplier_out15_valid), .in16_valid(multiplier_out16_valid), .in17_valid(multiplier_out17_valid), .in18_valid(multiplier_out18_valid), .in19_valid(multiplier_out19_valid), .in20_valid(multiplier_out20_valid), .in21_valid(multiplier_out21_valid),
        .in22_valid(multiplier_out22_valid), .in23_valid(multiplier_out23_valid), .in24_valid(multiplier_out24_valid), .in25_valid(multiplier_out25_valid), .in26_valid(multiplier_out26_valid), .in27_valid(multiplier_out27_valid), .in28_valid(multiplier_out28_valid),
        // result_ready
        .result_1_ready(adder_to_float_in_ready), .result_2_ready(adder_to_float_in_ready), .result_3_ready(adder_to_float_in_ready), .result_4_ready(adder_to_float_in_ready), .result_5_ready(adder_to_float_in_ready), .result_6_ready(adder_to_float_in_ready), .result_7_ready(adder_to_float_in_ready),
        .result_8_ready(adder_to_float_in_ready), .result_9_ready(adder_to_float_in_ready), .result_10_ready(adder_to_float_in_ready), .result_11_ready(adder_to_float_in_ready), .result_12_ready(adder_to_float_in_ready), .result_13_ready(adder_to_float_in_ready), .result_14_ready(adder_to_float_in_ready),
        .result_15_ready(adder_to_float_in_ready), .result_16_ready(adder_to_float_in_ready), .result_17_ready(adder_to_float_in_ready), .result_18_ready(adder_to_float_in_ready), .result_19_ready(adder_to_float_in_ready), .result_20_ready(adder_to_float_in_ready), .result_21_ready(adder_to_float_in_ready),
        .result_22_ready(adder_to_float_in_ready), .result_23_ready(adder_to_float_in_ready), .result_24_ready(adder_to_float_in_ready), .result_25_ready(adder_to_float_in_ready), .result_26_ready(adder_to_float_in_ready), .result_27_ready(adder_to_float_in_ready), .result_28_ready(adder_to_float_in_ready),
        // in_ready
        .in1_ready(multiplier_to_fixed1_ready), .in2_ready(multiplier_to_fixed2_ready), .in3_ready(multiplier_to_fixed3_ready), .in4_ready(multiplier_to_fixed4_ready), .in5_ready(multiplier_to_fixed5_ready), .in6_ready(multiplier_to_fixed6_ready), .in7_ready(multiplier_to_fixed7_ready),
        .in8_ready(multiplier_to_fixed8_ready), .in9_ready(multiplier_to_fixed9_ready), .in10_ready(multiplier_to_fixed10_ready), .in11_ready(multiplier_to_fixed11_ready), .in12_ready(multiplier_to_fixed12_ready), .in13_ready(multiplier_to_fixed13_ready), .in14_ready(multiplier_to_fixed14_ready),
        .in15_ready(multiplier_to_fixed15_ready), .in16_ready(multiplier_to_fixed16_ready), .in17_ready(multiplier_to_fixed17_ready), .in18_ready(multiplier_to_fixed18_ready), .in19_ready(multiplier_to_fixed19_ready), .in20_ready(multiplier_to_fixed20_ready), .in21_ready(multiplier_to_fixed21_ready),
        .in22_ready(multiplier_to_fixed22_ready), .in23_ready(multiplier_to_fixed23_ready), .in24_ready(multiplier_to_fixed24_ready), .in25_ready(multiplier_to_fixed25_ready), .in26_ready(multiplier_to_fixed26_ready), .in27_ready(multiplier_to_fixed27_ready), .in28_ready(multiplier_to_fixed28_ready),
        // out
        .out1(multiplier_fixed_out1), .out2(multiplier_fixed_out2), .out3(multiplier_fixed_out3), .out4(multiplier_fixed_out4), .out5(multiplier_fixed_out5), .out6(multiplier_fixed_out6), .out7(multiplier_fixed_out7),
        .out8(multiplier_fixed_out8), .out9(multiplier_fixed_out9), .out10(multiplier_fixed_out10), .out11(multiplier_fixed_out11), .out12(multiplier_fixed_out12), .out13(multiplier_fixed_out13), .out14(multiplier_fixed_out14),
        .out15(multiplier_fixed_out15), .out16(multiplier_fixed_out16), .out17(multiplier_fixed_out17), .out18(multiplier_fixed_out18), .out19(multiplier_fixed_out19), .out20(multiplier_fixed_out20), .out21(multiplier_fixed_out21),
        .out22(multiplier_fixed_out22), .out23(multiplier_fixed_out23), .out24(multiplier_fixed_out24), .out25(multiplier_fixed_out25), .out26(multiplier_fixed_out26), .out27(multiplier_fixed_out27), .out28(multiplier_fixed_out28),
        // out_valid
        .out1_valid(multiplier_fixed_out1_valid), .out2_valid(multiplier_fixed_out2_valid), .out3_valid(multiplier_fixed_out3_valid), .out4_valid(multiplier_fixed_out4_valid), .out5_valid(multiplier_fixed_out5_valid), .out6_valid(multiplier_fixed_out6_valid), .out7_valid(multiplier_fixed_out7_valid),
        .out8_valid(multiplier_fixed_out8_valid), .out9_valid(multiplier_fixed_out9_valid), .out10_valid(multiplier_fixed_out10_valid), .out11_valid(multiplier_fixed_out11_valid), .out12_valid(multiplier_fixed_out12_valid), .out13_valid(multiplier_fixed_out13_valid), .out14_valid(multiplier_fixed_out14_valid),
        .out15_valid(multiplier_fixed_out15_valid), .out16_valid(multiplier_fixed_out16_valid), .out17_valid(multiplier_fixed_out17_valid), .out18_valid(multiplier_fixed_out18_valid), .out19_valid(multiplier_fixed_out19_valid), .out20_valid(multiplier_fixed_out20_valid), .out21_valid(multiplier_fixed_out21_valid),
        .out22_valid(multiplier_fixed_out22_valid), .out23_valid(multiplier_fixed_out23_valid), .out24_valid(multiplier_fixed_out24_valid), .out25_valid(multiplier_fixed_out25_valid), .out26_valid(multiplier_fixed_out26_valid), .out27_valid(multiplier_fixed_out27_valid), .out28_valid(multiplier_fixed_out28_valid)
    );
    
    parallel_accumulators accum (
        //.clk(clk), .clr(clr), .bypass(!multiplier_fixed_out1_valid), //FIXME
        .clk(clk), .clr(!multiplier_fixed_out1_valid), .bypass(0), //FIXME
        // in
        .in1(multiplier_fixed_out1), .in2(multiplier_fixed_out2), .in3(multiplier_fixed_out3), .in4(multiplier_fixed_out4), .in5(multiplier_fixed_out5), .in6(multiplier_fixed_out6), .in7(multiplier_fixed_out7),
        .in8(multiplier_fixed_out8), .in9(multiplier_fixed_out9), .in10(multiplier_fixed_out10), .in11(multiplier_fixed_out11), .in12(multiplier_fixed_out12), .in13(multiplier_fixed_out13), .in14(multiplier_fixed_out14),
        .in15(multiplier_fixed_out15), .in16(multiplier_fixed_out16), .in17(multiplier_fixed_out17), .in18(multiplier_fixed_out18), .in19(multiplier_fixed_out19), .in20(multiplier_fixed_out20), .in21(multiplier_fixed_out21),
        .in22(multiplier_fixed_out22), .in23(multiplier_fixed_out23), .in24(multiplier_fixed_out24), .in25(multiplier_fixed_out25), .in26(multiplier_fixed_out26), .in27(multiplier_fixed_out27), .in28(multiplier_fixed_out28),
        // out
        .out1(accumulator_out1), .out2(accumulator_out2), .out3(accumulator_out3), .out4(accumulator_out4), .out5(accumulator_out5), .out6(accumulator_out6), .out7(accumulator_out7),
        .out8(accumulator_out8), .out9(accumulator_out9), .out10(accumulator_out10), .out11(accumulator_out11), .out12(accumulator_out12), .out13(accumulator_out13), .out14(accumulator_out14),
        .out15(accumulator_out15), .out16(accumulator_out16), .out17(accumulator_out17), .out18(accumulator_out18), .out19(accumulator_out19), .out20(accumulator_out20), .out21(accumulator_out21),
        .out22(accumulator_out22), .out23(accumulator_out23), .out24(accumulator_out24), .out25(accumulator_out25), .out26(accumulator_out26), .out27(accumulator_out27), .out28(accumulator_out28)
    );
    
    adder_32bit adder(
        .in1(accumulator_out1), .in2(accumulator_out2), .in3(accumulator_out3), .in4(accumulator_out4), .in5(accumulator_out5), .in6(accumulator_out6), .in7(accumulator_out7),
        .in8(accumulator_out8), .in9(accumulator_out9), .in10(accumulator_out10), .in11(accumulator_out11), .in12(accumulator_out12), .in13(accumulator_out13), .in14(accumulator_out14),
        .in15(accumulator_out15), .in16(accumulator_out16), .in17(accumulator_out17), .in18(accumulator_out18), .in19(accumulator_out19), .in20(accumulator_out20), .in21(accumulator_out21),
        .in22(accumulator_out22), .in23(accumulator_out23), .in24(accumulator_out24), .in25(accumulator_out25), .in26(accumulator_out26), .in27(accumulator_out27), .in28(accumulator_out28),
        .out(adder_out)
    );
        
    fixed_to_float_converter adder_to_float (
        .aclk(clk),                                  // input wire aclk
        .s_axis_a_tvalid(multiplier_fixed_out1_valid),            // input wire s_axis_a_tvalid
        .s_axis_a_tready(adder_to_float_in_ready),            // output wire s_axis_a_tready
        .s_axis_a_tdata(adder_out),              // input wire [31 : 0] s_axis_a_tdata
        .m_axis_result_tvalid(adder_to_float_valid),  // output wire m_axis_result_tvalid
        .m_axis_result_tready(div_a_ready),  // input wire m_axis_result_tready
        .m_axis_result_tdata(adder_to_float_out)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    fixed_to_float_converter div_b_to_float (
        .aclk(clk),                                  // input wire aclk
        .s_axis_a_tvalid(1),            // input wire s_axis_a_tvalid
        .s_axis_a_tready(div_b_to_float_ready),            // output wire s_axis_a_tready
        .s_axis_a_tdata(32'd784 - 32'd1),              // input wire [31 : 0] s_axis_a_tdata
        .m_axis_result_tvalid(div_b_to_float_out_valid),  // output wire m_axis_result_tvalid
        .m_axis_result_tready(div_b_ready),  // input wire m_axis_result_tready
        .m_axis_result_tdata(div_b_converter_out)    // output wire [31 : 0] m_axis_result_tdat 
    );
    
    divider_floating_point div (
       .aclk(clk),                                  // input wire aclk         
       .s_axis_a_tvalid(adder_to_float_valid),  // input wire s_axis_a_tvalid
       .s_axis_a_tready(div_a_ready),            // output wire s_axis_a_tready          
       .s_axis_a_tdata(adder_to_float_out),     // input wire [31 : 0] s_axis_a_tdata
       .s_axis_b_tvalid(div_b_to_float_out_valid),            // input wire s_axis_b_tvalid
       .s_axis_b_tready(div_b_ready),            // output wire s_axis_b_tready
       .s_axis_b_tdata(div_b_converter_out),              // input wire [31 : 0] s_axis_b_tdata
       .m_axis_result_tvalid(divider_valid),  // output wire m_axis_result_tvalid
       .m_axis_result_tready(result_ready),    // input wire m_axis_result_tready
       .m_axis_result_tdata(out)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    counter #(.NUM(NUM_INPUTS)) c(
        .clk(clk),
        .rst(clr || !divider_valid),
        .start(divider_valid),
        .done(out_valid)
    );
    
endmodule
