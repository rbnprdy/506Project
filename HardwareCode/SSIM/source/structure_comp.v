`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// structure_comp.v
// Created by Ruben Purdy on 03/27/2018 10:46:40 PM
//////////////////////////////////////////////////////////////////////////////////

/*
    Performs the structure comparator operation between two sets of standard deviations. 
    The formula is as follows:
    
        c(x,y) = (cov_xy) / (std_x*std_y)
        
    - inputs:
        - clk: The clock.
        - [31:0] std_x: The std value for the x data, in floating point.
        - [31:0] std_y: The std value for the y data, in floating point.
        - [31:0] covariance: The covariance value between x and y, in floating point.
        - std_x_valid: Indicates whether the x std value is valid
        - std_y_valid: Indicates whether the y std value is valid
        - covariance_valid: Indicates whether the covariance value is valid.
        - out_ready: Indicates whether the outside world is ready for output.
    - outputs:
        -  std_x_ready: Indicates whether the unit is ready to recieve the x std value.
        -  std_y_ready: Indicates whether the unit is ready to recieve the y std value.
        - covariance_valid: Indicates whether the unit is ready to recieve the covariance value.
        - [31:0] out: The output value, in floating point.
        - out_valid: Indicates whether the output value is valid.
*/
module structure_comp(clk, std_x, std_y, covariance, std_x_valid, std_y_valid, covariance_valid, out_ready, std_x_ready, std_y_ready, covariance_ready, out, out_valid);

    input [31:0] std_x, std_y, covariance;
    input clk, std_x_valid, std_y_valid, covariance_valid, out_ready;
    
    output [31:0] out;
    output out_valid, std_x_ready, std_y_ready, covariance_ready;
    
    wire [31:0] std_x_times_std_y_out, times_two_out, std_x_squared, std_y_squared, adder_out;
    wire std_x_times_std_y_valid, times_two_valid, times_two_a_ready, times_two_b_ready, std_x_squared_a_ready, std_x_squared_b_ready, std_y_squared_a_ready, std_y_squared_b_ready;
    wire std_x_squared_valid, std_y_squared_valid, adder_a_ready, adder_b_ready, adder_valid, divider_b_ready;
    
    multiplier_floating_point std_x_times_std_y (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(std_x_valid),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(std_x_ready),            // output wire s_axis_a_tready
      .s_axis_a_tdata(std_x),              // input wire [31 : 0] 
      .s_axis_b_tvalid(std_y_valid),            // input wire s_axis_b_tvalid
      .s_axis_b_tready(std_y_ready),            // output wire s_axis_b_tready
      .s_axis_b_tdata(std_y),              // input wire [31 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(std_x_times_std_y_valid),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(divider_b_ready),  // input wire m_axis_result_tready
      .m_axis_result_tdata(std_x_times_std_y_out)    // output wire [31 : 0] m_axis_result_tdata
    );

    
    divider_floating_point divider (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(covariance_valid),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(covariance_ready),            // output wire s_axis_a_tready
      .s_axis_a_tdata(covariance),              // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(std_x_times_std_y_valid),            // input wire s_axis_b_tvalid
      .s_axis_b_tready(divider_b_ready),            // output wire s_axis_b_tready
      .s_axis_b_tdata(std_x_times_std_y_out),              // input wire [31 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(out_valid),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(out_ready),  // input wire m_axis_result_tready
      .m_axis_result_tdata(out)    // output wire [31 : 0] m_axis_result_tdata
    );
endmodule
