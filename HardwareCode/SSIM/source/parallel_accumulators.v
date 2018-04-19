`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2018 09:00:22 PM
// Design Name: 
// Module Name: parallel_accumulators
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


module parallel_accumulators #(parameter BIT_WIDTH = 32)(clk, clr, bypass, 
in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, 
in15, in16, in17, in18, in19, in20, in21, in22, in23, in24, in25, in26, in27, in28, 
out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, 
out15, out16, out17, out18, out19, out20, out21, out22, out23, out24, out25, out26, out27, out28);
    
    input clk, clr, bypass;
    input [BIT_WIDTH - 1:0] in1, in2, in3, in4, in5, in6, in7;
    input [BIT_WIDTH - 1:0] in8, in9, in10, in11, in12, in13, in14;    
    input [BIT_WIDTH - 1:0] in15, in16, in17, in18, in19, in20, in21;
    input [BIT_WIDTH - 1:0] in22, in23, in24, in25, in26, in27, in28;
    
    output [31:0] out1, out2, out3, out4, out5, out6, out7;
    output [31:0] out8, out9, out10, out11, out12, out13, out14;        
    output [31:0] out15, out16, out17, out18, out19, out20, out21;
    output [31:0] out22, out23, out24, out25, out26, out27, out28;                       
  
    accumulator_32bit accumulator1 (
      .B({{32 - BIT_WIDTH{1'b0}}, in1}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out1)            // output wire [31 : 0] Q
    );
    
    accumulator_32bit accumulator2 (
      .B({{32 - BIT_WIDTH{1'b0}}, in2}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out2)            // output wire [31 : 0] Q
    );
        
    accumulator_32bit accumulator3 (
      .B({{32 - BIT_WIDTH{1'b0}}, in3}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out3)            // output wire [31 : 0] Q
    );
    
    accumulator_32bit accumulator4 (
      .B({{32 - BIT_WIDTH{1'b0}}, in4}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out4)            // output wire [31 : 0] Q
    );
        
    accumulator_32bit accumulator5 (
      .B({{32 - BIT_WIDTH{1'b0}}, in5}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out5)            // output wire [31 : 0] Q
    );
    
    accumulator_32bit accumulator6 (
      .B({{32 - BIT_WIDTH{1'b0}}, in6}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out6)            // output wire [31 : 0] Q
    );
        
    accumulator_32bit accumulator7 (
      .B({{32 - BIT_WIDTH{1'b0}}, in7}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out7)            // output wire [31 : 0] Q
    );
    
    accumulator_32bit accumulator8 (
      .B({{32 - BIT_WIDTH{1'b0}}, in8}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out8)            // output wire [31 : 0] Q
    );
        
    accumulator_32bit accumulator9 (
      .B({{32 - BIT_WIDTH{1'b0}}, in9}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out9)            // output wire [31 : 0] Q
    );
    
    accumulator_32bit accumulator10 (
      .B({{32 - BIT_WIDTH{1'b0}}, in10}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out10)            // output wire [31 : 0] Q
    );
        
    accumulator_32bit accumulator11 (
      .B({{32 - BIT_WIDTH{1'b0}}, in11}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out11)            // output wire [31 : 0] Q
    );
    
    accumulator_32bit accumulator12 (
      .B({{32 - BIT_WIDTH{1'b0}}, in12}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out12)            // output wire [31 : 0] Q
    );
        
    accumulator_32bit accumulator13 (
      .B({{32 - BIT_WIDTH{1'b0}}, in13}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out13)            // output wire [31 : 0] Q
    );
    
    accumulator_32bit accumulator14 (
      .B({{32 - BIT_WIDTH{1'b0}}, in14}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out14)            // output wire [31 : 0] Q
    );
      
    accumulator_32bit accumulator15 (
      .B({{32 - BIT_WIDTH{1'b0}}, in15}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out15)            // output wire [31 : 0] Q
    );
    
    accumulator_32bit accumulator16 (
      .B({{32 - BIT_WIDTH{1'b0}}, in16}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out16)            // output wire [31 : 0] Q
    );
        
    accumulator_32bit accumulator17 (
      .B({{32 - BIT_WIDTH{1'b0}}, in17}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out17)            // output wire [31 : 0] Q
    );
    
    accumulator_32bit accumulator18 (
      .B({{32 - BIT_WIDTH{1'b0}}, in18}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out18)            // output wire [31 : 0] Q
    );
        
    accumulator_32bit accumulator19 (
      .B({{32 - BIT_WIDTH{1'b0}}, in19}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out19)            // output wire [31 : 0] Q
    );
    
    accumulator_32bit accumulator20 (
      .B({{32 - BIT_WIDTH{1'b0}}, in20}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out20)            // output wire [31 : 0] Q
    );
        
    accumulator_32bit accumulator21 (
      .B({{32 - BIT_WIDTH{1'b0}}, in21}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out21)            // output wire [31 : 0] Q
    );
    
    accumulator_32bit accumulator22 (
      .B({{32 - BIT_WIDTH{1'b0}}, in22}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out22)            // output wire [31 : 0] Q
    );
        
    accumulator_32bit accumulator23 (
      .B({{32 - BIT_WIDTH{1'b0}}, in23}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out23)            // output wire [31 : 0] Q
    );
    
    accumulator_32bit accumulator24 (
      .B({{32 - BIT_WIDTH{1'b0}}, in24}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out24)            // output wire [31 : 0] Q
    );
        
    accumulator_32bit accumulator25 (
      .B({{32 - BIT_WIDTH{1'b0}}, in25}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out25)            // output wire [31 : 0] Q
    );
    
    accumulator_32bit accumulator26 (
      .B({{32 - BIT_WIDTH{1'b0}}, in26}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out26)            // output wire [31 : 0] Q
    );
        
    accumulator_32bit accumulator27 (
      .B({{32 - BIT_WIDTH{1'b0}}, in27}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out27)            // output wire [31 : 0] Q
    );
    
    accumulator_32bit accumulator28 (
      .B({{32 - BIT_WIDTH{1'b0}}, in28}),            // input wire [31 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass),  // input wire BYPASS
      .SCLR(clr),      // input wire SCLR
      .Q(out28)            // output wire [31 : 0] Q
    );
    
endmodule
