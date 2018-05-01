// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
// Date        : Fri Apr 27 12:58:14 2018
// Host        : compute.engr.arizona.edu running 64-bit Red Hat Enterprise Linux Server release 7.4 (Maipo)
// Command     : write_verilog -force -mode funcsim
//               /home/tavakoliyazdi/tavakoliyazdi/ECE506/Project_ANN/ANN/ANN.srcs/sources_1/ip/Float_Fixed/Float_Fixed_sim_netlist.v
// Design      : Float_Fixed
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx485tffg1761-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Float_Fixed,floating_point_v7_1_3,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "floating_point_v7_1_3,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module Float_Fixed
   (aclk,
    s_axis_a_tvalid,
    s_axis_a_tready,
    s_axis_a_tdata,
    m_axis_result_tvalid,
    m_axis_result_tready,
    m_axis_result_tdata);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 aclk_intf CLK" *) input aclk;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_A TVALID" *) input s_axis_a_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_A TREADY" *) output s_axis_a_tready;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_A TDATA" *) input [31:0]s_axis_a_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_RESULT TVALID" *) output m_axis_result_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_RESULT TREADY" *) input m_axis_result_tready;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_RESULT TDATA" *) output [15:0]m_axis_result_tdata;

  wire aclk;
  wire [15:0]m_axis_result_tdata;
  wire m_axis_result_tready;
  wire m_axis_result_tvalid;
  wire [31:0]s_axis_a_tdata;
  wire s_axis_a_tready;
  wire s_axis_a_tvalid;
  wire NLW_U0_m_axis_result_tlast_UNCONNECTED;
  wire NLW_U0_s_axis_b_tready_UNCONNECTED;
  wire NLW_U0_s_axis_c_tready_UNCONNECTED;
  wire NLW_U0_s_axis_operation_tready_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_result_tuser_UNCONNECTED;

  (* C_ACCUM_INPUT_MSB = "15" *) 
  (* C_ACCUM_LSB = "-24" *) 
  (* C_ACCUM_MSB = "32" *) 
  (* C_A_FRACTION_WIDTH = "24" *) 
  (* C_A_TDATA_WIDTH = "32" *) 
  (* C_A_TUSER_WIDTH = "1" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BRAM_USAGE = "0" *) 
  (* C_B_FRACTION_WIDTH = "24" *) 
  (* C_B_TDATA_WIDTH = "32" *) 
  (* C_B_TUSER_WIDTH = "1" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_COMPARE_OPERATION = "8" *) 
  (* C_C_FRACTION_WIDTH = "24" *) 
  (* C_C_TDATA_WIDTH = "32" *) 
  (* C_C_TUSER_WIDTH = "1" *) 
  (* C_C_WIDTH = "32" *) 
  (* C_FIXED_DATA_UNSIGNED = "0" *) 
  (* C_HAS_ABSOLUTE = "0" *) 
  (* C_HAS_ACCUMULATOR_A = "0" *) 
  (* C_HAS_ACCUMULATOR_S = "0" *) 
  (* C_HAS_ACCUM_INPUT_OVERFLOW = "0" *) 
  (* C_HAS_ACCUM_OVERFLOW = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ADD = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_A_TLAST = "0" *) 
  (* C_HAS_A_TUSER = "0" *) 
  (* C_HAS_B = "0" *) 
  (* C_HAS_B_TLAST = "0" *) 
  (* C_HAS_B_TUSER = "0" *) 
  (* C_HAS_C = "0" *) 
  (* C_HAS_COMPARE = "0" *) 
  (* C_HAS_C_TLAST = "0" *) 
  (* C_HAS_C_TUSER = "0" *) 
  (* C_HAS_DIVIDE = "0" *) 
  (* C_HAS_DIVIDE_BY_ZERO = "0" *) 
  (* C_HAS_EXPONENTIAL = "0" *) 
  (* C_HAS_FIX_TO_FLT = "0" *) 
  (* C_HAS_FLT_TO_FIX = "1" *) 
  (* C_HAS_FLT_TO_FLT = "0" *) 
  (* C_HAS_FMA = "0" *) 
  (* C_HAS_FMS = "0" *) 
  (* C_HAS_INVALID_OP = "0" *) 
  (* C_HAS_LOGARITHM = "0" *) 
  (* C_HAS_MULTIPLY = "0" *) 
  (* C_HAS_OPERATION = "0" *) 
  (* C_HAS_OPERATION_TLAST = "0" *) 
  (* C_HAS_OPERATION_TUSER = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_RECIP = "0" *) 
  (* C_HAS_RECIP_SQRT = "0" *) 
  (* C_HAS_RESULT_TLAST = "0" *) 
  (* C_HAS_RESULT_TUSER = "0" *) 
  (* C_HAS_SQRT = "0" *) 
  (* C_HAS_SUBTRACT = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MULT_USAGE = "0" *) 
  (* C_OPERATION_TDATA_WIDTH = "8" *) 
  (* C_OPERATION_TUSER_WIDTH = "1" *) 
  (* C_OPTIMIZATION = "1" *) 
  (* C_RATE = "1" *) 
  (* C_RESULT_FRACTION_WIDTH = "12" *) 
  (* C_RESULT_TDATA_WIDTH = "16" *) 
  (* C_RESULT_TUSER_WIDTH = "1" *) 
  (* C_RESULT_WIDTH = "16" *) 
  (* C_THROTTLE_SCHEME = "1" *) 
  (* C_TLAST_RESOLUTION = "0" *) 
  (* C_XDEVICEFAMILY = "virtex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  Float_Fixed_floating_point_v7_1_3 U0
       (.aclk(aclk),
        .aclken(1'b1),
        .aresetn(1'b1),
        .m_axis_result_tdata(m_axis_result_tdata),
        .m_axis_result_tlast(NLW_U0_m_axis_result_tlast_UNCONNECTED),
        .m_axis_result_tready(m_axis_result_tready),
        .m_axis_result_tuser(NLW_U0_m_axis_result_tuser_UNCONNECTED[0]),
        .m_axis_result_tvalid(m_axis_result_tvalid),
        .s_axis_a_tdata(s_axis_a_tdata),
        .s_axis_a_tlast(1'b0),
        .s_axis_a_tready(s_axis_a_tready),
        .s_axis_a_tuser(1'b0),
        .s_axis_a_tvalid(s_axis_a_tvalid),
        .s_axis_b_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_b_tlast(1'b0),
        .s_axis_b_tready(NLW_U0_s_axis_b_tready_UNCONNECTED),
        .s_axis_b_tuser(1'b0),
        .s_axis_b_tvalid(1'b0),
        .s_axis_c_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_c_tlast(1'b0),
        .s_axis_c_tready(NLW_U0_s_axis_c_tready_UNCONNECTED),
        .s_axis_c_tuser(1'b0),
        .s_axis_c_tvalid(1'b0),
        .s_axis_operation_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_operation_tlast(1'b0),
        .s_axis_operation_tready(NLW_U0_s_axis_operation_tready_UNCONNECTED),
        .s_axis_operation_tuser(1'b0),
        .s_axis_operation_tvalid(1'b0));
endmodule

(* C_ACCUM_INPUT_MSB = "15" *) (* C_ACCUM_LSB = "-24" *) (* C_ACCUM_MSB = "32" *) 
(* C_A_FRACTION_WIDTH = "24" *) (* C_A_TDATA_WIDTH = "32" *) (* C_A_TUSER_WIDTH = "1" *) 
(* C_A_WIDTH = "32" *) (* C_BRAM_USAGE = "0" *) (* C_B_FRACTION_WIDTH = "24" *) 
(* C_B_TDATA_WIDTH = "32" *) (* C_B_TUSER_WIDTH = "1" *) (* C_B_WIDTH = "32" *) 
(* C_COMPARE_OPERATION = "8" *) (* C_C_FRACTION_WIDTH = "24" *) (* C_C_TDATA_WIDTH = "32" *) 
(* C_C_TUSER_WIDTH = "1" *) (* C_C_WIDTH = "32" *) (* C_FIXED_DATA_UNSIGNED = "0" *) 
(* C_HAS_ABSOLUTE = "0" *) (* C_HAS_ACCUMULATOR_A = "0" *) (* C_HAS_ACCUMULATOR_S = "0" *) 
(* C_HAS_ACCUM_INPUT_OVERFLOW = "0" *) (* C_HAS_ACCUM_OVERFLOW = "0" *) (* C_HAS_ACLKEN = "0" *) 
(* C_HAS_ADD = "0" *) (* C_HAS_ARESETN = "0" *) (* C_HAS_A_TLAST = "0" *) 
(* C_HAS_A_TUSER = "0" *) (* C_HAS_B = "0" *) (* C_HAS_B_TLAST = "0" *) 
(* C_HAS_B_TUSER = "0" *) (* C_HAS_C = "0" *) (* C_HAS_COMPARE = "0" *) 
(* C_HAS_C_TLAST = "0" *) (* C_HAS_C_TUSER = "0" *) (* C_HAS_DIVIDE = "0" *) 
(* C_HAS_DIVIDE_BY_ZERO = "0" *) (* C_HAS_EXPONENTIAL = "0" *) (* C_HAS_FIX_TO_FLT = "0" *) 
(* C_HAS_FLT_TO_FIX = "1" *) (* C_HAS_FLT_TO_FLT = "0" *) (* C_HAS_FMA = "0" *) 
(* C_HAS_FMS = "0" *) (* C_HAS_INVALID_OP = "0" *) (* C_HAS_LOGARITHM = "0" *) 
(* C_HAS_MULTIPLY = "0" *) (* C_HAS_OPERATION = "0" *) (* C_HAS_OPERATION_TLAST = "0" *) 
(* C_HAS_OPERATION_TUSER = "0" *) (* C_HAS_OVERFLOW = "0" *) (* C_HAS_RECIP = "0" *) 
(* C_HAS_RECIP_SQRT = "0" *) (* C_HAS_RESULT_TLAST = "0" *) (* C_HAS_RESULT_TUSER = "0" *) 
(* C_HAS_SQRT = "0" *) (* C_HAS_SUBTRACT = "0" *) (* C_HAS_UNDERFLOW = "0" *) 
(* C_LATENCY = "1" *) (* C_MULT_USAGE = "0" *) (* C_OPERATION_TDATA_WIDTH = "8" *) 
(* C_OPERATION_TUSER_WIDTH = "1" *) (* C_OPTIMIZATION = "1" *) (* C_RATE = "1" *) 
(* C_RESULT_FRACTION_WIDTH = "12" *) (* C_RESULT_TDATA_WIDTH = "16" *) (* C_RESULT_TUSER_WIDTH = "1" *) 
(* C_RESULT_WIDTH = "16" *) (* C_THROTTLE_SCHEME = "1" *) (* C_TLAST_RESOLUTION = "0" *) 
(* C_XDEVICEFAMILY = "virtex7" *) (* ORIG_REF_NAME = "floating_point_v7_1_3" *) (* downgradeipidentifiedwarnings = "yes" *) 
module Float_Fixed_floating_point_v7_1_3
   (aclk,
    aclken,
    aresetn,
    s_axis_a_tvalid,
    s_axis_a_tready,
    s_axis_a_tdata,
    s_axis_a_tuser,
    s_axis_a_tlast,
    s_axis_b_tvalid,
    s_axis_b_tready,
    s_axis_b_tdata,
    s_axis_b_tuser,
    s_axis_b_tlast,
    s_axis_c_tvalid,
    s_axis_c_tready,
    s_axis_c_tdata,
    s_axis_c_tuser,
    s_axis_c_tlast,
    s_axis_operation_tvalid,
    s_axis_operation_tready,
    s_axis_operation_tdata,
    s_axis_operation_tuser,
    s_axis_operation_tlast,
    m_axis_result_tvalid,
    m_axis_result_tready,
    m_axis_result_tdata,
    m_axis_result_tuser,
    m_axis_result_tlast);
  input aclk;
  input aclken;
  input aresetn;
  input s_axis_a_tvalid;
  output s_axis_a_tready;
  input [31:0]s_axis_a_tdata;
  input [0:0]s_axis_a_tuser;
  input s_axis_a_tlast;
  input s_axis_b_tvalid;
  output s_axis_b_tready;
  input [31:0]s_axis_b_tdata;
  input [0:0]s_axis_b_tuser;
  input s_axis_b_tlast;
  input s_axis_c_tvalid;
  output s_axis_c_tready;
  input [31:0]s_axis_c_tdata;
  input [0:0]s_axis_c_tuser;
  input s_axis_c_tlast;
  input s_axis_operation_tvalid;
  output s_axis_operation_tready;
  input [7:0]s_axis_operation_tdata;
  input [0:0]s_axis_operation_tuser;
  input s_axis_operation_tlast;
  output m_axis_result_tvalid;
  input m_axis_result_tready;
  output [15:0]m_axis_result_tdata;
  output [0:0]m_axis_result_tuser;
  output m_axis_result_tlast;

  wire \<const0> ;
  wire \<const1> ;
  wire aclk;
  wire [15:0]m_axis_result_tdata;
  wire m_axis_result_tready;
  wire m_axis_result_tvalid;
  wire [31:0]s_axis_a_tdata;
  wire s_axis_a_tready;
  wire s_axis_a_tvalid;
  wire NLW_i_synth_m_axis_result_tlast_UNCONNECTED;
  wire NLW_i_synth_s_axis_b_tready_UNCONNECTED;
  wire NLW_i_synth_s_axis_c_tready_UNCONNECTED;
  wire NLW_i_synth_s_axis_operation_tready_UNCONNECTED;
  wire [0:0]NLW_i_synth_m_axis_result_tuser_UNCONNECTED;

  assign m_axis_result_tlast = \<const0> ;
  assign m_axis_result_tuser[0] = \<const0> ;
  assign s_axis_b_tready = \<const1> ;
  assign s_axis_c_tready = \<const1> ;
  assign s_axis_operation_tready = \<const1> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* C_ACCUM_INPUT_MSB = "15" *) 
  (* C_ACCUM_LSB = "-24" *) 
  (* C_ACCUM_MSB = "32" *) 
  (* C_A_FRACTION_WIDTH = "24" *) 
  (* C_A_TDATA_WIDTH = "32" *) 
  (* C_A_TUSER_WIDTH = "1" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BRAM_USAGE = "0" *) 
  (* C_B_FRACTION_WIDTH = "24" *) 
  (* C_B_TDATA_WIDTH = "32" *) 
  (* C_B_TUSER_WIDTH = "1" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_COMPARE_OPERATION = "8" *) 
  (* C_C_FRACTION_WIDTH = "24" *) 
  (* C_C_TDATA_WIDTH = "32" *) 
  (* C_C_TUSER_WIDTH = "1" *) 
  (* C_C_WIDTH = "32" *) 
  (* C_FIXED_DATA_UNSIGNED = "0" *) 
  (* C_HAS_ABSOLUTE = "0" *) 
  (* C_HAS_ACCUMULATOR_A = "0" *) 
  (* C_HAS_ACCUMULATOR_S = "0" *) 
  (* C_HAS_ACCUM_INPUT_OVERFLOW = "0" *) 
  (* C_HAS_ACCUM_OVERFLOW = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ADD = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_A_TLAST = "0" *) 
  (* C_HAS_A_TUSER = "0" *) 
  (* C_HAS_B = "0" *) 
  (* C_HAS_B_TLAST = "0" *) 
  (* C_HAS_B_TUSER = "0" *) 
  (* C_HAS_C = "0" *) 
  (* C_HAS_COMPARE = "0" *) 
  (* C_HAS_C_TLAST = "0" *) 
  (* C_HAS_C_TUSER = "0" *) 
  (* C_HAS_DIVIDE = "0" *) 
  (* C_HAS_DIVIDE_BY_ZERO = "0" *) 
  (* C_HAS_EXPONENTIAL = "0" *) 
  (* C_HAS_FIX_TO_FLT = "0" *) 
  (* C_HAS_FLT_TO_FIX = "1" *) 
  (* C_HAS_FLT_TO_FLT = "0" *) 
  (* C_HAS_FMA = "0" *) 
  (* C_HAS_FMS = "0" *) 
  (* C_HAS_INVALID_OP = "0" *) 
  (* C_HAS_LOGARITHM = "0" *) 
  (* C_HAS_MULTIPLY = "0" *) 
  (* C_HAS_OPERATION = "0" *) 
  (* C_HAS_OPERATION_TLAST = "0" *) 
  (* C_HAS_OPERATION_TUSER = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_RECIP = "0" *) 
  (* C_HAS_RECIP_SQRT = "0" *) 
  (* C_HAS_RESULT_TLAST = "0" *) 
  (* C_HAS_RESULT_TUSER = "0" *) 
  (* C_HAS_SQRT = "0" *) 
  (* C_HAS_SUBTRACT = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MULT_USAGE = "0" *) 
  (* C_OPERATION_TDATA_WIDTH = "8" *) 
  (* C_OPERATION_TUSER_WIDTH = "1" *) 
  (* C_OPTIMIZATION = "1" *) 
  (* C_RATE = "1" *) 
  (* C_RESULT_FRACTION_WIDTH = "12" *) 
  (* C_RESULT_TDATA_WIDTH = "16" *) 
  (* C_RESULT_TUSER_WIDTH = "1" *) 
  (* C_RESULT_WIDTH = "16" *) 
  (* C_THROTTLE_SCHEME = "1" *) 
  (* C_TLAST_RESOLUTION = "0" *) 
  (* C_XDEVICEFAMILY = "virtex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  Float_Fixed_floating_point_v7_1_3_viv i_synth
       (.aclk(aclk),
        .aclken(1'b0),
        .aresetn(1'b0),
        .m_axis_result_tdata(m_axis_result_tdata),
        .m_axis_result_tlast(NLW_i_synth_m_axis_result_tlast_UNCONNECTED),
        .m_axis_result_tready(m_axis_result_tready),
        .m_axis_result_tuser(NLW_i_synth_m_axis_result_tuser_UNCONNECTED[0]),
        .m_axis_result_tvalid(m_axis_result_tvalid),
        .s_axis_a_tdata(s_axis_a_tdata),
        .s_axis_a_tlast(1'b0),
        .s_axis_a_tready(s_axis_a_tready),
        .s_axis_a_tuser(1'b0),
        .s_axis_a_tvalid(s_axis_a_tvalid),
        .s_axis_b_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_b_tlast(1'b0),
        .s_axis_b_tready(NLW_i_synth_s_axis_b_tready_UNCONNECTED),
        .s_axis_b_tuser(1'b0),
        .s_axis_b_tvalid(1'b0),
        .s_axis_c_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_c_tlast(1'b0),
        .s_axis_c_tready(NLW_i_synth_s_axis_c_tready_UNCONNECTED),
        .s_axis_c_tuser(1'b0),
        .s_axis_c_tvalid(1'b0),
        .s_axis_operation_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_operation_tlast(1'b0),
        .s_axis_operation_tready(NLW_i_synth_s_axis_operation_tready_UNCONNECTED),
        .s_axis_operation_tuser(1'b0),
        .s_axis_operation_tvalid(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
UC4CmPqX0SqJ2UUhTebSBQy5NcA/j9bxAIqQ6wbegLmM1/Cn75/uFkWA3deU8+DcyuWUTHYXfhQa
FmsYXwDixw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
dDSQWLdodlmwLBbrVzFALfmMj87bDPWQb1UJjsI1uzzBl1j9KFL73KnJkT/qrIi8PcgHGRQCWLuV
tUcQKJfjWUxPaUKck7ZfMCwW0ZJGmK0WVjMxDHFIuX31Lq56qpHabMaUfI5KbAXVmRuHP1XZg7p9
2EQ0Z71bgP8pXajMFSk=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
P01x8DA5LINiJ5Q8424Nl+7R8kGbW3lfX9wGoLcfWirvbtBJfAL09pUefN7FmJt15iGoX6tO1cZB
ctIXrvbeoMvywb7Udmez8d5aqZArvZs59U94qEoNgAzZqK2Ezz6kfp4WejsuQkVWEQLHNeLS9PcW
MJp10y4RvD/VYX0NKJE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UXEkB9WyGuIaKBzTWNZLPDNy+JYL3RQwx9bZB0Yf0lc2SHpe90bdEUkFtwEOKs/2GCKB6M1l0ObO
SYIVWlc6TzHtIXyquu4NMWuZuN/hF3oi2ai4Ikin/Q2racoJ7a8nvTx/gMojHQvsfhyTX4IH9sUW
HG7cH6+UDKEY7Tk7GLxdhIIq6Zb2CFPPQLfK5KJiMgiS/0E3CUShwVonZhtIeqfeGgtL+OG2JuDt
SPIlvxJ7nMS0whAX5Sy/+1eI+LwodrwDQL241xn8VXIXCp9ErMFxwaAbaSU8UNR9YinazX1jj4hH
ttxKfqRN2wxivxXimO14C2lBfu9n5cN0oSR0lQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BIHNDu/T0606wibtdYXC1WxJKfKHI4oxv4q1onL8cWS9nNJqvtCHy9zBA1k8+FiOxG9Fl0Qwl7w3
UGQmaUgH84k0ZF+OLZUE7zcN+P1qCtyCUvBvC7F52hJEdEB2guyqDeBkBAVbJ57Boixm8XRATDpm
LeLAeBwOGmbF8h60a+41WQCnLin5gB4ucpTKqA4dDlJFWXmyhexluJ+2/y+dr8c8j+YaFjCc7zLf
5qWqKnoOrZCFDydLwmsv02rvwWYyi/2j+M+2CXB39T30KLn+gmWctQAgTiT4tp+HXIhK1nExf+3+
yNqJpiSH9SP7omKXkpqu1MAOc0/d55C5FSdJVQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
pIxY208BVkCJvQBRFNEdpbvQ/dkcDQYqjzbWuRumY3aJJ+CK0p8Wx3hBtAejfbfbtOoVsazjEisH
Of7w+0A9T2cqAjj0NpHw7CgquEAQnnXd/vVPqCE8WmsSzphDS6cGpM/SlZBlT3f/PIwuM8VUAhhC
aepAXx72V4uF+4mVb1YULcWLdnlpdVgcT2lpB89+mVduhGJgTRlqefgVJrnuax07UXqvcexu0dDL
LJ/3H4I4lQB+niTZ49ZySOu6VTp+971tfqWOgoMuX+Gx6J8Vgq/X+Ij7Klt/bdkY7K5R/dvZUqHB
jpYoluSFg8hTBvs6HNJadhE06onjG6+F6dl3ug==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
mTA1/+Bb44BlAYFWQnkQc4Kf4vM3wT7/ckUM3sBitJV1CbWxtexFycV/pChAuMlwZglzRMZaTroH
9SPSZAPgz4QRBEnBKBITAXcyv+5Gm9h51mE96+FHBSrzt1wAIezDy1jqK00M0TsDzHlR43kBF8nw
qaFTHMXpFdFX+nD2vOlsF1gxzQlYNdTTD5eM0GONS8IHh3nEIX9nDlEm6C6r/lnKT+GC30Qnnj2G
uTPT/ZEI6RWdX30y7XRlRY3FJV1fyZcYxUhn9TRMNgwVbD+BIXJFSXhqXybF7OdEMx3fjfpHNNGr
wZnkm4s1UwhhIGx6oMH+FuR8dcHAc82Rjmpg/Q==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
P09LGtuQoDVEG/ynd98SwhvrZ4a7HvixKZ8Vr+ppqs4Te+3hHjymSr5SW2kiqZJgib8Oo0hpW79e
bDYzPXXzvxSTLY6ZT3aNeoCSyQQxvMcVtAxhjVy5wIZN393YQWDvtDbCHtGFDGD3lBTnMjZbr0gd
tk40aiaTGrXPjDOfay7/0rJKswezU0/StLC8Js6JE9L8apBpoX6fHLp+3nJaY033+gF0suKco+n0
iBE1VLa1gxqwbvE/MozMV8MZX7I81XPJnRuJniyMGnuxOQ8EfYLgRIidjGMhqT1GrKJljQLDmlJ7
zdSyiSzYUzsIhK+spAaeKwzsIbXAhNf1KpFpXA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 85456)
`pragma protect data_block
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
BoHdpdKsIBG7WLNz2g==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
