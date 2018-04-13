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
        - [31:0] out: The running mean in single point precision floating point.
        - out_valid: Indicates whether the output is valid.
    - parameters:
        - NUM_INPUTS: The number of inputs that are going to be sent to the module.
                      Defaults to 784 (the number of pixels per image).
        
*/
module mean #(parameter NUM_INPUTS = 784)(in, clr, clk, in_valid, result_ready, in_ready, out, out_valid);
    
    input [7:0] in; // 8-bits to represent 256 possible pixel values
    input clr, clk, in_valid, result_ready;
    output in_ready, out_valid;
    output [31:0] out;

    wire a_valid, b_ready, b_valid, out_a_ready, out_b_ready, div_valid;
    wire [31:0] accumulator_out, converter_out, div_converter_out;
    
    c_accum_0 accumulator (
      .B(in),            // input wire [7 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(!in_valid),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(accumulator_out)            // output wire [31 : 0] Q
    );
    
    fixed_to_float accumulator_to_float (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(in_valid),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(in_ready),            // output wire s_axis_a_tready
      .s_axis_a_tdata(accumulator_out),              // input wire [31 : 0] s_axis_a_tdata
      .m_axis_result_tvalid(a_valid),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(out_a_ready),  // input wire m_axis_result_tready
      .m_axis_result_tdata(converter_out)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    fixed_to_float div_to_float (
        .aclk(clk),                                  // input wire aclk
        .s_axis_a_tvalid(1),            // input wire s_axis_a_tvalid
        .s_axis_a_tready(b_ready),            // output wire s_axis_a_tready
        .s_axis_a_tdata(NUM_INPUTS),              // input wire [31 : 0] s_axis_a_tdata
        .m_axis_result_tvalid(b_valid),  // output wire m_axis_result_tvalid
        .m_axis_result_tready(out_b_ready),  // input wire m_axis_result_tready
        .m_axis_result_tdata(div_converter_out)    // output wire [31 : 0] m_axis_result_tdat 
    );
    
    divider_float div (
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
    
    counter #(.NUM(NUM_INPUTS)) c(
        .clk(clk),
        .rst(clr),
        .start(div_valid),
        .done(out_valid)
    );
    
endmodule
