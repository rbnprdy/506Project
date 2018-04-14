`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// ssim.v
// Created by Ruben Purdy on 03/27/2018 10:46:40 PM
//////////////////////////////////////////////////////////////////////////////////

module ssim #(parameter NUM_INPUTS = 784) (in, in_valid, mean_y, mean_y_valid, std_y, std_y_valid, clk, clr, out, out_valid);

    input [31:0] mean_y, std_y;
    input [7:0] in;
    input clk, clr, in_valid, mean_y_valid, std_y_valid;
    output [31:0] out;
    output out_valid;
    
    wire mean_in_ready;
    wire input_mem_x_valid, input_mem_y_valid, mean_x_valid, std_x_valid, covar_y_ready, covar_valid, covar_ready, mean_x_ready, mean_y_ready, std_x_ready, std_y_ready, l_valid, c_valid, s_valid;
    wire l_times_c_a_ready, l_times_c_b_ready, l_times_c_valid, l_times_c_times_s_a_ready, l_times_c_times_s_b_ready;
    wire [31:0] mean_x, mem_y_out, std_x, covar, l_out, c_out, s_out, l_times_c_out;
    wire [7:0] mem_x_out, buffer_out;
    
    input_mem x(
        .clk(clk),
        .rst(clr),
        .start(mean_in_ready),
        .valid(input_mem_x_valid),
        .out(mem_x_out)
    );
    
    input_mem_y y(
        .clk(clk),
        .rst(clr),
        .start(covar_y_ready),
        .valid(input_mem_y_valid),
        .out(mem_y_out)
    );
    
    mean #(.NUM_INPUTS(NUM_INPUTS)) m(
        .in(mem_x_out),
        .clr(clr), 
        .clk(clk), 
        .in_valid(input_mem_x_valid),
        .result_ready(1),
        .in_ready(mean_in_ready),
        .out(mean_x), 
        .out_valid(mean_x_valid)
    );
    
    buffer b(
        .write_data(mem_x_out), 
        .w_en(input_mem_x_valid), 
        .clk(clk), 
        .clr(clr),
        .ready(mean_x_valid), 
        .read_data(buffer_out)
    );
    
    stdev #(.NUM_INPUTS(NUM_INPUTS)) s(
        .in({24'd0, buffer_out}), 
        .u(mean_x), 
        .clk(clk), 
        .clr(clr), 
        .in_valid(mean_x_valid), 
        .u_valid(mean_x_valid), 
        .out(std_x), 
        .out_valid(std_x_valid)
    );
    
    covariance #(.NUM_INPUTS(NUM_INPUTS)) c(
        .in_x({24'd0, buffer_out}), 
        .u_x(mean_x),
        .in_y(mem_y_out), 
        .clk(clk), 
        .clr(clr), 
        .in_x_valid(mean_x_valid), 
        .u_x_valid(mean_x_valid), 
        .in_y_valid(input_mem_y_valid),
        .in_y_ready(covar_y_ready),
        .out(covar), 
        .out_valid(covar_valid)
    );
    
    luminance_comp l_comp(
        .clk(clk), 
        .mean_x(mean_x), 
        .mean_y(mean_y), 
        .mean_x_valid(mean_x_valid), 
        .mean_y_valid(mean_y_valid), 
        .out_ready(1), 
        .mean_x_ready(mean_x_ready), 
        .mean_y_ready(mean_y_ready), 
        .out(l_out), 
        .out_valid(l_valid)
    );
    
    contrast_comp c_comp(
        .clk(clk), 
        .std_x(std_x), 
        .std_y(std_y), 
        .std_x_valid(std_x_valid), 
        .std_y_valid(std_y_valid), 
        .out_ready(1), 
        .std_x_ready(std_x_ready), 
        .std_y_ready(std_y_ready), 
        .out(c_out), 
        .out_valid(c_valid)
    );
    
    structure_comp s_comp(
        .clk(clk), 
        .std_x(std_x), 
        .std_y(std_y), 
        .covariance(covar),
        .std_x_valid(std_x_valid), 
        .std_y_valid(std_y_valid), 
        .covariance_valid(covar_valid),
        .out_ready(1), 
        .std_x_ready(std_x_ready), 
        .std_y_ready(std_y_ready), 
        .covariance_ready(covar_ready),
        .out(s_out), 
        .out_valid(s_valid)
    );
    
    multiplier_float l_times_c (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(l_valid),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(l_times_c_a_ready),            // output wire s_axis_a_tready
      .s_axis_a_tdata(l_out),              // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(c_valid),            // input wire s_axis_b_tvalid
      .s_axis_b_tready(l_times_c_b_ready),            // output wire s_axis_b_tready
      .s_axis_b_tdata(c_out),              // input wire [31 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(l_times_c_valid),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(1),  // input wire m_axis_result_tready
      .m_axis_result_tdata(l_times_c_out)    // output wire [31 : 0] m_axis_result_tdata
    );
    
    multiplier_float l_times_c_times_s (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(l_times_c_valid),            // input wire s_axis_a_tvalid
      .s_axis_a_tready(l_times_c_times_s_a_ready),            // output wire s_axis_a_tready
      .s_axis_a_tdata(l_times_c_out),              // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(s_valid),            // input wire s_axis_b_tvalid
      .s_axis_b_tready(l_times_c_times_s_b_ready),            // output wire s_axis_b_tready
      .s_axis_b_tdata(s_out),              // input wire [31 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(out_valid),  // output wire m_axis_result_tvalid
      .m_axis_result_tready(1),  // input wire m_axis_result_tready
      .m_axis_result_tdata(out)    // output wire [31 : 0] m_axis_result_tdata
    );
    
endmodule
