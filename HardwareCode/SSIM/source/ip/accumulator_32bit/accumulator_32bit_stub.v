// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4.1 (win64) Build 2117270 Tue Jan 30 15:32:00 MST 2018
// Date        : Sun Apr 15 18:40:16 2018
// Host        : DESKTOP-S65ON12 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Ruben/Documents/ECE506/506Project/HardwareCode/SSIM/source/ip/accumulator_32bit/accumulator_32bit_stub.v
// Design      : accumulator_32bit
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_accum_v12_0_11,Vivado 2017.4.1" *)
module accumulator_32bit(B, CLK, BYPASS, SCLR, Q)
/* synthesis syn_black_box black_box_pad_pin="B[31:0],CLK,BYPASS,SCLR,Q[31:0]" */;
  input [31:0]B;
  input CLK;
  input BYPASS;
  input SCLR;
  output [31:0]Q;
endmodule
