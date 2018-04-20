// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4.1 (win64) Build 2117270 Tue Jan 30 15:32:00 MST 2018
// Date        : Thu Apr 19 12:11:01 2018
// Host        : DESKTOP-S65ON12 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/Users/Ruben/Documents/ECE506/506Project/HardwareCode/SSIM/source/ip/accumulator_32bit/accumulator_32bit_sim_netlist.v
// Design      : accumulator_32bit
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "accumulator_32bit,c_accum_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_accum_v12_0_11,Vivado 2017.4.1" *) 
(* NotValidForBitStream *)
module accumulator_32bit
   (B,
    CLK,
    BYPASS,
    SCLR,
    Q);
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [31:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 bypass_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME bypass_intf, LAYERED_METADATA undef" *) input BYPASS;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [31:0]Q;

  wire [31:0]B;
  wire BYPASS;
  wire CLK;
  wire [31:0]Q;
  wire SCLR;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_add_mode = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_width = "32" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "1" *) 
  (* c_has_c_in = "0" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "32" *) 
  (* c_scale = "0" *) 
  (* c_verbosity = "0" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  accumulator_32bit_c_accum_v12_0_11 U0
       (.ADD(1'b1),
        .B(B),
        .BYPASS(BYPASS),
        .CE(1'b1),
        .CLK(CLK),
        .C_IN(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_TYPE = "0" *) (* C_B_WIDTH = "32" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "1" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_SCLR = "1" *) (* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_OUT_WIDTH = "32" *) 
(* C_SCALE = "0" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_accum_v12_0_11" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module accumulator_32bit_c_accum_v12_0_11
   (B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    Q);
  input [31:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output [31:0]Q;

  wire [31:0]B;
  wire BYPASS;
  wire CLK;
  wire [31:0]Q;
  wire SCLR;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_add_mode = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_width = "32" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "1" *) 
  (* c_has_c_in = "0" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "32" *) 
  (* c_scale = "0" *) 
  (* c_verbosity = "0" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  accumulator_32bit_c_accum_v12_0_11_viv i_synth
       (.ADD(1'b0),
        .B(B),
        .BYPASS(BYPASS),
        .CE(1'b0),
        .CLK(CLK),
        .C_IN(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
Tu5z3bY3Eb0QgxVjj7DV+B/Is/tMe9s7CvTKra8/D8sjEuM41sI8faBtjLGTij7/KQPmeLJevfPf
4dHEXHly8w==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
mshOBHZ2ETRK1hNtqY90KoxmQvQteDtu+/5kLbwlm1wgzBb5zDZPXyu7ba8zXCIg35NxPuQk1HIr
3xehiD8rNQsyc+jph69tQ8reFKpe99PC/nIPGiDbtzI4iabLNX/pysuqfXZMxHFMOTCNloIeS0hX
a/h/OH0Cp5qX9YB1HyE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Pa2xre37DVwoieD0mmPE3bowWD0apiuusopeEJmB24lp6UY0B3MX9qFZunTsn6xOP/o5XEl+Tgd5
47mGTEH7CE/Zgd2XKi9af6uXk0hYJ30aBtYdk15EcKMn8QCFh8S1NQ/R40Zsb2iAP6G1fwEx6qnH
KJCL10/4CYm210MVZzLK2fwZMlv1sX9UeyjWZjZJsQOFQ6RWtracmPWMUD1DX6h38uikKss0rry4
RXpUFQPejFsBnF2kEpRLFkv+61dxaGXbj3/44cUXI1Nc9buOAHvoa1QwTso6z9AHHoDPzOii4ybq
o8K4w9sRXRPxHdVtPMn1sYWt+xAFNfnoNegxqA==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
hJerxnaBeyJN35amNEbyuWlvOUYm5FthsV8gStkMYNyh3QxOPVap2O3r4ITPaNa7QZQrHsvwh82c
EZW2lsJ+jm7bETBNtOFVaxWViyutmgLvxoX+qSHqzjx97SbehUZQ233/hhlMxo9Iq0rD3aCcKr/n
UvEBK3EsMaDOe0+yX/04njXnR0owyaEWjxuHRbTFgJSqoRKm56MHgQCuR5UVrlerCk8kQyQSG0a6
Cw4Ydq2McHx9ULC7qgmukEhS4yFBhejlvBdnsfMoSPYEgf535uXC1f99dgzu8UQdYmJwjD5yeOgd
3lvsfCz9E1+JxWLY5V5EqUAxRtvDS+fBJgqBCg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bsUE2ymrUnXHMnID3NgsnOa1HRNgamsw6hMZiCUFvvRr4v4XP1R6Hr9akQYL7zTQKT+HqOkwrwPL
9N3lbTny1J0vskRkMStuZq4MKDy0U/MYhQX6mRMWAS6JJ2gTxn9dqVgWXILoJsatGpRwYKU3352X
jQGu6A1oP634GNgv+In63XkhxEX6JhZyfkWmrc0h2i/9x2GUX7i2MvuZV4Z3+flw8efLsL1dxWXW
BsqYp6NABSqky6rQqtfAcnm13s7E3IKjsPFsdlwep8PBiP5SCEfFlbDstNvgo7pD+gW20yXlxM9a
T38QuTp9NlJb1PTBThj3fyGPQQ3fJmKen4KHXg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Mealcy8t7mTAW3SVFFDR0e1TUAFkdvxqZMAelA/wQwlUAXJAai/cDOt54OOobWPgegAzQLEbstiA
2z70/J9hYHfquON2VlysGJJ733rBE4i9qKr08T/teJk4sKSDXEP5dHIWe7fniO6tiJUQQ69lvtD3
9JsHEQwk8dgE6tJWBiQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
P+6RQiD0wiGchiduV3pUrSNtfM0T1b6b28Uidy4ttEseoWZpPSK8RzHFu1oJRBE6NNG3hEkBE0ME
bOaH8M5aFnHU+OeD/zt6OSg5n9cgw3mb3jsaVdTGV0L0sthJRaH3O1SqrTrkMX9LOK2RXTazTIiP
nxNea0p0gBsUZM0aRC4qBIUaQB6TjBqcWPNoh3KNdUmRUk+qj0AeLguKK7JHO7rE2Po6NSppzheW
SHG3CMe6UQZgijM4FmJnHdj2dAk31B/XVtdgwL4CWZzlSQuQl71utEgr+yzucnH/bnoOX2Vflod8
dqV3NpEqxg5EKXybLKtkZW6mM1BCUDa1NB6+9g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Bvr9YpbAwx/hUCKDTrXrAGqf9U3k5PgaBm8ppZQdr0vHfQdichccmc5m55Tyu872y/DfTZYkxFXr
97YSXVv8aGnpVWC6l07C3meM4cF6jc96TbIjLL/8Xekq/yLI2JhvOPgSZk3BGUfn26BXy1Xg2I8/
4ReuuRk/ojb3hfk0i44KJnp8qs3/r3HzGn1DeIoWiO7J3gQpvbxsrTRcJYjEy89i7VoFlbSZ9Zd1
UtQeBuSvtY3lbxqn8FK9bFA75qYvpLUtsCZxrqsTiqCGdpAyAeyJ698svnAPvprigIWQ1fuSTphn
FnW4/c5rvnyw3ID/r8+Zdwx+d8lJrbcWvjDDDQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BlVwwp6t3One5QvJXOxC7xD6MfEf4Y9GTPRECCbm5KVLnIx+ygWj+g7IhxO5N3Mli7Scn6l82MVS
vS+C0qStdAT+ul86H8+UqR3Acd4HnX+vzYD1SLvRljpTG0JJzj0I61iRTZQZJGxW/MRkhWdL2T1K
JmPGTKmglMqKrAmeqD+eIwUJnReYLA7BQoGuBE5aSRRla2aV4VCc83aLWPTw3HS6LQBUpc/3RZ1H
F7cayR7W7uRuT8qEgbWf7CCl0sFCtwtmjBD6pY4augQjw1NkFOaE688gwQf1RMQolIrA0l5xVfze
tTzWNpZ/o3e3OppRi87NiYRVwXWraLy4jmAeVA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28752)
`pragma protect data_block
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
m4vhLQhjzY0dD2ujNKXNbTjIrKL432Uo
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

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
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
