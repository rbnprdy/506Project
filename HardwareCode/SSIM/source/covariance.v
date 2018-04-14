`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2018 09:40:54 PM
// Design Name: 
// Module Name: covariance
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


module covariance #(parameter NUM_INPUTS = 784)(in_x, u_x, in_y, clk, clr, in_x_valid, u_x_valid, in_y_valid, in_y_ready, out, out_valid);

    input [31:0] in_x, u_x, in_y;
    input clk, clr, in_x_valid, u_x_valid, in_y_valid;
    
    output [31:0] out;
    output in_y_ready, out_valid;
    
    wire [31:0] x, subtractor_out, multiplier_out, accumulator_out, div_converter_out, fixed_out, d_out;
    wire x_ready, x_valid;
    wire sub_a_ready, sub_b_ready, sub_valid;
    wire multiplier_a_ready, multiplier_b_ready, multiplier_valid;
    wire b_valid;
    wire div_a_ready, div_b_ready, divider_valid;
    wire fixed_ready, fixed_valid;
    wire accum_to_float_in_ready, accum_to_float_valid;
    wire [31:0] accum_to_float_out;
    
    assign in_y_ready = sub_valid;
    
    fixed_to_float in_to_float (
        .aclk(clk),                                  // input wire aclk
        .s_axis_a_tvalid(in_x_valid),            // input wire s_axis_a_tvalid
        .s_axis_a_tready(x_ready),            // output wire s_axis_a_tready
        .s_axis_a_tdata(in_x),              // input wire [31 : 0] s_axis_a_tdata
        .m_axis_result_tvalid(x_valid),  // output wire m_axis_result_tvalid
        .m_axis_result_tready(sub_a_ready),  // input wire m_axis_result_tready
        .m_axis_result_tdata(x)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    subtractor_float sub (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(x_valid),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(sub_a_ready),            // output wire s_axis_a_tready
      .s_axis_a_tdata(x),              // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(u_x_valid),            // input wire s_axis_b_tvalid
      .s_axis_b_tready(sub_b_ready),            // output wire s_axis_b_tready
      .s_axis_b_tdata(u_x),              // input wire [31 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(sub_valid),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(multiplier_a_ready && multiplier_b_ready),  // input wire m_axis_result_tready
      .m_axis_result_tdata(subtractor_out)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    data_counter #(.BIT_WIDTH(32), .NUM(NUM_INPUTS)) d (
        .in(subtractor_out),
        .clk(clk),
        .ready(sub_valid),
        .clr(clr),
        .out(d_out)
    );
        
    multiplier_float mult (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(sub_valid),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(multiplier_a_ready),            // output wire s_axis_a_tready
      .s_axis_a_tdata(d_out),              // input wire [31 : 0] 
      .s_axis_b_tvalid(in_y_valid),            // input wire s_axis_b_tvalid
      .s_axis_b_tready(multiplier_b_ready),            // output wire s_axis_b_tready
      .s_axis_b_tdata(in_y),              // input wire [31 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(multiplier_valid),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(fixed_ready),  // input wire m_axis_result_tready
      .m_axis_result_tdata(multiplier_out)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    float_to_fixed mult_to_fixed (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(multiplier_valid),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(fixed_ready),            // output wire s_axis_a_tready
      .s_axis_a_tdata(multiplier_out),              // input wire [31 : 0] s_axis_a_tdata
      .m_axis_result_tvalid(fixed_valid),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(accum_to_float_in_ready),  // input wire m_axis_result_tready
      .m_axis_result_tdata(fixed_out)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    accumulator_32_bit accumulator (
      .B(fixed_out),      // input wire [31 : 0] B
      .CLK(clk),  // input wire CLK
      .BYPASS(!fixed_valid),
      .Q(accumulator_out)      // output wire [31 : 0] Q
    );
        
    fixed_to_float accumulator_to_float (
        .aclk(clk),                                  // input wire aclk
        .s_axis_a_tvalid(multiplier_valid),            // input wire s_axis_a_tvalid
        .s_axis_a_tready(accum_to_float_in_ready),            // output wire s_axis_a_tready
        .s_axis_a_tdata(accumulator_out),              // input wire [31 : 0] s_axis_a_tdata
        .m_axis_result_tvalid(accum_to_float_valid),  // output wire m_axis_result_tvalid
        .m_axis_result_tready(div_a_ready),  // input wire m_axis_result_tready
        .m_axis_result_tdata(accum_to_float_out)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    fixed_to_float div_to_float (
        .aclk(clk),                                  // input wire aclk
        .s_axis_a_tvalid(1),            // input wire s_axis_a_tvalid
        .s_axis_a_tdata(NUM_INPUTS - 32'd1),              // input wire [31 : 0] s_axis_a_tdata
        .m_axis_result_tvalid(b_valid),  // output wire m_axis_result_tvalid
        .m_axis_result_tready(div_b_ready),  // input wire m_axis_result_tready
        .m_axis_result_tdata(div_converter_out)    // output wire [31 : 0] m_axis_result_tdat 
    );
    
    divider_float div (
       .aclk(clk),                                  // input wire aclk         
       .s_axis_a_tvalid(accum_to_float_valid),  // input wire s_axis_a_tvalid
       .s_axis_a_tready(div_a_ready),            // output wire s_axis_a_tready          
       .s_axis_a_tdata(accum_to_float_out),     // input wire [31 : 0] s_axis_a_tdata
       .s_axis_b_tvalid(b_valid),            // input wire s_axis_b_tvalid
       .s_axis_b_tready(div_b_ready),            // output wire s_axis_b_tready
       .s_axis_b_tdata(div_converter_out),              // input wire [31 : 0] s_axis_b_tdata
       .m_axis_result_tvalid(divider_valid),  // output wire m_axis_result_tvalid
       .m_axis_result_tready(1),    // input wire m_axis_result_tready
       .m_axis_result_tdata(out)    // output wire [31 : 0] m_axis_result_tdata
    );

    counter #(.NUM(NUM_INPUTS - 1)) c(
        .clk(clk),
        .rst(clr),
        .start(divider_valid),
        .done(out_valid)
    );
    

endmodule
