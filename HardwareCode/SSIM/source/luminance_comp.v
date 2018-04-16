`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// luminance_comp.v
// Created by Ruben Purdy on 03/27/2018 10:46:40 PM
//////////////////////////////////////////////////////////////////////////////////

/*
    Performs the luminance comparator operation between two sets of means. The formula is as follows:
    
        l(x,y) = (2*u_x*u_y) / (u_x^2 + u_y^2)
        
    - inputs:
        - clk: The clock.
        - [31:0] mean_x: The mean value for the x data, in floating point.
        - [31:0] mean_y: The mean value for the y data, in floating point.
        - mean_x_valid: Indicates whether the x mean value is valid
        - mean_y_valid: Indicates whether the y mean value is valid
        - out_ready: Indicates whether the outside world is ready for output.
    - outputs:
        -  mean_x_ready: Indicates whether the unit is ready to recieve the x mean value.
        -  mean_y_ready: Indicates whether the unit is ready to recieve the y mean value.
        - [31:0] out: The output value, in floating point.
        - out_valid: Indicates whether the output value is valid.
*/
module luminance_comp(clk, mean_x, mean_y, mean_x_valid, mean_y_valid, out_ready, mean_x_ready, mean_y_ready, out, out_valid);

    input [31:0] mean_x, mean_y;
    input clk, mean_x_valid, mean_y_valid, out_ready;
    
    output [31:0] out;
    output out_valid, mean_x_ready, mean_y_ready;
    
    wire [31:0] mean_x_times_mean_y_out, times_two_out, mean_x_squared, mean_y_squared, adder_out;
    wire mean_x_times_mean_y_valid, times_two_valid, times_two_a_ready, times_two_b_ready, mean_x_squared_a_ready, mean_x_squared_b_ready, mean_y_squared_a_ready, mean_y_squared_b_ready;
    wire mean_x_squared_valid, mean_y_squared_valid, adder_a_ready, adder_b_ready, adder_valid, divider_a_ready, divider_b_ready;
    
    multiplier_floating_point mean_x_times_mean_y (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(mean_x_valid),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(mean_x_ready),            // output wire s_axis_a_tready
      .s_axis_a_tdata(mean_x),              // input wire [31 : 0] 
      .s_axis_b_tvalid(mean_y_valid),            // input wire s_axis_b_tvalid
      .s_axis_b_tready(mean_y_ready),            // output wire s_axis_b_tready
      .s_axis_b_tdata(mean_y),              // input wire [31 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(mean_x_times_mean_y_valid),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(times_two_a_ready),  // input wire m_axis_result_tready
      .m_axis_result_tdata(mean_x_times_mean_y_out)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    multiplier_floating_point times_two (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(mean_x_times_mean_y_valid),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(times_two_a_ready),            // output wire s_axis_a_tready
      .s_axis_a_tdata(mean_x_times_mean_y_out),              // input wire [31 : 0] 
      .s_axis_b_tvalid(1),            // input wire s_axis_b_tvalid
      .s_axis_b_tready(times_two_b_ready),            // output wire s_axis_b_tready
      .s_axis_b_tdata(32'h40000000),              // input wire [31 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(times_two_valid),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(divider_a_ready),  // input wire m_axis_result_tready
      .m_axis_result_tdata(times_two_out)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    multiplier_floating_point mean_x_squarer (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(mean_x_valid),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(mean_x_squared_a_ready),            // output wire s_axis_a_tready
      .s_axis_a_tdata(mean_x),              // input wire [31 : 0] 
      .s_axis_b_tvalid(mean_x_valid),            // input wire s_axis_b_tvalid
      .s_axis_b_tready(mean_x_squared_b_ready),            // output wire s_axis_b_tready
      .s_axis_b_tdata(mean_x),              // input wire [31 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(mean_x_squared_valid),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(adder_a_ready),  // input wire m_axis_result_tready
      .m_axis_result_tdata(mean_x_squared)    // output wire [31 : 0] m_axis_result_tdata
    );  
      
    multiplier_floating_point mean_y_squarer (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(mean_y_valid),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(mean_y_squared_a_ready),            // output wire s_axis_a_tready
      .s_axis_a_tdata(mean_y),              // input wire [31 : 0] 
      .s_axis_b_tvalid(mean_y_valid),            // input wire s_axis_b_tvalid
      .s_axis_b_tready(mean_y_squared_b_ready),            // output wire s_axis_b_tready
      .s_axis_b_tdata(mean_y),              // input wire [31 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(mean_y_squared_valid),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(adder_b_ready),  // input wire m_axis_result_tready
      .m_axis_result_tdata(mean_y_squared)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    adder_floating_point mean_squared_adder (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(mean_x_squared_valid),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(adder_a_ready),            // output wire s_axis_a_tready
      .s_axis_a_tdata(mean_x_squared),              // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(mean_y_squared_valid),            // input wire s_axis_b_tvalid
      .s_axis_b_tready(adder_b_ready),            // output wire s_axis_b_tready
      .s_axis_b_tdata(mean_y_squared),              // input wire [31 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(adder_valid),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(divider_b_ready),  // input wire m_axis_result_tready
      .m_axis_result_tdata(adder_out)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    divider_floating_point divider (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(times_two_valid),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(divider_a_ready),            // output wire s_axis_a_tready
      .s_axis_a_tdata(times_two_out),              // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(adder_valid),            // input wire s_axis_b_tvalid
      .s_axis_b_tready(divider_b_ready),            // output wire s_axis_b_tready
      .s_axis_b_tdata(adder_out),              // input wire [31 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(out_valid),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(out_ready),  // input wire m_axis_result_tready
      .m_axis_result_tdata(out)    // output wire [31 : 0] m_axis_result_tdata
    );
endmodule
