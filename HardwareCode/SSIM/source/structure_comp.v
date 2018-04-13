`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2018 10:46:40 PM
// Design Name: 
// Module Name: structure_comp
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


module structure_comp(clk, std_x, std_y, covariance, std_x_valid, std_y_valid, covariance_valid, out_ready, std_x_ready, std_y_ready, covariance_ready, out, out_valid);

    input [31:0] std_x, std_y, covariance;
    input clk, std_x_valid, std_y_valid, covariance_valid, out_ready;
    
    output [31:0] out;
    output out_valid, std_x_ready, std_y_ready, covariance_ready;
    
    wire [31:0] std_x_times_std_y_out, times_two_out, std_x_squared, std_y_squared, adder_out;
    wire std_x_times_std_y_valid, times_two_valid, times_two_a_ready, times_two_b_ready, std_x_squared_a_ready, std_x_squared_b_ready, std_y_squared_a_ready, std_y_squared_b_ready;
    wire std_x_squared_valid, std_y_squared_valid, adder_a_ready, adder_b_ready, adder_valid, divider_b_ready;
    
    multiplier_float std_x_times_std_y (
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

    
    divider_float divider (
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