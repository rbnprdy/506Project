`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// ssim.v
// Created by Ruben Purdy on 03/27/2018 10:46:40 PM
//////////////////////////////////////////////////////////////////////////////////

/*
    Calculates the SSIM between two images. The first image is stored in input_mem x. The second image should
    be stored as the pixel values subtracted by the mean in input_mem_y y.
    
    - inputs:
        - [31:0] mean_y: The mean value for the y image, in floating point.
        - mean_y_valid: Indicates whether the mean y value is valid.
        - [31:0] std_y: The std value for the y image, in floating point.
        - std_y_valid: Indicates whether the std y value is valid.
        - clk: The clock.
        - clr: A clear signal.
    - outputs:
        - [31:0] The SSIM between the two images, in floating point.
        - out_valid: Indicates whether the output is valid.
    - parameters:
        - NUM_INPUTS: The number of pixels in each image. Defaults to 784.
*/

module ssim #(parameter NUM_INPUTS = 784, NUM_ENTRIES = 784 / 28, ADDRESS_WIDTH = 5)(clk, rst, clr, num, next_image, out, out_valid);
    
    input clk, rst, clr, next_image;
    input [3:0] num;
    output [31:0] out;
    output out_valid;
   
    // x memories outputs
    wire [7:0] x1_out, x2_out, x3_out, x4_out, x5_out, x6_out, x7_out; 
    wire [7:0] x8_out, x9_out, x10_out, x11_out, x12_out, x13_out, x14_out;
    wire [7:0] x15_out, x16_out, x17_out, x18_out, x19_out, x20_out, x21_out;
    wire [7:0]x22_out, x23_out, x24_out, x25_out, x26_out, x27_out, x28_out;
    
    wire [7:0] b1, b2, b3, b4, b5, b6, b7;
    wire [7:0] b8, b9, b10, b11, b12, b13, b14; 
    wire [7:0] b15, b16, b17, b18, b19, b20, b21;
    wire [7:0] b22, b23, b24, b25, b26, b27, b28;
    
    wire x_valid, b_valid;
        
    // y memories outputs
    wire [31:0] y1, y2, y3, y4, y5, y6, y7;
    wire [31:0] y8, y9, y10, y11, y12, y13, y14;
    wire [31:0] y15, y16, y17, y18, y19, y20, y21;
    wire [31:0] y22, y23, y24, y25, y26, y27, y28;
    
    wire y_valid;
    
    wire [31:0] mean_y, std_y;
    
    // mean outputs
    wire mean_in_ready, mean_x_valid;
    wire [31:0] mean_x;
    
    // standard deviation outputs
    wire stdev_in_ready, std_x_valid;
    wire [31:0] std_x;
    
    // covariance outputs
    wire covar_in_ready, covar_y_ready, covar_valid;
    wire [31:0] covar;
    
    // luminance comparison outputs
    wire mean_x_ready, mean_y_ready, l_valid;
    wire [31:0] l_out;
    
    // contrast comparison outputs
    wire std_x_ready_contrast, std_y_ready_contrast, c_valid;
    wire [31:0] c_out;
    
    // structure comparison outputs
    wire std_x_ready_structure, std_y_ready_structure, covar_ready, s_valid;
    wire [31:0] s_out;
    
    // l times c outputs
    wire l_times_c_a_ready, l_times_c_b_ready, l_times_c_valid;
    wire [31:0] l_times_c_out;
    
    // l times c times s outputs
    wire l_times_c_times_s_a_ready, l_times_c_times_s_b_ready, l_times_c_times_s_valid;
    
    parallel_input_memories #(.NUM_ENTRIES(28*3), .ADDRESS_BIT_WIDTH(7)) mems_x(
        .clk(clk), 
        .rst(rst), 
        .next_image(next_image),
        .start_a(mean_in_ready & !clr), 
        .start_b(mean_x_valid & !clr), 
        .valid_a(x_valid),
        .valid_b(b_valid), 
        .out_a1(x1_out), .out_a2(x2_out), .out_a3(x3_out), .out_a4(x4_out), .out_a5(x5_out), .out_a6(x6_out), .out_a7(x7_out), 
        .out_a8(x8_out), .out_a9(x9_out), .out_a10(x10_out), .out_a11(x11_out), .out_a12(x12_out), .out_a13(x13_out), .out_a14(x14_out), 
        .out_a15(x15_out), .out_a16(x16_out), .out_a17(x17_out), .out_a18(x18_out), .out_a19(x19_out), .out_a20(x20_out), .out_a21(x21_out), 
        .out_a22(x22_out), .out_a23(x23_out), .out_a24(x24_out), .out_a25(x25_out), .out_a26(x26_out), .out_a27(x27_out), .out_a28(x28_out),
        .out_b1(b1), .out_b2(b2), .out_b3(b3), .out_b4(b4), .out_b5(b5), .out_b6(b6), .out_b7(b7), 
        .out_b8(b8), .out_b9(b9), .out_b10(b10), .out_b11(b11), .out_b12(b12), .out_b13(b13), .out_b14(b14), 
        .out_b15(b15), .out_b16(b16), .out_b17(b17), .out_b18(b18), .out_b19(b19), .out_b20(b20), .out_b21(b21), 
        .out_b22(b22), .out_b23(b23), .out_b24(b24), .out_b25(b25), .out_b26(b26), .out_b27(b27), .out_b28(b28)
    );
    
//    parallel_input_memories_y #(.NUM("5"), .NUM_ENTRIES(28), .ADDRESS_BIT_WIDTH(5)) mems_y(
//        .clk(clk),
//        .rst(clr),
//        .start_a(covar_y_ready),
//        .start_b(0),
//        .valid_a(y_valid),
//        .out_a1(y1), .out_a2(y2), .out_a3(y3), .out_a4(y4), .out_a5(y5), .out_a6(y6), .out_a7(y7),
//        .out_a8(y8), .out_a9(y9), .out_a10(y10), .out_a11(y11), .out_a12(y12), .out_a13(y13), .out_a14(y14),
//        .out_a15(y15), .out_a16(y16), .out_a17(y17), .out_a18(y18), .out_a19(y19), .out_a20(y20), .out_a21(y21),
//        .out_a22(y22), .out_a23(y23), .out_a24(y24), .out_a25(y25), .out_a26(y26), .out_a27(y27), .out_a28(y28)
//    );
    
    average_memories mems_y(
        .clk(clk),
        .clr(clr),
        .num(num),
        .start_a(covar_y_ready),
        .out_valid(y_valid),
        .out_a1(y1), .out_a2(y2), .out_a3(y3), .out_a4(y4), .out_a5(y5), .out_a6(y6), .out_a7(y7),
        .out_a8(y8), .out_a9(y9), .out_a10(y10), .out_a11(y11), .out_a12(y12), .out_a13(y13), .out_a14(y14),
        .out_a15(y15), .out_a16(y16), .out_a17(y17), .out_a18(y18), .out_a19(y19), .out_a20(y20), .out_a21(y21),
        .out_a22(y22), .out_a23(y23), .out_a24(y24), .out_a25(y25), .out_a26(y26), .out_a27(y27), .out_a28(y28),
        .mean(mean_y), .stdev(std_y)
    );
    
    mean #(.NUM_INPUTS(NUM_INPUTS)) m(
        .in1(x1_out), .in2(x2_out), .in3(x3_out), .in4(x4_out), .in5(x5_out), .in6(x6_out), .in7(x7_out),
        .in8(x8_out), .in9(x9_out), .in10(x10_out), .in11(x11_out), .in12(x12_out), .in13(x13_out), .in14(x14_out),        
        .in15(x15_out), .in16(x16_out), .in17(x17_out), .in18(x18_out), .in19(x19_out), .in20(x20_out), .in21(x21_out),
        .in22(x22_out), .in23(x23_out), .in24(x24_out), .in25(x25_out), .in26(x26_out), .in27(x27_out), .in28(x28_out),
        .clr(clr), 
        .clk(clk), 
        .in_valid(x_valid),
        .result_ready(1'b1),
        //.result_ready(stdev_in_ready),
        .in_ready(mean_in_ready),
        .out(mean_x), 
        .out_valid(mean_x_valid)
    );

    stdev #(.NUM_INPUTS(28)) s(
        .in1(b1), .in2(b2), .in3(b3), .in4(b4), .in5(b5), .in6(b6), .in7(b7),
        .in8(b8), .in9(b9), .in10(b10), .in11(b11), .in12(b12), .in13(b13), .in14(b14),
        .in15(b15), .in16(b16), .in17(b17), .in18(b18), .in19(b19), .in20(b20), .in21(b21),
        .in22(b22), .in23(b23), .in24(b24), .in25(b25), .in26(b26), .in27(b27), .in28(b28),
        .u(mean_x), 
        .clk(clk), 
        .clr(clr), 
        //.in_valid(mean_x_valid), 
        .in_valid(b_valid), 
        .u_valid(mean_x_valid), 
        .result_ready(1'b1),
        .in_ready(stdev_in_ready),
        .out(std_x), 
        .out_valid(std_x_valid)
    );
    
    covariance #(.NUM_INPUTS(28)) c(
        .in1(b1), .in2(b2), .in3(b3), .in4(b4), .in5(b5), .in6(b6), .in7(b7),
        .in8(b8), .in9(b9), .in10(b10), .in11(b11), .in12(b12), .in13(b13), .in14(b14),
        .in15(b15), .in16(b16), .in17(b17), .in18(b18), .in19(b19), .in20(b20), .in21(b21),
        .in22(b22), .in23(b23), .in24(b24), .in25(b25), .in26(b26), .in27(b27), .in28(b28),
        .in_y1(y1), .in_y2(y2), .in_y3(y3), .in_y4(y4), .in_y5(y5), .in_y6(y6), .in_y7(y7),
        .in_y8(y8), .in_y9(y9), .in_y10(y10), .in_y11(y11), .in_y12(y12), .in_y13(y13), .in_y14(y14),
        .in_y15(y15), .in_y16(y16), .in_y17(y17), .in_y18(y18), .in_y19(y19), .in_y20(y20), .in_y21(y21),
        .in_y22(y22), .in_y23(y23), .in_y24(y24), .in_y25(y25), .in_y26(y26), .in_y27(y27), .in_y28(y28),
        .u(mean_x), 
        .clk(clk), 
        .clr(clr), 
        .in_valid(b_valid), 
        .u_valid(mean_x_valid), 
        .in_y_valid(y_valid),
        .result_ready(1'b1),
        .in_ready(covar_in_ready),
        .in_y_ready(covar_y_ready),
        .out(covar), 
        .out_valid(covar_valid)
    );
    
    luminance_comp l_comp(
        .clk(clk), 
        .clr(clr),
        .mean_x(mean_x), 
        .mean_y(mean_y), 
        .mean_x_valid(mean_x_valid), 
        .mean_y_valid(1'b1), 
        .out_ready(1'b1), 
        .mean_x_ready(mean_x_ready), 
        .mean_y_ready(mean_y_ready), 
        .out(l_out), 
        .out_valid(l_valid)
    );
    
    contrast_comp c_comp(
        .clk(clk), 
        .clr(clr),
        .std_x(std_x), 
        .std_y(std_y), 
        .std_x_valid(std_x_valid), 
        .std_y_valid(1'b1), 
        .out_ready(1'b1), 
        .std_x_ready(std_x_ready_contrast), 
        .std_y_ready(std_y_ready_contrast), 
        .out(c_out), 
        .out_valid(c_valid)
    );
    
    structure_comp s_comp(
        .clk(clk), 
        .clr(clr),
        .std_x(std_x), 
        .std_y(std_y), 
        .covariance(covar),
        .std_x_valid(std_x_valid), 
        .std_y_valid(1'b1), 
        .covariance_valid(covar_valid),
        .out_ready(1'b1), 
        .std_x_ready(std_x_ready_structure), 
        .std_y_ready(std_y_ready_structure), 
        .covariance_ready(covar_ready),
        .out(s_out), 
        .out_valid(s_valid)
    );
    
    multiplier_floating_point l_times_c (
      .aclk(clk),                                  // input wire aclk
      .aresetn(!clr), 
      .s_axis_a_tvalid(l_valid),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(l_times_c_a_ready),            // output wire s_axis_a_tready
      .s_axis_a_tdata(l_out),              // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(c_valid),            // input wire s_axis_b_tvalid
      .s_axis_b_tready(l_times_c_b_ready),            // output wire s_axis_b_tready
      .s_axis_b_tdata(c_out),              // input wire [31 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(l_times_c_valid),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(1'b1),  // input wire m_axis_result_tready
      .m_axis_result_tdata(l_times_c_out)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    multiplier_floating_point l_times_c_times_s (
      .aclk(clk),                                  // input wire aclk
      .aresetn(!clr), 
      .s_axis_a_tvalid(l_times_c_valid),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(l_times_c_times_s_a_ready),            // output wire s_axis_a_tready
      .s_axis_a_tdata(l_times_c_out),              // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(s_valid),            // input wire s_axis_b_tvalid
      .s_axis_b_tready(l_times_c_times_s_b_ready),            // output wire s_axis_b_tready
      .s_axis_b_tdata(s_out),              // input wire [31 : 0] s_axis_b_tdata
      //.m_axis_result_tvalid(l_times_c_times_s_valid),  // output wire m_axis_result_tvalid
      .m_axis_result_tvalid(out_valid),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(1'b1),  // input wire m_axis_result_tready
      .m_axis_result_tdata(out)    // output wire [31 : 0] m_axis_result_tdata
    );
    
//    delay_register valid_delay(
//        .clk(clk),
//        .clr(clr),
//        .in(l_times_c_times_s_valid),
//        .out(out_valid)
//    );
    
endmodule
