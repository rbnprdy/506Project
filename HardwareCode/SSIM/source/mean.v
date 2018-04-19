`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// mean.v
// Created by Ruben Purdy on 03/27/2018 10:46:40 PM
//////////////////////////////////////////////////////////////////////////////////

/*
    Takes in one pixel at a time and finds the running mean
    
    - inputs:
        - [7:0] in: An 8 bit integer pixel value (grayscale between 0 and 255).
        - clr: Clears the buffer and registers. Set to 1 when done with image calculations.
        - clk: The clock.
        - in_valid: Indicates whether the input data is valid.
        - result_ready: Indicates whether the outside world is ready for the result.
    - outputs:
        - in_ready: Indicates whether the module is ready for input.
        - [31:0] out: The mean in single point precision floating point.
        - out_valid: Indicates whether the output is valid.
    - parameters:
        - NUM_INPUTS: The number of inputs that are going to be sent to the module.
                      Defaults to 784 (the number of pixels per image).
        
*/
module mean #(parameter NUM_INPUTS = 784)(in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, in22, in23, in24, in25, in26, in27, in28, 
clr, clk, in_valid, result_ready, in_ready, out, out_valid);
    
    input [7:0] in1, in2, in3, in4, in5, in6, in7;
    input [7:0] in8, in9, in10, in11, in12, in13, in14;
    input [7:0] in15, in16, in17, in18, in19, in20, in21;
    input [7:0] in22, in23, in24, in25, in26, in27, in28; // 8-bits to represent 256 possible pixel values
    input clr, clk, in_valid, result_ready;
    
    output in_ready, out_valid;
    output [31:0] out;

    wire a_valid, b_ready, b_valid, out_a_ready, out_b_ready, div_valid;
    wire [31:0] accumulator1_out, accumulator2_out, accumulator3_out, accumulator4_out, accumulator5_out, accumulator6_out, accumulator7_out;
    wire [31:0] accumulator8_out, accumulator9_out, accumulator10_out, accumulator11_out, accumulator12_out, accumulator13_out, accumulator14_out;    
    wire [31:0] accumulator15_out, accumulator16_out, accumulator17_out, accumulator18_out, accumulator19_out, accumulator20_out, accumulator21_out;
    wire [31:0] accumulator22_out, accumulator23_out, accumulator24_out, accumulator25_out, accumulator26_out, accumulator27_out, accumulator28_out;
    wire [31:0] adder_out, converter_out, div_converter_out;
    
    parallel_accumulators #(.BIT_WIDTH(8)) acc(
        .clk(clk),
        .clr(clr),
        .bypass(!in_valid),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .in4(in4),
        .in5(in5),
        .in6(in6),
        .in7(in7),
        .in8(in8),
        .in9(in9),
        .in10(in10),
        .in11(in11),
        .in12(in12),
        .in13(in13),
        .in14(in14),       
        .in15(in15),
        .in16(in16),
        .in17(in17),
        .in18(in18),
        .in19(in19),
        .in20(in20),
        .in21(in21),
        .in22(in22),
        .in23(in23),
        .in24(in24),
        .in25(in25),
        .in26(in26),
        .in27(in27),
        .in28(in28),
        .out1(accumulator1_out),
        .out2(accumulator2_out),
        .out3(accumulator3_out),
        .out4(accumulator4_out),
        .out5(accumulator5_out),
        .out6(accumulator6_out),
        .out7(accumulator7_out),
        .out8(accumulator8_out),
        .out9(accumulator9_out),
        .out10(accumulator10_out),
        .out11(accumulator11_out),
        .out12(accumulator12_out),
        .out13(accumulator13_out),
        .out14(accumulator14_out), 
        .out15(accumulator15_out),
        .out16(accumulator16_out),
        .out17(accumulator17_out),
        .out18(accumulator18_out),
        .out19(accumulator19_out),
        .out20(accumulator20_out),
        .out21(accumulator21_out),
        .out22(accumulator22_out),
        .out23(accumulator23_out),
        .out24(accumulator24_out),
        .out25(accumulator25_out),
        .out26(accumulator26_out),
        .out27(accumulator27_out),
        .out28(accumulator28_out)
    );
    
    adder_32bit adder(
        .in1(accumulator1_out),
        .in2(accumulator2_out),
        .in3(accumulator3_out),
        .in4(accumulator4_out),
        .in5(accumulator5_out),
        .in6(accumulator6_out),
        .in7(accumulator7_out),
        .in8(accumulator8_out),
        .in9(accumulator9_out),
        .in10(accumulator10_out),
        .in11(accumulator11_out),
        .in12(accumulator12_out),
        .in13(accumulator13_out),
        .in14(accumulator14_out),
        .in15(accumulator15_out),
        .in16(accumulator16_out),
        .in17(accumulator17_out),
        .in18(accumulator18_out),
        .in19(accumulator19_out),
        .in20(accumulator20_out),
        .in21(accumulator21_out),
        .in22(accumulator22_out),
        .in23(accumulator23_out),
        .in24(accumulator24_out),
        .in25(accumulator25_out),
        .in26(accumulator26_out),
        .in27(accumulator27_out),
        .in28(accumulator28_out),
        .out(adder_out)
    );
    
    fixed_to_float_converter accumulator_to_float (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(in_valid),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(in_ready),            // output wire s_axis_a_tready
      .s_axis_a_tdata(adder_out),              // input wire [31 : 0] s_axis_a_tdata
      .m_axis_result_tvalid(a_valid),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(out_a_ready),  // input wire m_axis_result_tready
      .m_axis_result_tdata(converter_out)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    fixed_to_float_converter div_to_float (
        .aclk(clk),                                  // input wire aclk
        .s_axis_a_tvalid(1),            // input wire s_axis_a_tvalid
        .s_axis_a_tready(b_ready),            // output wire s_axis_a_tready
        .s_axis_a_tdata(NUM_INPUTS),              // input wire [31 : 0] s_axis_a_tdata
        .m_axis_result_tvalid(b_valid),  // output wire m_axis_result_tvalid
        .m_axis_result_tready(out_b_ready),  // input wire m_axis_result_tready
        .m_axis_result_tdata(div_converter_out)    // output wire [31 : 0] m_axis_result_tdat 
    );
    
    divider_floating_point div (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(a_valid),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(out_a_ready),            // output wire s_axis_a_tready
      .s_axis_a_tdata(converter_out),              // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(b_valid),            // input wire s_axis_b_tvalid
      .s_axis_b_tready(out_b_ready),            // output wire s_axis_b_tready
      .s_axis_b_tdata(div_converter_out),              // input wire [31 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(div_valid),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(result_ready),  // input wire m_axis_result_tready
      .m_axis_result_tdata(out)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    counter #(.NUM(NUM_INPUTS/28)) c(
        .clk(clk),
        .rst(clr),
        .start(div_valid),
        .done(out_valid)
    );
    
endmodule
