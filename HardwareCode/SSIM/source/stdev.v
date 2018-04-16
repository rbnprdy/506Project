`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// stdev.v
// Created by Ruben Purdy on 03/27/2018 10:46:40 PM
//////////////////////////////////////////////////////////////////////////////////

/*
    Takes the standard deviation of the inputs values given their mean.
    
    - inputs:
        - [31:0] in: An integer pixel value (grayscale between 0 and 255).
        - [31:0] u: The mean for the input data.
        - clr: Clears the buffer and registers. Set to 1 when done with image calculations.
        - clk: The clock.
        - in_valid: Indicates whether the input data is valid.
        - u_valid: Indicates whether the mean is valid
        - result_ready: Indicates whether the outside world is ready for the result.
    - outputs:
        - in_ready: Indicates whether the module is ready for input.
        - [31:0] out: The standard deviation in single point precision floating point.
        - out_valid: Indicates whether the output is valid.
    - parameters:
        - NUM_INPUTS: The number of inputs that are going to be sent to the module.
                      Defaults to 784 (the number of pixels per image).
*/
module stdev #(parameter NUM_INPUTS = 784)(in, u, clk, clr, in_valid, u_valid, result_ready, in_ready, out, out_valid);
    input [31:0] in, u;
    input clk, clr, in_valid, u_valid, result_ready;
    
    output [31:0] out;
    output out_valid, in_ready;
    
    wire [31:0] x, subtractor_out, multiplier_out, accumulator_out, div_converter_out, divider_out, fixed_out, d_out;
    wire x_valid;
    wire sub_a_ready, sub_b_ready, sub_valid;
    wire multiplier_a_ready, multiplier_b_ready, multiplier_valid;
    wire b_valid;
    wire div_a_ready, div_b_ready, divider_valid;
    wire fixed_ready, fixed_valid;
    wire accum_to_float_in_ready, accum_to_float_valid;
    wire [31:0] accum_to_float_out;
    wire square_root_a_ready, square_root_valid;
    wire data_counter_done, div_to_float_ready;
    
    fixed_to_float_converter in_to_float (
        .aclk(clk),                                  // input wire aclk
        .s_axis_a_tvalid(in_valid),            // input wire s_axis_a_tvalid
        .s_axis_a_tready(in_ready),            // output wire s_axis_a_tready
        .s_axis_a_tdata(in),              // input wire [31 : 0] s_axis_a_tdata
        .m_axis_result_tvalid(x_valid),  // output wire m_axis_result_tvalid
        .m_axis_result_tready(sub_a_ready),  // input wire m_axis_result_tready
        .m_axis_result_tdata(x)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    subtractor_floating_point sub (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(x_valid),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(sub_a_ready),            // output wire s_axis_a_tready
      .s_axis_a_tdata(x),              // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(u_valid),            // input wire s_axis_b_tvalid
      .s_axis_b_tready(sub_b_ready),            // output wire s_axis_b_tready
      .s_axis_b_tdata(u),              // input wire [31 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(sub_valid),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(multiplier_a_ready && multiplier_b_ready),  // input wire m_axis_result_tready
      .m_axis_result_tdata(subtractor_out)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    //data_counter #(.BIT_WIDTH(32), .NUM(NUM_INPUTS - 1)) d (
    data_counter #(.BIT_WIDTH(32), .NUM(NUM_INPUTS)) d (
        .in(subtractor_out),
        .clk(clk),
        .ready(sub_valid),
        .clr(clr),
        .out(d_out),
        .done(data_counter_done)
    );
        
    multiplier_floating_point mult (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(sub_valid),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(multiplier_a_ready),            // output wire s_axis_a_tready
      .s_axis_a_tdata(d_out),              // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(sub_valid),            // input wire s_axis_b_tvalid
      .s_axis_b_tready(multiplier_b_ready),            // output wire s_axis_b_tready
      .s_axis_b_tdata(subtractor_out),              // input wire [31 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(multiplier_valid),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(fixed_ready),  // input wire m_axis_result_tready
      .m_axis_result_tdata(multiplier_out)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    float_to_fixed_converter mult_to_fixed (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(multiplier_valid),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(fixed_ready),            // output wire s_axis_a_tready
      .s_axis_a_tdata(multiplier_out),              // input wire [31 : 0] s_axis_a_tdata
      .m_axis_result_tvalid(fixed_valid),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(accum_to_float_in_ready),  // input wire m_axis_result_tready
      .m_axis_result_tdata(fixed_out)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    accumulator_32bit accumulator (
      .B(fixed_out),      // input wire [31 : 0] B
      .CLK(clk),  // input wire CLK
      .BYPASS(!fixed_valid),
      .Q(accumulator_out)      // output wire [31 : 0] Q
    );
        
    fixed_to_float_converter accumulator_to_float (
        .aclk(clk),                                  // input wire aclk
        .s_axis_a_tvalid(multiplier_valid),            // input wire s_axis_a_tvalid
        .s_axis_a_tready(accum_to_float_in_ready),            // output wire s_axis_a_tready
        .s_axis_a_tdata(accumulator_out),              // input wire [31 : 0] s_axis_a_tdata
        .m_axis_result_tvalid(accum_to_float_valid),  // output wire m_axis_result_tvalid
        .m_axis_result_tready(div_a_ready),  // input wire m_axis_result_tready
        .m_axis_result_tdata(accum_to_float_out)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    fixed_to_float_converter div_to_float (
        .aclk(clk),                                  // input wire aclk
        .s_axis_a_tvalid(1),            // input wire s_axis_a_tvalid
        .s_axis_a_tready(div_to_float_ready),            // output wire s_axis_a_tready
        .s_axis_a_tdata(NUM_INPUTS - 32'd1),              // input wire [31 : 0] s_axis_a_tdata
        .m_axis_result_tvalid(b_valid),  // output wire m_axis_result_tvalid
        .m_axis_result_tready(div_b_ready),  // input wire m_axis_result_tready
        .m_axis_result_tdata(div_converter_out)    // output wire [31 : 0] m_axis_result_tdat 
    );
    
    divider_floating_point div (
       .aclk(clk),                                  // input wire aclk         
       .s_axis_a_tvalid(accum_to_float_valid),  // input wire s_axis_a_tvalid
       .s_axis_a_tready(div_a_ready),            // output wire s_axis_a_tready          
       .s_axis_a_tdata(accum_to_float_out),     // input wire [31 : 0] s_axis_a_tdata
       .s_axis_b_tvalid(b_valid),            // input wire s_axis_b_tvalid
       .s_axis_b_tready(div_b_ready),            // output wire s_axis_b_tready
       .s_axis_b_tdata(div_converter_out),              // input wire [31 : 0] s_axis_b_tdata
       .m_axis_result_tvalid(divider_valid),  // output wire m_axis_result_tvalid
       .m_axis_result_tready(square_root_a_ready),    // input wire m_axis_result_tready
       .m_axis_result_tdata(divider_out)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    square_root_floating_point sqrt (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(divider_valid),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(square_root_a_ready),            // output wire s_axis_a_tready
      .s_axis_a_tdata(divider_out),              // input wire [31 : 0] s_axis_a_tdata
      .m_axis_result_tvalid(square_root_valid),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(result_ready),  // input wire m_axis_result_tready
      .m_axis_result_tdata(out)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    counter #(.NUM(NUM_INPUTS - 1)) c(
        .clk(clk),
        .rst(clr),
        .start(square_root_valid),
        .done(out_valid)
    );
    
endmodule
