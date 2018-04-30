`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2018 09:14:45 PM
// Design Name: 
// Module Name: Top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: // 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Top(CLK, Rst, Controller_Data_Request, Sum_1_0, Sum_1_1, Sum_1_2, Sum_1_3,Sum_1_4, Sum_1_5, Sum_1_6, Sum_1_7, Sum_1_8, Sum_1_9);
input CLK, Rst;
input Controller_Data_Request;
wire Clear;
wire [15:0] DI;
wire [7:0] DI_Img;
wire  WE;
wire [4:0] W_Add,  W_Add_AGU ;
wire [7:0] Pix_Add, Pix_Add_AGU;
wire Weight_En, Pix_En;
wire Data_Ready, Data_Request, Done;
wire Done_Final_Hidden_Layer;
//(* keep = "true" *)  wire  signed [15:0] SumH_0;
wire Data_Request_Output_Layer , Done_AGU_Output, Done_Output_Layer;
wire [4:0] W_Add_Output_Layer, W_Add_Output_Layer_AGU;
wire  Data_Ready_AGU_Output;
wire W_En_Output_Layer;
wire [4:0] Pix_En_Output_Layer,Pix_En_Output_Layer_AGU ;

wire signed [15:0] Pix_1_0, Pix_1_1, Pix_1_2, Pix_1_3, Pix_1_4, Pix_1_5, Pix_1_6, Pix_1_7, Pix_1_8, Pix_1_9, Pix_1_10,  Pix_1_11, Pix_1_12, Pix_1_13, Pix_1_14, Pix_1_15, Pix_1_16, Pix_1_17, Pix_1_18, Pix_1_19, Pix_1_20, Pix_1_21, Pix_1_22, Pix_1_23, Pix_1_24, Pix_1_25, Pix_1_26, Pix_1_27, Pix_1_28, Pix_1_29;

wire signed [15:0] Bias_0, Bias_1, Bias_2, Bias_3, Bias_4, Bias_5, Bias_6, Bias_7, Bias_8, Bias_9, Bias_10, Bias_11,Bias_12, Bias_13, Bias_14, Bias_15, Bias_16, Bias_17, Bias_18, Bias_19, Bias_20, Bias_21,Bias_22, Bias_23, Bias_24, Bias_25, Bias_26, Bias_27, Bias_28, Bias_29;

wire [7:0] Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27;

//Weight first neuron
wire signed [15:0] W_0_0_0, W_0_0_1, W_0_0_2, W_0_0_3, W_0_0_4, W_0_0_5, W_0_0_6, W_0_0_7, W_0_0_8,W_0_0_9, W_0_0_10,W_0_0_11, W_0_0_12, W_0_0_13, W_0_0_14, W_0_0_15, W_0_0_16, W_0_0_17, W_0_0_18, W_0_0_19, W_0_0_20, W_0_0_21, W_0_0_22, W_0_0_23, W_0_0_24, W_0_0_25, W_0_0_26, W_0_0_27;  

//Weight Second neuron
wire signed [15:0] W_0_1_0, W_0_1_1, W_0_1_2, W_0_1_3, W_0_1_4, W_0_1_5, W_0_1_6, W_0_1_7, W_0_1_8,W_0_1_9, W_0_1_10,W_0_1_11, W_0_1_12, W_0_1_13, W_0_1_14, W_0_1_15, W_0_1_16, W_0_1_17, W_0_1_18, W_0_1_19, W_0_1_20, W_0_1_21, W_0_1_22, W_0_1_23, W_0_1_24, W_0_1_25, W_0_1_26, W_0_1_27;  

//Weight 3rd neuron
wire signed [15:0] W_0_2_0, W_0_2_1, W_0_2_2, W_0_2_3, W_0_2_4, W_0_2_5, W_0_2_6, W_0_2_7, W_0_2_8,W_0_2_9, W_0_2_10,W_0_2_11, W_0_2_12, W_0_2_13, W_0_2_14, W_0_2_15, W_0_2_16, W_0_2_17, W_0_2_18, W_0_2_19, W_0_2_20, W_0_2_21, W_0_2_22, W_0_2_23, W_0_2_24, W_0_2_25, W_0_2_26, W_0_2_27;  

//Weight 4th neuron
wire signed [15:0] W_0_3_0, W_0_3_1, W_0_3_2, W_0_3_3, W_0_3_4, W_0_3_5, W_0_3_6, W_0_3_7, W_0_3_8,W_0_3_9, W_0_3_10,W_0_3_11, W_0_3_12, W_0_3_13, W_0_3_14, W_0_3_15, W_0_3_16, W_0_3_17, W_0_3_18, W_0_3_19, W_0_3_20, W_0_3_21, W_0_3_22, W_0_3_23, W_0_3_24, W_0_3_25, W_0_3_26, W_0_3_27;  

//Weight 5th neuron
wire signed [15:0] W_0_4_0, W_0_4_1, W_0_4_2, W_0_4_3, W_0_4_4, W_0_4_5, W_0_4_6, W_0_4_7, W_0_4_8,W_0_4_9, W_0_4_10,W_0_4_11, W_0_4_12, W_0_4_13, W_0_4_14, W_0_4_15, W_0_4_16, W_0_4_17, W_0_4_18, W_0_4_19, W_0_4_20, W_0_4_21, W_0_4_22, W_0_4_23, W_0_4_24, W_0_4_25, W_0_4_26, W_0_4_27;  

//Weight 6th neuron
wire signed [15:0] W_0_5_0, W_0_5_1, W_0_5_2, W_0_5_3, W_0_5_4, W_0_5_5, W_0_5_6, W_0_5_7, W_0_5_8,W_0_5_9, W_0_5_10,W_0_5_11, W_0_5_12, W_0_5_13, W_0_5_14, W_0_5_15, W_0_5_16, W_0_5_17, W_0_5_18, W_0_5_19, W_0_5_20, W_0_5_21, W_0_5_22, W_0_5_23, W_0_5_24, W_0_5_25, W_0_5_26, W_0_5_27;  

//Weight 7th neuron
wire signed [15:0] W_0_6_0, W_0_6_1, W_0_6_2, W_0_6_3, W_0_6_4, W_0_6_5, W_0_6_6, W_0_6_7, W_0_6_8,W_0_6_9, W_0_6_10,W_0_6_11, W_0_6_12, W_0_6_13, W_0_6_14, W_0_6_15, W_0_6_16, W_0_6_17, W_0_6_18, W_0_6_19, W_0_6_20, W_0_6_21, W_0_6_22, W_0_6_23, W_0_6_24, W_0_6_25, W_0_6_26, W_0_6_27;  

//Weight 8th neuron
wire signed [15:0] W_0_7_0, W_0_7_1, W_0_7_2, W_0_7_3, W_0_7_4, W_0_7_5, W_0_7_6, W_0_7_7, W_0_7_8,W_0_7_9, W_0_7_10,W_0_7_11, W_0_7_12, W_0_7_13, W_0_7_14, W_0_7_15, W_0_7_16, W_0_7_17, W_0_7_18, W_0_7_19, W_0_7_20, W_0_7_21, W_0_7_22, W_0_7_23, W_0_7_24, W_0_7_25, W_0_7_26, W_0_7_27;  

//Weight 9th neuron
wire signed [15:0] W_0_8_0, W_0_8_1, W_0_8_2, W_0_8_3, W_0_8_4, W_0_8_5, W_0_8_6, W_0_8_7, W_0_8_8,W_0_8_9, W_0_8_10,W_0_8_11, W_0_8_12, W_0_8_13, W_0_8_14, W_0_8_15, W_0_8_16, W_0_8_17, W_0_8_18, W_0_8_19, W_0_8_20, W_0_8_21, W_0_8_22, W_0_8_23, W_0_8_24, W_0_8_25, W_0_8_26, W_0_8_27;  

//Weight 10th neuron
wire signed [15:0] W_0_9_0, W_0_9_1, W_0_9_2, W_0_9_3, W_0_9_4, W_0_9_5, W_0_9_6, W_0_9_7, W_0_9_8,W_0_9_9, W_0_9_10,W_0_9_11, W_0_9_12, W_0_9_13, W_0_9_14, W_0_9_15, W_0_9_16, W_0_9_17, W_0_9_18, W_0_9_19, W_0_9_20, W_0_9_21, W_0_9_22, W_0_9_23, W_0_9_24, W_0_9_25, W_0_9_26, W_0_9_27;  

//Weight 11th neuron
wire signed [15:0] W_0_10_0, W_0_10_1, W_0_10_2, W_0_10_3, W_0_10_4, W_0_10_5, W_0_10_6, W_0_10_7, W_0_10_8,W_0_10_9, W_0_10_10,W_0_10_11, W_0_10_12, W_0_10_13, W_0_10_14, W_0_10_15, W_0_10_16, W_0_10_17, W_0_10_18, W_0_10_19, W_0_10_20, W_0_10_21, W_0_10_22, W_0_10_23, W_0_10_24, W_0_10_25, W_0_10_26, W_0_10_27;  

//Weight 12th neuron
wire signed [15:0] W_0_11_0, W_0_11_1, W_0_11_2, W_0_11_3, W_0_11_4, W_0_11_5, W_0_11_6, W_0_11_7, W_0_11_8,W_0_11_9, W_0_11_10,W_0_11_11, W_0_11_12, W_0_11_13, W_0_11_14, W_0_11_15, W_0_11_16, W_0_11_17, W_0_11_18, W_0_11_19, W_0_11_20, W_0_11_21, W_0_11_22, W_0_11_23, W_0_11_24, W_0_11_25, W_0_11_26, W_0_11_27;  

//Weight 13th neuron
wire signed [15:0] W_0_12_0, W_0_12_1, W_0_12_2, W_0_12_3, W_0_12_4, W_0_12_5, W_0_12_6, W_0_12_7, W_0_12_8,W_0_12_9, W_0_12_10,W_0_12_11, W_0_12_12, W_0_12_13, W_0_12_14, W_0_12_15, W_0_12_16, W_0_12_17, W_0_12_18, W_0_12_19, W_0_12_20, W_0_12_21, W_0_12_22, W_0_12_23, W_0_12_24, W_0_12_25, W_0_12_26, W_0_12_27;  


//Weight 14th neuron
wire signed [15:0] W_0_13_0, W_0_13_1, W_0_13_2, W_0_13_3, W_0_13_4, W_0_13_5, W_0_13_6, W_0_13_7, W_0_13_8,W_0_13_9, W_0_13_10,W_0_13_11, W_0_13_12, W_0_13_13, W_0_13_14, W_0_13_15, W_0_13_16, W_0_13_17, W_0_13_18, W_0_13_19, W_0_13_20, W_0_13_21, W_0_13_22, W_0_13_23, W_0_13_24, W_0_13_25, W_0_13_26, W_0_13_27;  

//Weight 15th neuron
wire signed [15:0] W_0_14_0, W_0_14_1, W_0_14_2, W_0_14_3, W_0_14_4, W_0_14_5, W_0_14_6, W_0_14_7, W_0_14_8,W_0_14_9, W_0_14_10,W_0_14_11, W_0_14_12, W_0_14_13, W_0_14_14, W_0_14_15, W_0_14_16, W_0_14_17, W_0_14_18, W_0_14_19, W_0_14_20, W_0_14_21, W_0_14_22, W_0_14_23, W_0_14_24, W_0_14_25, W_0_14_26, W_0_14_27;  

//Weight 16th neuron
wire signed [15:0] W_0_15_0, W_0_15_1, W_0_15_2, W_0_15_3, W_0_15_4, W_0_15_5, W_0_15_6, W_0_15_7, W_0_15_8,W_0_15_9, W_0_15_10,W_0_15_11, W_0_15_12, W_0_15_13, W_0_15_14, W_0_15_15, W_0_15_16, W_0_15_17, W_0_15_18, W_0_15_19, W_0_15_20, W_0_15_21, W_0_15_22, W_0_15_23, W_0_15_24, W_0_15_25, W_0_15_26, W_0_15_27;  

//Weight 17th neuron
wire signed [15:0] W_0_16_0, W_0_16_1, W_0_16_2, W_0_16_3, W_0_16_4, W_0_16_5, W_0_16_6, W_0_16_7, W_0_16_8,W_0_16_9, W_0_16_10,W_0_16_11, W_0_16_12, W_0_16_13, W_0_16_14, W_0_16_15, W_0_16_16, W_0_16_17, W_0_16_18, W_0_16_19, W_0_16_20, W_0_16_21, W_0_16_22, W_0_16_23, W_0_16_24, W_0_16_25, W_0_16_26, W_0_16_27;  

//Weight 18th neuron
wire signed [15:0] W_0_17_0, W_0_17_1, W_0_17_2, W_0_17_3, W_0_17_4, W_0_17_5, W_0_17_6, W_0_17_7, W_0_17_8,W_0_17_9, W_0_17_10,W_0_17_11, W_0_17_12, W_0_17_13, W_0_17_14, W_0_17_15, W_0_17_16, W_0_17_17, W_0_17_18, W_0_17_19, W_0_17_20, W_0_17_21, W_0_17_22, W_0_17_23, W_0_17_24, W_0_17_25, W_0_17_26, W_0_17_27;  

//Weight 19th neuron
 wire signed [15:0] W_0_18_0, W_0_18_1, W_0_18_2, W_0_18_3, W_0_18_4, W_0_18_5, W_0_18_6, W_0_18_7, W_0_18_8,W_0_18_9, W_0_18_10,W_0_18_11, W_0_18_12, W_0_18_13, W_0_18_14, W_0_18_15, W_0_18_16, W_0_18_17, W_0_18_18, W_0_18_19, W_0_18_20, W_0_18_21, W_0_18_22, W_0_18_23, W_0_18_24, W_0_18_25, W_0_18_26, W_0_18_27;  

//Weight 20th neuron
 wire signed [15:0] W_0_19_0, W_0_19_1, W_0_19_2, W_0_19_3, W_0_19_4, W_0_19_5, W_0_19_6, W_0_19_7, W_0_19_8,W_0_19_9, W_0_19_10,W_0_19_11, W_0_19_12, W_0_19_13, W_0_19_14, W_0_19_15, W_0_19_16, W_0_19_17, W_0_19_18, W_0_19_19, W_0_19_20, W_0_19_21, W_0_19_22, W_0_19_23, W_0_19_24, W_0_19_25, W_0_19_26, W_0_19_27;  

//Weight 21st neuron
wire signed [15:0] W_0_20_0, W_0_20_1, W_0_20_2, W_0_20_3, W_0_20_4, W_0_20_5, W_0_20_6, W_0_20_7, W_0_20_8,W_0_20_9, W_0_20_10,W_0_20_11, W_0_20_12, W_0_20_13, W_0_20_14, W_0_20_15, W_0_20_16, W_0_20_17, W_0_20_18, W_0_20_19, W_0_20_20, W_0_20_21, W_0_20_22, W_0_20_23, W_0_20_24, W_0_20_25, W_0_20_26, W_0_20_27;  

//Weight 22nd neuron
wire signed [15:0] W_0_21_0, W_0_21_1, W_0_21_2, W_0_21_3, W_0_21_4, W_0_21_5, W_0_21_6, W_0_21_7, W_0_21_8,W_0_21_9, W_0_21_10,W_0_21_11, W_0_21_12, W_0_21_13, W_0_21_14, W_0_21_15, W_0_21_16, W_0_21_17, W_0_21_18, W_0_21_19, W_0_21_20, W_0_21_21, W_0_21_22, W_0_21_23, W_0_21_24, W_0_21_25, W_0_21_26, W_0_21_27;  

//Weight 23rd neuron
wire signed [15:0] W_0_22_0, W_0_22_1, W_0_22_2, W_0_22_3, W_0_22_4, W_0_22_5, W_0_22_6, W_0_22_7, W_0_22_8,W_0_22_9, W_0_22_10,W_0_22_11, W_0_22_12, W_0_22_13, W_0_22_14, W_0_22_15, W_0_22_16, W_0_22_17, W_0_22_18, W_0_22_19, W_0_22_20, W_0_22_21, W_0_22_22, W_0_22_23, W_0_22_24, W_0_22_25, W_0_22_26, W_0_22_27;  

//Weight 24th neuron
 wire signed [15:0] W_0_23_0, W_0_23_1, W_0_23_2, W_0_23_3, W_0_23_4, W_0_23_5, W_0_23_6, W_0_23_7, W_0_23_8,W_0_23_9, W_0_23_10,W_0_23_11, W_0_23_12, W_0_23_13, W_0_23_14, W_0_23_15, W_0_23_16, W_0_23_17, W_0_23_18, W_0_23_19, W_0_23_20, W_0_23_21, W_0_23_22, W_0_23_23, W_0_23_24, W_0_23_25, W_0_23_26, W_0_23_27;  

//Weight 25th neuron
wire signed [15:0] W_0_24_0, W_0_24_1, W_0_24_2, W_0_24_3, W_0_24_4, W_0_24_5, W_0_24_6, W_0_24_7, W_0_24_8,W_0_24_9, W_0_24_10,W_0_24_11, W_0_24_12, W_0_24_13, W_0_24_14, W_0_24_15, W_0_24_16, W_0_24_17, W_0_24_18, W_0_24_19, W_0_24_20, W_0_24_21, W_0_24_22, W_0_24_23, W_0_24_24, W_0_24_25, W_0_24_26, W_0_24_27;  

//Weight 26th neuron
 wire signed [15:0] W_0_25_0, W_0_25_1, W_0_25_2, W_0_25_3, W_0_25_4, W_0_25_5, W_0_25_6, W_0_25_7, W_0_25_8,W_0_25_9, W_0_25_10,W_0_25_11, W_0_25_12, W_0_25_13, W_0_25_14, W_0_25_15, W_0_25_16, W_0_25_17, W_0_25_18, W_0_25_19, W_0_25_20, W_0_25_21, W_0_25_22, W_0_25_23, W_0_25_24, W_0_25_25, W_0_25_26, W_0_25_27;  

//Weight 27th neuron
wire signed [15:0] W_0_26_0, W_0_26_1, W_0_26_2, W_0_26_3, W_0_26_4, W_0_26_5, W_0_26_6, W_0_26_7, W_0_26_8,W_0_26_9, W_0_26_10,W_0_26_11, W_0_26_12, W_0_26_13, W_0_26_14, W_0_26_15, W_0_26_16, W_0_26_17, W_0_26_18, W_0_26_19, W_0_26_20, W_0_26_21, W_0_26_22, W_0_26_23, W_0_26_24, W_0_26_25, W_0_26_26, W_0_26_27;  

//Weight 28th neuron
wire signed [15:0] W_0_27_0, W_0_27_1, W_0_27_2, W_0_27_3, W_0_27_4, W_0_27_5, W_0_27_6, W_0_27_7, W_0_27_8,W_0_27_9, W_0_27_10,W_0_27_11, W_0_27_12, W_0_27_13, W_0_27_14, W_0_27_15, W_0_27_16, W_0_27_17, W_0_27_18, W_0_27_19, W_0_27_20, W_0_27_21, W_0_27_22, W_0_27_23, W_0_27_24, W_0_27_25, W_0_27_26, W_0_27_27;  

//Weight 29th neuron
wire signed [15:0] W_0_28_0, W_0_28_1, W_0_28_2, W_0_28_3, W_0_28_4, W_0_28_5, W_0_28_6, W_0_28_7, W_0_28_8,W_0_28_9, W_0_28_10,W_0_28_11, W_0_28_12, W_0_28_13, W_0_28_14, W_0_28_15, W_0_28_16, W_0_28_17, W_0_28_18, W_0_28_19, W_0_28_20, W_0_28_21, W_0_28_22, W_0_28_23, W_0_28_24, W_0_28_25, W_0_28_26, W_0_28_27;  

//Weight 30th neuron
 wire signed [15:0] W_0_29_0, W_0_29_1, W_0_29_2, W_0_29_3, W_0_29_4, W_0_29_5, W_0_29_6, W_0_29_7, W_0_29_8,W_0_29_9, W_0_29_10,W_0_29_11, W_0_29_12, W_0_29_13, W_0_29_14, W_0_29_15, W_0_29_16, W_0_29_17, W_0_29_18, W_0_29_19, W_0_29_20, W_0_29_21, W_0_29_22, W_0_29_23, W_0_29_24, W_0_29_25, W_0_29_26, W_0_29_27;  
assign Clear = (Rst |Controller_Data_Request ) ? 1:0;
//Second Layer 
wire  signed[15:0] W_1_0, W_1_1, W_1_2, W_1_3, W_1_4, W_1_5, W_1_6, W_1_7, W_1_8, W_1_9;
output wire [31:0] Sum_1_0, Sum_1_1, Sum_1_2, Sum_1_3,Sum_1_4, Sum_1_5, Sum_1_6, Sum_1_7, Sum_1_8, Sum_1_9;
wire signed [15:0] Bias_1_0, Bias_1_1, Bias_1_2, Bias_1_3,Bias_1_4, Bias_1_5, Bias_1_6, Bias_1_7, Bias_1_8, Bias_1_9;
reg signed [15:0] Pix_Out;
wire signed [15:0] Pix_Out_Mux;
AGU U0(CLK, Rst, Data_Request,  W_Add_AGU, Pix_Add_AGU, Data_Ready, Done, Weight_En , Pix_En,  Controller_Data_Request);
assign W_Add = W_Add_AGU - 1;
assign Pix_Add = Pix_Add_AGU - 1;
Image_BRAM_0             Image_BRAM_0(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_0);
Image_BRAM_1             Image_BRAM_1(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_1);
Image_BRAM_2             Image_BRAM_2(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_2);
Image_BRAM_3             Image_BRAM_3(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_3);
Image_BRAM_4             Image_BRAM_4(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_4);
Image_BRAM_5             Image_BRAM_5(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_5);
Image_BRAM_6             Image_BRAM_6(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_6);
Image_BRAM_7             Image_BRAM_7(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_7);
Image_BRAM_8             Image_BRAM_8(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_8);
Image_BRAM_9             Image_BRAM_9(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_9);
Image_BRAM_10            Image_BRAM_10(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_10);
Image_BRAM_11            Image_BRAM_11(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_11);
Image_BRAM_12            Image_BRAM_12(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_12);
Image_BRAM_13            Image_BRAM_13(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_13);
Image_BRAM_14            Image_BRAM_14(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_14);
Image_BRAM_15            Image_BRAM_15(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_15);
Image_BRAM_16            Image_BRAM_16(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_16);
Image_BRAM_17            Image_BRAM_17(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_17);
Image_BRAM_18            Image_BRAM_18(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_18);
Image_BRAM_19            Image_BRAM_19(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_19);
Image_BRAM_20            Image_BRAM_20(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_20);
Image_BRAM_21            Image_BRAM_21(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_21);
Image_BRAM_22            Image_BRAM_22(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_22);
Image_BRAM_23            Image_BRAM_23(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_23);
Image_BRAM_24            Image_BRAM_24(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_24);
Image_BRAM_25            Image_BRAM_25(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_25);
Image_BRAM_26            Image_BRAM_26(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_26);
Image_BRAM_27            Image_BRAM_27(Pix_Add,DI_Img,Pix_En,WE,CLK,Pix_27);
//BRAM Frist Neuron
Weight_0_0_0_BRAM     BRAM_0_0(W_Add,DI,Weight_En,WE,CLK,W_0_0_0);
Weight_0_0_1_BRAM     BRAM_0_1(W_Add,DI,Weight_En,WE,CLK,W_0_0_1);
Weight_0_0_2_BRAM     BRAM_0_2(W_Add,DI,Weight_En,WE,CLK,W_0_0_2);
Weight_0_0_3_BRAM     BRAM_0_3(W_Add,DI,Weight_En,WE,CLK,W_0_0_3);
Weight_0_0_4_BRAM     BRAM_0_4(W_Add,DI,Weight_En,WE,CLK,W_0_0_4);
Weight_0_0_5_BRAM     BRAM_0_5(W_Add,DI,Weight_En,WE,CLK,W_0_0_5);
Weight_0_0_6_BRAM     BRAM_0_6(W_Add,DI,Weight_En,WE,CLK,W_0_0_6);
Weight_0_0_7_BRAM     BRAM_0_7(W_Add,DI,Weight_En,WE,CLK,W_0_0_7);
Weight_0_0_8_BRAM     BRAM_0_8(W_Add,DI,Weight_En,WE,CLK,W_0_0_8);
Weight_0_0_9_BRAM     BRAM_0_9(W_Add,DI,Weight_En,WE,CLK,W_0_0_9);
Weight_0_0_10_BRAM     BRAM_0_10(W_Add,DI,Weight_En,WE,CLK,W_0_0_10);
Weight_0_0_11_BRAM     BRAM_0_11(W_Add,DI,Weight_En,WE,CLK,W_0_0_11);
Weight_0_0_12_BRAM     BRAM_0_12(W_Add,DI,Weight_En,WE,CLK,W_0_0_12);
Weight_0_0_13_BRAM     BRAM_0_13(W_Add,DI,Weight_En,WE,CLK,W_0_0_13);
Weight_0_0_14_BRAM     BRAM_0_14(W_Add,DI,Weight_En,WE,CLK,W_0_0_14);
Weight_0_0_15_BRAM     BRAM_0_15(W_Add,DI,Weight_En,WE,CLK,W_0_0_15);
Weight_0_0_16_BRAM     BRAM_0_16(W_Add,DI,Weight_En,WE,CLK,W_0_0_16);
Weight_0_0_17_BRAM     BRAM_0_17(W_Add,DI,Weight_En,WE,CLK,W_0_0_17);
Weight_0_0_18_BRAM     BRAM_0_18(W_Add,DI,Weight_En,WE,CLK,W_0_0_18);
Weight_0_0_19_BRAM     BRAM_0_19(W_Add,DI,Weight_En,WE,CLK,W_0_0_19);
Weight_0_0_20_BRAM     BRAM_0_20(W_Add,DI,Weight_En,WE,CLK,W_0_0_20);
Weight_0_0_21_BRAM     BRAM_0_21(W_Add,DI,Weight_En,WE,CLK,W_0_0_21);
Weight_0_0_22_BRAM     BRAM_0_22(W_Add,DI,Weight_En,WE,CLK,W_0_0_22);
Weight_0_0_23_BRAM     BRAM_0_23(W_Add,DI,Weight_En,WE,CLK,W_0_0_23);
Weight_0_0_24_BRAM     BRAM_0_24(W_Add,DI,Weight_En,WE,CLK,W_0_0_24);
Weight_0_0_25_BRAM     BRAM_0_25(W_Add,DI,Weight_En,WE,CLK,W_0_0_25);
Weight_0_0_26_BRAM     BRAM_0_26(W_Add,DI,Weight_En,WE,CLK,W_0_0_26);
Weight_0_0_27_BRAM     BRAM_0_27(W_Add,DI,Weight_En,WE,CLK,W_0_0_27);

//BRAM 2nd Neuron
Weight_0_1_0_BRAM     BRAM_1_0(W_Add,DI,Weight_En,WE,CLK,W_0_1_0);
Weight_0_1_1_BRAM     BRAM_1_1(W_Add,DI,Weight_En,WE,CLK,W_0_1_1);
Weight_0_1_2_BRAM     BRAM_1_2(W_Add,DI,Weight_En,WE,CLK,W_0_1_2);
Weight_0_1_3_BRAM     BRAM_1_3(W_Add,DI,Weight_En,WE,CLK,W_0_1_3);
Weight_0_1_4_BRAM     BRAM_1_4(W_Add,DI,Weight_En,WE,CLK,W_0_1_4);
Weight_0_1_5_BRAM     BRAM_1_5(W_Add,DI,Weight_En,WE,CLK,W_0_1_5);
Weight_0_1_6_BRAM     BRAM_1_6(W_Add,DI,Weight_En,WE,CLK,W_0_1_6);
Weight_0_1_7_BRAM     BRAM_1_7(W_Add,DI,Weight_En,WE,CLK,W_0_1_7);
Weight_0_1_8_BRAM     BRAM_1_8(W_Add,DI,Weight_En,WE,CLK,W_0_1_8);
Weight_0_1_9_BRAM     BRAM_1_9(W_Add,DI,Weight_En,WE,CLK,W_0_1_9);
Weight_0_1_10_BRAM     BRAM_1_10(W_Add,DI,Weight_En,WE,CLK,W_0_1_10);
Weight_0_1_11_BRAM     BRAM_1_11(W_Add,DI,Weight_En,WE,CLK,W_0_1_11);
Weight_0_1_12_BRAM     BRAM_1_12(W_Add,DI,Weight_En,WE,CLK,W_0_1_12);
Weight_0_1_13_BRAM     BRAM_1_13(W_Add,DI,Weight_En,WE,CLK,W_0_1_13);
Weight_0_1_14_BRAM     BRAM_1_14(W_Add,DI,Weight_En,WE,CLK,W_0_1_14);
Weight_0_1_15_BRAM     BRAM_1_15(W_Add,DI,Weight_En,WE,CLK,W_0_1_15);
Weight_0_1_16_BRAM     BRAM_1_16(W_Add,DI,Weight_En,WE,CLK,W_0_1_16);
Weight_0_1_17_BRAM     BRAM_1_17(W_Add,DI,Weight_En,WE,CLK,W_0_1_17);
Weight_0_1_18_BRAM     BRAM_1_18(W_Add,DI,Weight_En,WE,CLK,W_0_1_18);
Weight_0_1_19_BRAM     BRAM_1_19(W_Add,DI,Weight_En,WE,CLK,W_0_1_19);
Weight_0_1_20_BRAM     BRAM_1_20(W_Add,DI,Weight_En,WE,CLK,W_0_1_20);
Weight_0_1_21_BRAM     BRAM_1_21(W_Add,DI,Weight_En,WE,CLK,W_0_1_21);
Weight_0_1_22_BRAM     BRAM_1_22(W_Add,DI,Weight_En,WE,CLK,W_0_1_22);
Weight_0_1_23_BRAM     BRAM_1_23(W_Add,DI,Weight_En,WE,CLK,W_0_1_23);
Weight_0_1_24_BRAM     BRAM_1_24(W_Add,DI,Weight_En,WE,CLK,W_0_1_24);
Weight_0_1_25_BRAM     BRAM_1_25(W_Add,DI,Weight_En,WE,CLK,W_0_1_25);
Weight_0_1_26_BRAM     BRAM_1_26(W_Add,DI,Weight_En,WE,CLK,W_0_1_26);
Weight_0_1_27_BRAM     BRAM_1_27(W_Add,DI,Weight_En,WE,CLK,W_0_1_27);

//BRAM 3rd Neuron
Weight_0_2_0_BRAM     BRAM_2_0(W_Add,DI,Weight_En,WE,CLK,W_0_2_0);
Weight_0_2_1_BRAM     BRAM_2_1(W_Add,DI,Weight_En,WE,CLK,W_0_2_1);
Weight_0_2_2_BRAM     BRAM_2_2(W_Add,DI,Weight_En,WE,CLK,W_0_2_2);
Weight_0_2_3_BRAM     BRAM_2_3(W_Add,DI,Weight_En,WE,CLK,W_0_2_3);
Weight_0_2_4_BRAM     BRAM_2_4(W_Add,DI,Weight_En,WE,CLK,W_0_2_4);
Weight_0_2_5_BRAM     BRAM_2_5(W_Add,DI,Weight_En,WE,CLK,W_0_2_5);
Weight_0_2_6_BRAM     BRAM_2_6(W_Add,DI,Weight_En,WE,CLK,W_0_2_6);
Weight_0_2_7_BRAM     BRAM_2_7(W_Add,DI,Weight_En,WE,CLK,W_0_2_7);
Weight_0_2_8_BRAM     BRAM_2_8(W_Add,DI,Weight_En,WE,CLK,W_0_2_8);
Weight_0_2_9_BRAM     BRAM_2_9(W_Add,DI,Weight_En,WE,CLK,W_0_2_9);
Weight_0_2_10_BRAM     BRAM_2_10(W_Add,DI,Weight_En,WE,CLK,W_0_2_10);
Weight_0_2_11_BRAM     BRAM_2_11(W_Add,DI,Weight_En,WE,CLK,W_0_2_11);
Weight_0_2_12_BRAM     BRAM_2_12(W_Add,DI,Weight_En,WE,CLK,W_0_2_12);
Weight_0_2_13_BRAM     BRAM_2_13(W_Add,DI,Weight_En,WE,CLK,W_0_2_13);
Weight_0_2_14_BRAM     BRAM_2_14(W_Add,DI,Weight_En,WE,CLK,W_0_2_14);
Weight_0_2_15_BRAM     BRAM_2_15(W_Add,DI,Weight_En,WE,CLK,W_0_2_15);
Weight_0_2_16_BRAM     BRAM_2_16(W_Add,DI,Weight_En,WE,CLK,W_0_2_16);
Weight_0_2_17_BRAM     BRAM_2_17(W_Add,DI,Weight_En,WE,CLK,W_0_2_17);
Weight_0_2_18_BRAM     BRAM_2_18(W_Add,DI,Weight_En,WE,CLK,W_0_2_18);
Weight_0_2_19_BRAM     BRAM_2_19(W_Add,DI,Weight_En,WE,CLK,W_0_2_19);
Weight_0_2_20_BRAM     BRAM_2_20(W_Add,DI,Weight_En,WE,CLK,W_0_2_20);
Weight_0_2_21_BRAM     BRAM_2_21(W_Add,DI,Weight_En,WE,CLK,W_0_2_21);
Weight_0_2_22_BRAM     BRAM_2_22(W_Add,DI,Weight_En,WE,CLK,W_0_2_22);
Weight_0_2_23_BRAM     BRAM_2_23(W_Add,DI,Weight_En,WE,CLK,W_0_2_23);
Weight_0_2_24_BRAM     BRAM_2_24(W_Add,DI,Weight_En,WE,CLK,W_0_2_24);
Weight_0_2_25_BRAM     BRAM_2_25(W_Add,DI,Weight_En,WE,CLK,W_0_2_25);
Weight_0_2_26_BRAM     BRAM_2_26(W_Add,DI,Weight_En,WE,CLK,W_0_2_26);
Weight_0_2_27_BRAM     BRAM_2_27(W_Add,DI,Weight_En,WE,CLK,W_0_2_27);

//BRAM 4th Neuron
Weight_0_3_0_BRAM     BRAM_3_0(W_Add,DI,Weight_En,WE,CLK,W_0_3_0);
Weight_0_3_1_BRAM     BRAM_3_1(W_Add,DI,Weight_En,WE,CLK,W_0_3_1);
Weight_0_3_2_BRAM     BRAM_3_2(W_Add,DI,Weight_En,WE,CLK,W_0_3_2);
Weight_0_3_3_BRAM     BRAM_3_3(W_Add,DI,Weight_En,WE,CLK,W_0_3_3);
Weight_0_3_4_BRAM     BRAM_3_4(W_Add,DI,Weight_En,WE,CLK,W_0_3_4);
Weight_0_3_5_BRAM     BRAM_3_5(W_Add,DI,Weight_En,WE,CLK,W_0_3_5);
Weight_0_3_6_BRAM     BRAM_3_6(W_Add,DI,Weight_En,WE,CLK,W_0_3_6);
Weight_0_3_7_BRAM     BRAM_3_7(W_Add,DI,Weight_En,WE,CLK,W_0_3_7);
Weight_0_3_8_BRAM     BRAM_3_8(W_Add,DI,Weight_En,WE,CLK,W_0_3_8);
Weight_0_3_9_BRAM     BRAM_3_9(W_Add,DI,Weight_En,WE,CLK,W_0_3_9);
Weight_0_3_10_BRAM     BRAM_3_10(W_Add,DI,Weight_En,WE,CLK,W_0_3_10);
Weight_0_3_11_BRAM     BRAM_3_11(W_Add,DI,Weight_En,WE,CLK,W_0_3_11);
Weight_0_3_12_BRAM     BRAM_3_12(W_Add,DI,Weight_En,WE,CLK,W_0_3_12);
Weight_0_3_13_BRAM     BRAM_3_13(W_Add,DI,Weight_En,WE,CLK,W_0_3_13);
Weight_0_3_14_BRAM     BRAM_3_14(W_Add,DI,Weight_En,WE,CLK,W_0_3_14);
Weight_0_3_15_BRAM     BRAM_3_15(W_Add,DI,Weight_En,WE,CLK,W_0_3_15);
Weight_0_3_16_BRAM     BRAM_3_16(W_Add,DI,Weight_En,WE,CLK,W_0_3_16);
Weight_0_3_17_BRAM     BRAM_3_17(W_Add,DI,Weight_En,WE,CLK,W_0_3_17);
Weight_0_3_18_BRAM     BRAM_3_18(W_Add,DI,Weight_En,WE,CLK,W_0_3_18);
Weight_0_3_19_BRAM     BRAM_3_19(W_Add,DI,Weight_En,WE,CLK,W_0_3_19);
Weight_0_3_20_BRAM     BRAM_3_20(W_Add,DI,Weight_En,WE,CLK,W_0_3_20);
Weight_0_3_21_BRAM     BRAM_3_21(W_Add,DI,Weight_En,WE,CLK,W_0_3_21);
Weight_0_3_22_BRAM     BRAM_3_22(W_Add,DI,Weight_En,WE,CLK,W_0_3_22);
Weight_0_3_23_BRAM     BRAM_3_23(W_Add,DI,Weight_En,WE,CLK,W_0_3_23);
Weight_0_3_24_BRAM     BRAM_3_24(W_Add,DI,Weight_En,WE,CLK,W_0_3_24);
Weight_0_3_25_BRAM     BRAM_3_25(W_Add,DI,Weight_En,WE,CLK,W_0_3_25);
Weight_0_3_26_BRAM     BRAM_3_26(W_Add,DI,Weight_En,WE,CLK,W_0_3_26);
Weight_0_3_27_BRAM     BRAM_3_27(W_Add,DI,Weight_En,WE,CLK,W_0_3_27);

//BRAM 5th Neuron
Weight_0_4_0_BRAM     BRAM_4_0(W_Add,DI,Weight_En,WE,CLK,W_0_4_0);
Weight_0_4_1_BRAM     BRAM_4_1(W_Add,DI,Weight_En,WE,CLK,W_0_4_1);
Weight_0_4_2_BRAM     BRAM_4_2(W_Add,DI,Weight_En,WE,CLK,W_0_4_2);
Weight_0_4_3_BRAM     BRAM_4_3(W_Add,DI,Weight_En,WE,CLK,W_0_4_3);
Weight_0_4_4_BRAM     BRAM_4_4(W_Add,DI,Weight_En,WE,CLK,W_0_4_4);
Weight_0_4_5_BRAM     BRAM_4_5(W_Add,DI,Weight_En,WE,CLK,W_0_4_5);
Weight_0_4_6_BRAM     BRAM_4_6(W_Add,DI,Weight_En,WE,CLK,W_0_4_6);
Weight_0_4_7_BRAM     BRAM_4_7(W_Add,DI,Weight_En,WE,CLK,W_0_4_7);
Weight_0_4_8_BRAM     BRAM_4_8(W_Add,DI,Weight_En,WE,CLK,W_0_4_8);
Weight_0_4_9_BRAM     BRAM_4_9(W_Add,DI,Weight_En,WE,CLK,W_0_4_9);
Weight_0_4_10_BRAM     BRAM_4_10(W_Add,DI,Weight_En,WE,CLK,W_0_4_10);
Weight_0_4_11_BRAM     BRAM_4_11(W_Add,DI,Weight_En,WE,CLK,W_0_4_11);
Weight_0_4_12_BRAM     BRAM_4_12(W_Add,DI,Weight_En,WE,CLK,W_0_4_12);
Weight_0_4_13_BRAM     BRAM_4_13(W_Add,DI,Weight_En,WE,CLK,W_0_4_13);
Weight_0_4_14_BRAM     BRAM_4_14(W_Add,DI,Weight_En,WE,CLK,W_0_4_14);
Weight_0_4_15_BRAM     BRAM_4_15(W_Add,DI,Weight_En,WE,CLK,W_0_4_15);
Weight_0_4_16_BRAM     BRAM_4_16(W_Add,DI,Weight_En,WE,CLK,W_0_4_16);
Weight_0_4_17_BRAM     BRAM_4_17(W_Add,DI,Weight_En,WE,CLK,W_0_4_17);
Weight_0_4_18_BRAM     BRAM_4_18(W_Add,DI,Weight_En,WE,CLK,W_0_4_18);
Weight_0_4_19_BRAM     BRAM_4_19(W_Add,DI,Weight_En,WE,CLK,W_0_4_19);
Weight_0_4_20_BRAM     BRAM_4_20(W_Add,DI,Weight_En,WE,CLK,W_0_4_20);
Weight_0_4_21_BRAM     BRAM_4_21(W_Add,DI,Weight_En,WE,CLK,W_0_4_21);
Weight_0_4_22_BRAM     BRAM_4_22(W_Add,DI,Weight_En,WE,CLK,W_0_4_22);
Weight_0_4_23_BRAM     BRAM_4_23(W_Add,DI,Weight_En,WE,CLK,W_0_4_23);
Weight_0_4_24_BRAM     BRAM_4_24(W_Add,DI,Weight_En,WE,CLK,W_0_4_24);
Weight_0_4_25_BRAM     BRAM_4_25(W_Add,DI,Weight_En,WE,CLK,W_0_4_25);
Weight_0_4_26_BRAM     BRAM_4_26(W_Add,DI,Weight_En,WE,CLK,W_0_4_26);
Weight_0_4_27_BRAM     BRAM_4_27(W_Add,DI,Weight_En,WE,CLK,W_0_4_27);



//BRAM 6th Neuron
Weight_0_5_0_BRAM     BRAM_5_0(W_Add,DI,Weight_En,WE,CLK,W_0_5_0);
Weight_0_5_1_BRAM     BRAM_5_1(W_Add,DI,Weight_En,WE,CLK,W_0_5_1);
Weight_0_5_2_BRAM     BRAM_5_2(W_Add,DI,Weight_En,WE,CLK,W_0_5_2);
Weight_0_5_3_BRAM     BRAM_5_3(W_Add,DI,Weight_En,WE,CLK,W_0_5_3);
Weight_0_5_4_BRAM     BRAM_5_4(W_Add,DI,Weight_En,WE,CLK,W_0_5_4);
Weight_0_5_5_BRAM     BRAM_5_5(W_Add,DI,Weight_En,WE,CLK,W_0_5_5);
Weight_0_5_6_BRAM     BRAM_5_6(W_Add,DI,Weight_En,WE,CLK,W_0_5_6);
Weight_0_5_7_BRAM     BRAM_5_7(W_Add,DI,Weight_En,WE,CLK,W_0_5_7);
Weight_0_5_8_BRAM     BRAM_5_8(W_Add,DI,Weight_En,WE,CLK,W_0_5_8);
Weight_0_5_9_BRAM     BRAM_5_9(W_Add,DI,Weight_En,WE,CLK,W_0_5_9);
Weight_0_5_10_BRAM     BRAM_5_10(W_Add,DI,Weight_En,WE,CLK,W_0_5_10);
Weight_0_5_11_BRAM     BRAM_5_11(W_Add,DI,Weight_En,WE,CLK,W_0_5_11);
Weight_0_5_12_BRAM     BRAM_5_12(W_Add,DI,Weight_En,WE,CLK,W_0_5_12);
Weight_0_5_13_BRAM     BRAM_5_13(W_Add,DI,Weight_En,WE,CLK,W_0_5_13);
Weight_0_5_14_BRAM     BRAM_5_14(W_Add,DI,Weight_En,WE,CLK,W_0_5_14);
Weight_0_5_15_BRAM     BRAM_5_15(W_Add,DI,Weight_En,WE,CLK,W_0_5_15);
Weight_0_5_16_BRAM     BRAM_5_16(W_Add,DI,Weight_En,WE,CLK,W_0_5_16);
Weight_0_5_17_BRAM     BRAM_5_17(W_Add,DI,Weight_En,WE,CLK,W_0_5_17);
Weight_0_5_18_BRAM     BRAM_5_18(W_Add,DI,Weight_En,WE,CLK,W_0_5_18);
Weight_0_5_19_BRAM     BRAM_5_19(W_Add,DI,Weight_En,WE,CLK,W_0_5_19);
Weight_0_5_20_BRAM     BRAM_5_20(W_Add,DI,Weight_En,WE,CLK,W_0_5_20);
Weight_0_5_21_BRAM     BRAM_5_21(W_Add,DI,Weight_En,WE,CLK,W_0_5_21);
Weight_0_5_22_BRAM     BRAM_5_22(W_Add,DI,Weight_En,WE,CLK,W_0_5_22);
Weight_0_5_23_BRAM     BRAM_5_23(W_Add,DI,Weight_En,WE,CLK,W_0_5_23);
Weight_0_5_24_BRAM     BRAM_5_24(W_Add,DI,Weight_En,WE,CLK,W_0_5_24);
Weight_0_5_25_BRAM     BRAM_5_25(W_Add,DI,Weight_En,WE,CLK,W_0_5_25);
Weight_0_5_26_BRAM     BRAM_5_26(W_Add,DI,Weight_En,WE,CLK,W_0_5_26);
Weight_0_5_27_BRAM     BRAM_5_27(W_Add,DI,Weight_En,WE,CLK,W_0_5_27);

//BRAM 7th Neuron
Weight_0_6_0_BRAM     BRAM_6_0(W_Add,DI,Weight_En,WE,CLK,W_0_6_0);
Weight_0_6_1_BRAM     BRAM_6_1(W_Add,DI,Weight_En,WE,CLK,W_0_6_1);
Weight_0_6_2_BRAM     BRAM_6_2(W_Add,DI,Weight_En,WE,CLK,W_0_6_2);
Weight_0_6_3_BRAM     BRAM_6_3(W_Add,DI,Weight_En,WE,CLK,W_0_6_3);
Weight_0_6_4_BRAM     BRAM_6_4(W_Add,DI,Weight_En,WE,CLK,W_0_6_4);
Weight_0_6_5_BRAM     BRAM_6_5(W_Add,DI,Weight_En,WE,CLK,W_0_6_5);
Weight_0_6_6_BRAM     BRAM_6_6(W_Add,DI,Weight_En,WE,CLK,W_0_6_6);
Weight_0_6_7_BRAM     BRAM_6_7(W_Add,DI,Weight_En,WE,CLK,W_0_6_7);
Weight_0_6_8_BRAM     BRAM_6_8(W_Add,DI,Weight_En,WE,CLK,W_0_6_8);
Weight_0_6_9_BRAM     BRAM_6_9(W_Add,DI,Weight_En,WE,CLK,W_0_6_9);
Weight_0_6_10_BRAM     BRAM_6_10(W_Add,DI,Weight_En,WE,CLK,W_0_6_10);
Weight_0_6_11_BRAM     BRAM_6_11(W_Add,DI,Weight_En,WE,CLK,W_0_6_11);
Weight_0_6_12_BRAM     BRAM_6_12(W_Add,DI,Weight_En,WE,CLK,W_0_6_12);
Weight_0_6_13_BRAM     BRAM_6_13(W_Add,DI,Weight_En,WE,CLK,W_0_6_13);
Weight_0_6_14_BRAM     BRAM_6_14(W_Add,DI,Weight_En,WE,CLK,W_0_6_14);
Weight_0_6_15_BRAM     BRAM_6_15(W_Add,DI,Weight_En,WE,CLK,W_0_6_15);
Weight_0_6_16_BRAM     BRAM_6_16(W_Add,DI,Weight_En,WE,CLK,W_0_6_16);
Weight_0_6_17_BRAM     BRAM_6_17(W_Add,DI,Weight_En,WE,CLK,W_0_6_17);
Weight_0_6_18_BRAM     BRAM_6_18(W_Add,DI,Weight_En,WE,CLK,W_0_6_18);
Weight_0_6_19_BRAM     BRAM_6_19(W_Add,DI,Weight_En,WE,CLK,W_0_6_19);
Weight_0_6_20_BRAM     BRAM_6_20(W_Add,DI,Weight_En,WE,CLK,W_0_6_20);
Weight_0_6_21_BRAM     BRAM_6_21(W_Add,DI,Weight_En,WE,CLK,W_0_6_21);
Weight_0_6_22_BRAM     BRAM_6_22(W_Add,DI,Weight_En,WE,CLK,W_0_6_22);
Weight_0_6_23_BRAM     BRAM_6_23(W_Add,DI,Weight_En,WE,CLK,W_0_6_23);
Weight_0_6_24_BRAM     BRAM_6_24(W_Add,DI,Weight_En,WE,CLK,W_0_6_24);
Weight_0_6_25_BRAM     BRAM_6_25(W_Add,DI,Weight_En,WE,CLK,W_0_6_25);
Weight_0_6_26_BRAM     BRAM_6_26(W_Add,DI,Weight_En,WE,CLK,W_0_6_26);
Weight_0_6_27_BRAM     BRAM_6_27(W_Add,DI,Weight_En,WE,CLK,W_0_6_27);

//BRAM 8th Neuron
Weight_0_7_0_BRAM     BRAM_7_0(W_Add,DI,Weight_En,WE,CLK,W_0_7_0);
Weight_0_7_1_BRAM     BRAM_7_1(W_Add,DI,Weight_En,WE,CLK,W_0_7_1);
Weight_0_7_2_BRAM     BRAM_7_2(W_Add,DI,Weight_En,WE,CLK,W_0_7_2);
Weight_0_7_3_BRAM     BRAM_7_3(W_Add,DI,Weight_En,WE,CLK,W_0_7_3);
Weight_0_7_4_BRAM     BRAM_7_4(W_Add,DI,Weight_En,WE,CLK,W_0_7_4);
Weight_0_7_5_BRAM     BRAM_7_5(W_Add,DI,Weight_En,WE,CLK,W_0_7_5);
Weight_0_7_6_BRAM     BRAM_7_6(W_Add,DI,Weight_En,WE,CLK,W_0_7_6);
Weight_0_7_7_BRAM     BRAM_7_7(W_Add,DI,Weight_En,WE,CLK,W_0_7_7);
Weight_0_7_8_BRAM     BRAM_7_8(W_Add,DI,Weight_En,WE,CLK,W_0_7_8);
Weight_0_7_9_BRAM     BRAM_7_9(W_Add,DI,Weight_En,WE,CLK,W_0_7_9);
Weight_0_7_10_BRAM     BRAM_7_10(W_Add,DI,Weight_En,WE,CLK,W_0_7_10);
Weight_0_7_11_BRAM     BRAM_7_11(W_Add,DI,Weight_En,WE,CLK,W_0_7_11);
Weight_0_7_12_BRAM     BRAM_7_12(W_Add,DI,Weight_En,WE,CLK,W_0_7_12);
Weight_0_7_13_BRAM     BRAM_7_13(W_Add,DI,Weight_En,WE,CLK,W_0_7_13);
Weight_0_7_14_BRAM     BRAM_7_14(W_Add,DI,Weight_En,WE,CLK,W_0_7_14);
Weight_0_7_15_BRAM     BRAM_7_15(W_Add,DI,Weight_En,WE,CLK,W_0_7_15);
Weight_0_7_16_BRAM     BRAM_7_16(W_Add,DI,Weight_En,WE,CLK,W_0_7_16);
Weight_0_7_17_BRAM     BRAM_7_17(W_Add,DI,Weight_En,WE,CLK,W_0_7_17);
Weight_0_7_18_BRAM     BRAM_7_18(W_Add,DI,Weight_En,WE,CLK,W_0_7_18);
Weight_0_7_19_BRAM     BRAM_7_19(W_Add,DI,Weight_En,WE,CLK,W_0_7_19);
Weight_0_7_20_BRAM     BRAM_7_20(W_Add,DI,Weight_En,WE,CLK,W_0_7_20);
Weight_0_7_21_BRAM     BRAM_7_21(W_Add,DI,Weight_En,WE,CLK,W_0_7_21);
Weight_0_7_22_BRAM     BRAM_7_22(W_Add,DI,Weight_En,WE,CLK,W_0_7_22);
Weight_0_7_23_BRAM     BRAM_7_23(W_Add,DI,Weight_En,WE,CLK,W_0_7_23);
Weight_0_7_24_BRAM     BRAM_7_24(W_Add,DI,Weight_En,WE,CLK,W_0_7_24);
Weight_0_7_25_BRAM     BRAM_7_25(W_Add,DI,Weight_En,WE,CLK,W_0_7_25);
Weight_0_7_26_BRAM     BRAM_7_26(W_Add,DI,Weight_En,WE,CLK,W_0_7_26);
Weight_0_7_27_BRAM     BRAM_7_27(W_Add,DI,Weight_En,WE,CLK,W_0_7_27);

//BRAM 9th Neuron
Weight_0_8_0_BRAM     BRAM_8_0(W_Add,DI,Weight_En,WE,CLK,W_0_8_0);
Weight_0_8_1_BRAM     BRAM_8_1(W_Add,DI,Weight_En,WE,CLK,W_0_8_1);
Weight_0_8_2_BRAM     BRAM_8_2(W_Add,DI,Weight_En,WE,CLK,W_0_8_2);
Weight_0_8_3_BRAM     BRAM_8_3(W_Add,DI,Weight_En,WE,CLK,W_0_8_3);
Weight_0_8_4_BRAM     BRAM_8_4(W_Add,DI,Weight_En,WE,CLK,W_0_8_4);
Weight_0_8_5_BRAM     BRAM_8_5(W_Add,DI,Weight_En,WE,CLK,W_0_8_5);
Weight_0_8_6_BRAM     BRAM_8_6(W_Add,DI,Weight_En,WE,CLK,W_0_8_6);
Weight_0_8_7_BRAM     BRAM_8_7(W_Add,DI,Weight_En,WE,CLK,W_0_8_7);
Weight_0_8_8_BRAM     BRAM_8_8(W_Add,DI,Weight_En,WE,CLK,W_0_8_8);
Weight_0_8_9_BRAM     BRAM_8_9(W_Add,DI,Weight_En,WE,CLK,W_0_8_9);
Weight_0_8_10_BRAM     BRAM_8_10(W_Add,DI,Weight_En,WE,CLK,W_0_8_10);
Weight_0_8_11_BRAM     BRAM_8_11(W_Add,DI,Weight_En,WE,CLK,W_0_8_11);
Weight_0_8_12_BRAM     BRAM_8_12(W_Add,DI,Weight_En,WE,CLK,W_0_8_12);
Weight_0_8_13_BRAM     BRAM_8_13(W_Add,DI,Weight_En,WE,CLK,W_0_8_13);
Weight_0_8_14_BRAM     BRAM_8_14(W_Add,DI,Weight_En,WE,CLK,W_0_8_14);
Weight_0_8_15_BRAM     BRAM_8_15(W_Add,DI,Weight_En,WE,CLK,W_0_8_15);
Weight_0_8_16_BRAM     BRAM_8_16(W_Add,DI,Weight_En,WE,CLK,W_0_8_16);
Weight_0_8_17_BRAM     BRAM_8_17(W_Add,DI,Weight_En,WE,CLK,W_0_8_17);
Weight_0_8_18_BRAM     BRAM_8_18(W_Add,DI,Weight_En,WE,CLK,W_0_8_18);
Weight_0_8_19_BRAM     BRAM_8_19(W_Add,DI,Weight_En,WE,CLK,W_0_8_19);
Weight_0_8_20_BRAM     BRAM_8_20(W_Add,DI,Weight_En,WE,CLK,W_0_8_20);
Weight_0_8_21_BRAM     BRAM_8_21(W_Add,DI,Weight_En,WE,CLK,W_0_8_21);
Weight_0_8_22_BRAM     BRAM_8_22(W_Add,DI,Weight_En,WE,CLK,W_0_8_22);
Weight_0_8_23_BRAM     BRAM_8_23(W_Add,DI,Weight_En,WE,CLK,W_0_8_23);
Weight_0_8_24_BRAM     BRAM_8_24(W_Add,DI,Weight_En,WE,CLK,W_0_8_24);
Weight_0_8_25_BRAM     BRAM_8_25(W_Add,DI,Weight_En,WE,CLK,W_0_8_25);
Weight_0_8_26_BRAM     BRAM_8_26(W_Add,DI,Weight_En,WE,CLK,W_0_8_26);
Weight_0_8_27_BRAM     BRAM_8_27(W_Add,DI,Weight_En,WE,CLK,W_0_8_27);

//BRAM 10th Neuron
Weight_0_9_0_BRAM     BRAM_9_0(W_Add,DI,Weight_En,WE,CLK,W_0_9_0);
Weight_0_9_1_BRAM     BRAM_9_1(W_Add,DI,Weight_En,WE,CLK,W_0_9_1);
Weight_0_9_2_BRAM     BRAM_9_2(W_Add,DI,Weight_En,WE,CLK,W_0_9_2);
Weight_0_9_3_BRAM     BRAM_9_3(W_Add,DI,Weight_En,WE,CLK,W_0_9_3);
Weight_0_9_4_BRAM     BRAM_9_4(W_Add,DI,Weight_En,WE,CLK,W_0_9_4);
Weight_0_9_5_BRAM     BRAM_9_5(W_Add,DI,Weight_En,WE,CLK,W_0_9_5);
Weight_0_9_6_BRAM     BRAM_9_6(W_Add,DI,Weight_En,WE,CLK,W_0_9_6);
Weight_0_9_7_BRAM     BRAM_9_7(W_Add,DI,Weight_En,WE,CLK,W_0_9_7);
Weight_0_9_8_BRAM     BRAM_9_8(W_Add,DI,Weight_En,WE,CLK,W_0_9_8);
Weight_0_9_9_BRAM     BRAM_9_9(W_Add,DI,Weight_En,WE,CLK,W_0_9_9);
Weight_0_9_10_BRAM     BRAM_9_10(W_Add,DI,Weight_En,WE,CLK,W_0_9_10);
Weight_0_9_11_BRAM     BRAM_9_11(W_Add,DI,Weight_En,WE,CLK,W_0_9_11);
Weight_0_9_12_BRAM     BRAM_9_12(W_Add,DI,Weight_En,WE,CLK,W_0_9_12);
Weight_0_9_13_BRAM     BRAM_9_13(W_Add,DI,Weight_En,WE,CLK,W_0_9_13);
Weight_0_9_14_BRAM     BRAM_9_14(W_Add,DI,Weight_En,WE,CLK,W_0_9_14);
Weight_0_9_15_BRAM     BRAM_9_15(W_Add,DI,Weight_En,WE,CLK,W_0_9_15);
Weight_0_9_16_BRAM     BRAM_9_16(W_Add,DI,Weight_En,WE,CLK,W_0_9_16);
Weight_0_9_17_BRAM     BRAM_9_17(W_Add,DI,Weight_En,WE,CLK,W_0_9_17);
Weight_0_9_18_BRAM     BRAM_9_18(W_Add,DI,Weight_En,WE,CLK,W_0_9_18);
Weight_0_9_19_BRAM     BRAM_9_19(W_Add,DI,Weight_En,WE,CLK,W_0_9_19);
Weight_0_9_20_BRAM     BRAM_9_20(W_Add,DI,Weight_En,WE,CLK,W_0_9_20);
Weight_0_9_21_BRAM     BRAM_9_21(W_Add,DI,Weight_En,WE,CLK,W_0_9_21);
Weight_0_9_22_BRAM     BRAM_9_22(W_Add,DI,Weight_En,WE,CLK,W_0_9_22);
Weight_0_9_23_BRAM     BRAM_9_23(W_Add,DI,Weight_En,WE,CLK,W_0_9_23);
Weight_0_9_24_BRAM     BRAM_9_24(W_Add,DI,Weight_En,WE,CLK,W_0_9_24);
Weight_0_9_25_BRAM     BRAM_9_25(W_Add,DI,Weight_En,WE,CLK,W_0_9_25);
Weight_0_9_26_BRAM     BRAM_9_26(W_Add,DI,Weight_En,WE,CLK,W_0_9_26);
Weight_0_9_27_BRAM     BRAM_9_27(W_Add,DI,Weight_En,WE,CLK,W_0_9_27);


//BRAM 11th Neuron
Weight_0_10_0_BRAM     BRAM_10_0(W_Add,DI,Weight_En,WE,CLK,W_0_10_0);
Weight_0_10_1_BRAM     BRAM_10_1(W_Add,DI,Weight_En,WE,CLK,W_0_10_1);
Weight_0_10_2_BRAM     BRAM_10_2(W_Add,DI,Weight_En,WE,CLK,W_0_10_2);
Weight_0_10_3_BRAM     BRAM_10_3(W_Add,DI,Weight_En,WE,CLK,W_0_10_3);
Weight_0_10_4_BRAM     BRAM_10_4(W_Add,DI,Weight_En,WE,CLK,W_0_10_4);
Weight_0_10_5_BRAM     BRAM_10_5(W_Add,DI,Weight_En,WE,CLK,W_0_10_5);
Weight_0_10_6_BRAM     BRAM_10_6(W_Add,DI,Weight_En,WE,CLK,W_0_10_6);
Weight_0_10_7_BRAM     BRAM_10_7(W_Add,DI,Weight_En,WE,CLK,W_0_10_7);
Weight_0_10_8_BRAM     BRAM_10_8(W_Add,DI,Weight_En,WE,CLK,W_0_10_8);
Weight_0_10_9_BRAM     BRAM_10_9(W_Add,DI,Weight_En,WE,CLK,W_0_10_9);
Weight_0_10_10_BRAM     BRAM_10_10(W_Add,DI,Weight_En,WE,CLK,W_0_10_10);
Weight_0_10_11_BRAM     BRAM_10_11(W_Add,DI,Weight_En,WE,CLK,W_0_10_11);
Weight_0_10_12_BRAM     BRAM_10_12(W_Add,DI,Weight_En,WE,CLK,W_0_10_12);
Weight_0_10_13_BRAM     BRAM_10_13(W_Add,DI,Weight_En,WE,CLK,W_0_10_13);
Weight_0_10_14_BRAM     BRAM_10_14(W_Add,DI,Weight_En,WE,CLK,W_0_10_14);
Weight_0_10_15_BRAM     BRAM_10_15(W_Add,DI,Weight_En,WE,CLK,W_0_10_15);
Weight_0_10_16_BRAM     BRAM_10_16(W_Add,DI,Weight_En,WE,CLK,W_0_10_16);
Weight_0_10_17_BRAM     BRAM_10_17(W_Add,DI,Weight_En,WE,CLK,W_0_10_17);
Weight_0_10_18_BRAM     BRAM_10_18(W_Add,DI,Weight_En,WE,CLK,W_0_10_18);
Weight_0_10_19_BRAM     BRAM_10_19(W_Add,DI,Weight_En,WE,CLK,W_0_10_19);
Weight_0_10_20_BRAM     BRAM_10_20(W_Add,DI,Weight_En,WE,CLK,W_0_10_20);
Weight_0_10_21_BRAM     BRAM_10_21(W_Add,DI,Weight_En,WE,CLK,W_0_10_21);
Weight_0_10_22_BRAM     BRAM_10_22(W_Add,DI,Weight_En,WE,CLK,W_0_10_22);
Weight_0_10_23_BRAM     BRAM_10_23(W_Add,DI,Weight_En,WE,CLK,W_0_10_23);
Weight_0_10_24_BRAM     BRAM_10_24(W_Add,DI,Weight_En,WE,CLK,W_0_10_24);
Weight_0_10_25_BRAM     BRAM_10_25(W_Add,DI,Weight_En,WE,CLK,W_0_10_25);
Weight_0_10_26_BRAM     BRAM_10_26(W_Add,DI,Weight_En,WE,CLK,W_0_10_26);
Weight_0_10_27_BRAM     BRAM_10_27(W_Add,DI,Weight_En,WE,CLK,W_0_10_27);

//BRAM 12th Neuron
Weight_0_11_0_BRAM     BRAM_11_0(W_Add,DI,Weight_En,WE,CLK,W_0_11_0);
Weight_0_11_1_BRAM     BRAM_11_1(W_Add,DI,Weight_En,WE,CLK,W_0_11_1);
Weight_0_11_2_BRAM     BRAM_11_2(W_Add,DI,Weight_En,WE,CLK,W_0_11_2);
Weight_0_11_3_BRAM     BRAM_11_3(W_Add,DI,Weight_En,WE,CLK,W_0_11_3);
Weight_0_11_4_BRAM     BRAM_11_4(W_Add,DI,Weight_En,WE,CLK,W_0_11_4);
Weight_0_11_5_BRAM     BRAM_11_5(W_Add,DI,Weight_En,WE,CLK,W_0_11_5);
Weight_0_11_6_BRAM     BRAM_11_6(W_Add,DI,Weight_En,WE,CLK,W_0_11_6);
Weight_0_11_7_BRAM     BRAM_11_7(W_Add,DI,Weight_En,WE,CLK,W_0_11_7);
Weight_0_11_8_BRAM     BRAM_11_8(W_Add,DI,Weight_En,WE,CLK,W_0_11_8);
Weight_0_11_9_BRAM     BRAM_11_9(W_Add,DI,Weight_En,WE,CLK,W_0_11_9);
Weight_0_11_10_BRAM     BRAM_11_10(W_Add,DI,Weight_En,WE,CLK,W_0_11_10);
Weight_0_11_11_BRAM     BRAM_11_11(W_Add,DI,Weight_En,WE,CLK,W_0_11_11);
Weight_0_11_12_BRAM     BRAM_11_12(W_Add,DI,Weight_En,WE,CLK,W_0_11_12);
Weight_0_11_13_BRAM     BRAM_11_13(W_Add,DI,Weight_En,WE,CLK,W_0_11_13);
Weight_0_11_14_BRAM     BRAM_11_14(W_Add,DI,Weight_En,WE,CLK,W_0_11_14);
Weight_0_11_15_BRAM     BRAM_11_15(W_Add,DI,Weight_En,WE,CLK,W_0_11_15);
Weight_0_11_16_BRAM     BRAM_11_16(W_Add,DI,Weight_En,WE,CLK,W_0_11_16);
Weight_0_11_17_BRAM     BRAM_11_17(W_Add,DI,Weight_En,WE,CLK,W_0_11_17);
Weight_0_11_18_BRAM     BRAM_11_18(W_Add,DI,Weight_En,WE,CLK,W_0_11_18);
Weight_0_11_19_BRAM     BRAM_11_19(W_Add,DI,Weight_En,WE,CLK,W_0_11_19);
Weight_0_11_20_BRAM     BRAM_11_20(W_Add,DI,Weight_En,WE,CLK,W_0_11_20);
Weight_0_11_21_BRAM     BRAM_11_21(W_Add,DI,Weight_En,WE,CLK,W_0_11_21);
Weight_0_11_22_BRAM     BRAM_11_22(W_Add,DI,Weight_En,WE,CLK,W_0_11_22);
Weight_0_11_23_BRAM     BRAM_11_23(W_Add,DI,Weight_En,WE,CLK,W_0_11_23);
Weight_0_11_24_BRAM     BRAM_11_24(W_Add,DI,Weight_En,WE,CLK,W_0_11_24);
Weight_0_11_25_BRAM     BRAM_11_25(W_Add,DI,Weight_En,WE,CLK,W_0_11_25);
Weight_0_11_26_BRAM     BRAM_11_26(W_Add,DI,Weight_En,WE,CLK,W_0_11_26);
Weight_0_11_27_BRAM     BRAM_11_27(W_Add,DI,Weight_En,WE,CLK,W_0_11_27);

//BRAM 13th Neuron
Weight_0_12_0_BRAM     BRAM_12_0(W_Add,DI,Weight_En,WE,CLK,W_0_12_0);
Weight_0_12_1_BRAM     BRAM_12_1(W_Add,DI,Weight_En,WE,CLK,W_0_12_1);
Weight_0_12_2_BRAM     BRAM_12_2(W_Add,DI,Weight_En,WE,CLK,W_0_12_2);
Weight_0_12_3_BRAM     BRAM_12_3(W_Add,DI,Weight_En,WE,CLK,W_0_12_3);
Weight_0_12_4_BRAM     BRAM_12_4(W_Add,DI,Weight_En,WE,CLK,W_0_12_4);
Weight_0_12_5_BRAM     BRAM_12_5(W_Add,DI,Weight_En,WE,CLK,W_0_12_5);
Weight_0_12_6_BRAM     BRAM_12_6(W_Add,DI,Weight_En,WE,CLK,W_0_12_6);
Weight_0_12_7_BRAM     BRAM_12_7(W_Add,DI,Weight_En,WE,CLK,W_0_12_7);
Weight_0_12_8_BRAM     BRAM_12_8(W_Add,DI,Weight_En,WE,CLK,W_0_12_8);
Weight_0_12_9_BRAM     BRAM_12_9(W_Add,DI,Weight_En,WE,CLK,W_0_12_9);
Weight_0_12_10_BRAM     BRAM_12_10(W_Add,DI,Weight_En,WE,CLK,W_0_12_10);
Weight_0_12_11_BRAM     BRAM_12_11(W_Add,DI,Weight_En,WE,CLK,W_0_12_11);
Weight_0_12_12_BRAM     BRAM_12_12(W_Add,DI,Weight_En,WE,CLK,W_0_12_12);
Weight_0_12_13_BRAM     BRAM_12_13(W_Add,DI,Weight_En,WE,CLK,W_0_12_13);
Weight_0_12_14_BRAM     BRAM_12_14(W_Add,DI,Weight_En,WE,CLK,W_0_12_14);
Weight_0_12_15_BRAM     BRAM_12_15(W_Add,DI,Weight_En,WE,CLK,W_0_12_15);
Weight_0_12_16_BRAM     BRAM_12_16(W_Add,DI,Weight_En,WE,CLK,W_0_12_16);
Weight_0_12_17_BRAM     BRAM_12_17(W_Add,DI,Weight_En,WE,CLK,W_0_12_17);
Weight_0_12_18_BRAM     BRAM_12_18(W_Add,DI,Weight_En,WE,CLK,W_0_12_18);
Weight_0_12_19_BRAM     BRAM_12_19(W_Add,DI,Weight_En,WE,CLK,W_0_12_19);
Weight_0_12_20_BRAM     BRAM_12_20(W_Add,DI,Weight_En,WE,CLK,W_0_12_20);
Weight_0_12_21_BRAM     BRAM_12_21(W_Add,DI,Weight_En,WE,CLK,W_0_12_21);
Weight_0_12_22_BRAM     BRAM_12_22(W_Add,DI,Weight_En,WE,CLK,W_0_12_22);
Weight_0_12_23_BRAM     BRAM_12_23(W_Add,DI,Weight_En,WE,CLK,W_0_12_23);
Weight_0_12_24_BRAM     BRAM_12_24(W_Add,DI,Weight_En,WE,CLK,W_0_12_24);
Weight_0_12_25_BRAM     BRAM_12_25(W_Add,DI,Weight_En,WE,CLK,W_0_12_25);
Weight_0_12_26_BRAM     BRAM_12_26(W_Add,DI,Weight_En,WE,CLK,W_0_12_26);
Weight_0_12_27_BRAM     BRAM_12_27(W_Add,DI,Weight_En,WE,CLK,W_0_12_27);

//BRAM 14th Neuron
Weight_0_13_0_BRAM     BRAM_13_0(W_Add,DI,Weight_En,WE,CLK,W_0_13_0);
Weight_0_13_1_BRAM     BRAM_13_1(W_Add,DI,Weight_En,WE,CLK,W_0_13_1);
Weight_0_13_2_BRAM     BRAM_13_2(W_Add,DI,Weight_En,WE,CLK,W_0_13_2);
Weight_0_13_3_BRAM     BRAM_13_3(W_Add,DI,Weight_En,WE,CLK,W_0_13_3);
Weight_0_13_4_BRAM     BRAM_13_4(W_Add,DI,Weight_En,WE,CLK,W_0_13_4);
Weight_0_13_5_BRAM     BRAM_13_5(W_Add,DI,Weight_En,WE,CLK,W_0_13_5);
Weight_0_13_6_BRAM     BRAM_13_6(W_Add,DI,Weight_En,WE,CLK,W_0_13_6);
Weight_0_13_7_BRAM     BRAM_13_7(W_Add,DI,Weight_En,WE,CLK,W_0_13_7);
Weight_0_13_8_BRAM     BRAM_13_8(W_Add,DI,Weight_En,WE,CLK,W_0_13_8);
Weight_0_13_9_BRAM     BRAM_13_9(W_Add,DI,Weight_En,WE,CLK,W_0_13_9);
Weight_0_13_10_BRAM     BRAM_13_10(W_Add,DI,Weight_En,WE,CLK,W_0_13_10);
Weight_0_13_11_BRAM     BRAM_13_11(W_Add,DI,Weight_En,WE,CLK,W_0_13_11);
Weight_0_13_12_BRAM     BRAM_13_12(W_Add,DI,Weight_En,WE,CLK,W_0_13_12);
Weight_0_13_13_BRAM     BRAM_13_13(W_Add,DI,Weight_En,WE,CLK,W_0_13_13);
Weight_0_13_14_BRAM     BRAM_13_14(W_Add,DI,Weight_En,WE,CLK,W_0_13_14);
Weight_0_13_15_BRAM     BRAM_13_15(W_Add,DI,Weight_En,WE,CLK,W_0_13_15);
Weight_0_13_16_BRAM     BRAM_13_16(W_Add,DI,Weight_En,WE,CLK,W_0_13_16);
Weight_0_13_17_BRAM     BRAM_13_17(W_Add,DI,Weight_En,WE,CLK,W_0_13_17);
Weight_0_13_18_BRAM     BRAM_13_18(W_Add,DI,Weight_En,WE,CLK,W_0_13_18);
Weight_0_13_19_BRAM     BRAM_13_19(W_Add,DI,Weight_En,WE,CLK,W_0_13_19);
Weight_0_13_20_BRAM     BRAM_13_20(W_Add,DI,Weight_En,WE,CLK,W_0_13_20);
Weight_0_13_21_BRAM     BRAM_13_21(W_Add,DI,Weight_En,WE,CLK,W_0_13_21);
Weight_0_13_22_BRAM     BRAM_13_22(W_Add,DI,Weight_En,WE,CLK,W_0_13_22);
Weight_0_13_23_BRAM     BRAM_13_23(W_Add,DI,Weight_En,WE,CLK,W_0_13_23);
Weight_0_13_24_BRAM     BRAM_13_24(W_Add,DI,Weight_En,WE,CLK,W_0_13_24);
Weight_0_13_25_BRAM     BRAM_13_25(W_Add,DI,Weight_En,WE,CLK,W_0_13_25);
Weight_0_13_26_BRAM     BRAM_13_26(W_Add,DI,Weight_En,WE,CLK,W_0_13_26);
Weight_0_13_27_BRAM     BRAM_13_27(W_Add,DI,Weight_En,WE,CLK,W_0_13_27);

//BRAM 15th Neuron
Weight_0_14_0_BRAM     BRAM_14_0(W_Add,DI,Weight_En,WE,CLK,W_0_14_0);
Weight_0_14_1_BRAM     BRAM_14_1(W_Add,DI,Weight_En,WE,CLK,W_0_14_1);
Weight_0_14_2_BRAM     BRAM_14_2(W_Add,DI,Weight_En,WE,CLK,W_0_14_2);
Weight_0_14_3_BRAM     BRAM_14_3(W_Add,DI,Weight_En,WE,CLK,W_0_14_3);
Weight_0_14_4_BRAM     BRAM_14_4(W_Add,DI,Weight_En,WE,CLK,W_0_14_4);
Weight_0_14_5_BRAM     BRAM_14_5(W_Add,DI,Weight_En,WE,CLK,W_0_14_5);
Weight_0_14_6_BRAM     BRAM_14_6(W_Add,DI,Weight_En,WE,CLK,W_0_14_6);
Weight_0_14_7_BRAM     BRAM_14_7(W_Add,DI,Weight_En,WE,CLK,W_0_14_7);
Weight_0_14_8_BRAM     BRAM_14_8(W_Add,DI,Weight_En,WE,CLK,W_0_14_8);
Weight_0_14_9_BRAM     BRAM_14_9(W_Add,DI,Weight_En,WE,CLK,W_0_14_9);
Weight_0_14_10_BRAM     BRAM_14_10(W_Add,DI,Weight_En,WE,CLK,W_0_14_10);
Weight_0_14_11_BRAM     BRAM_14_11(W_Add,DI,Weight_En,WE,CLK,W_0_14_11);
Weight_0_14_12_BRAM     BRAM_14_12(W_Add,DI,Weight_En,WE,CLK,W_0_14_12);
Weight_0_14_13_BRAM     BRAM_14_13(W_Add,DI,Weight_En,WE,CLK,W_0_14_13);
Weight_0_14_14_BRAM     BRAM_14_14(W_Add,DI,Weight_En,WE,CLK,W_0_14_14);
Weight_0_14_15_BRAM     BRAM_14_15(W_Add,DI,Weight_En,WE,CLK,W_0_14_15);
Weight_0_14_16_BRAM     BRAM_14_16(W_Add,DI,Weight_En,WE,CLK,W_0_14_16);
Weight_0_14_17_BRAM     BRAM_14_17(W_Add,DI,Weight_En,WE,CLK,W_0_14_17);
Weight_0_14_18_BRAM     BRAM_14_18(W_Add,DI,Weight_En,WE,CLK,W_0_14_18);
Weight_0_14_19_BRAM     BRAM_14_19(W_Add,DI,Weight_En,WE,CLK,W_0_14_19);
Weight_0_14_20_BRAM     BRAM_14_20(W_Add,DI,Weight_En,WE,CLK,W_0_14_20);
Weight_0_14_21_BRAM     BRAM_14_21(W_Add,DI,Weight_En,WE,CLK,W_0_14_21);
Weight_0_14_22_BRAM     BRAM_14_22(W_Add,DI,Weight_En,WE,CLK,W_0_14_22);
Weight_0_14_23_BRAM     BRAM_14_23(W_Add,DI,Weight_En,WE,CLK,W_0_14_23);
Weight_0_14_24_BRAM     BRAM_14_24(W_Add,DI,Weight_En,WE,CLK,W_0_14_24);
Weight_0_14_25_BRAM     BRAM_14_25(W_Add,DI,Weight_En,WE,CLK,W_0_14_25);
Weight_0_14_26_BRAM     BRAM_14_26(W_Add,DI,Weight_En,WE,CLK,W_0_14_26);
Weight_0_14_27_BRAM     BRAM_14_27(W_Add,DI,Weight_En,WE,CLK,W_0_14_27);



//BRAM 16th Neuron
Weight_0_15_0_BRAM     BRAM_15_0(W_Add,DI,Weight_En,WE,CLK,W_0_15_0);
Weight_0_15_1_BRAM     BRAM_15_1(W_Add,DI,Weight_En,WE,CLK,W_0_15_1);
Weight_0_15_2_BRAM     BRAM_15_2(W_Add,DI,Weight_En,WE,CLK,W_0_15_2);
Weight_0_15_3_BRAM     BRAM_15_3(W_Add,DI,Weight_En,WE,CLK,W_0_15_3);
Weight_0_15_4_BRAM     BRAM_15_4(W_Add,DI,Weight_En,WE,CLK,W_0_15_4);
Weight_0_15_5_BRAM     BRAM_15_5(W_Add,DI,Weight_En,WE,CLK,W_0_15_5);
Weight_0_15_6_BRAM     BRAM_15_6(W_Add,DI,Weight_En,WE,CLK,W_0_15_6);
Weight_0_15_7_BRAM     BRAM_15_7(W_Add,DI,Weight_En,WE,CLK,W_0_15_7);
Weight_0_15_8_BRAM     BRAM_15_8(W_Add,DI,Weight_En,WE,CLK,W_0_15_8);
Weight_0_15_9_BRAM     BRAM_15_9(W_Add,DI,Weight_En,WE,CLK,W_0_15_9);
Weight_0_15_10_BRAM     BRAM_15_10(W_Add,DI,Weight_En,WE,CLK,W_0_15_10);
Weight_0_15_11_BRAM     BRAM_15_11(W_Add,DI,Weight_En,WE,CLK,W_0_15_11);
Weight_0_15_12_BRAM     BRAM_15_12(W_Add,DI,Weight_En,WE,CLK,W_0_15_12);
Weight_0_15_13_BRAM     BRAM_15_13(W_Add,DI,Weight_En,WE,CLK,W_0_15_13);
Weight_0_15_14_BRAM     BRAM_15_14(W_Add,DI,Weight_En,WE,CLK,W_0_15_14);
Weight_0_15_15_BRAM     BRAM_15_15(W_Add,DI,Weight_En,WE,CLK,W_0_15_15);
Weight_0_15_16_BRAM     BRAM_15_16(W_Add,DI,Weight_En,WE,CLK,W_0_15_16);
Weight_0_15_17_BRAM     BRAM_15_17(W_Add,DI,Weight_En,WE,CLK,W_0_15_17);
Weight_0_15_18_BRAM     BRAM_15_18(W_Add,DI,Weight_En,WE,CLK,W_0_15_18);
Weight_0_15_19_BRAM     BRAM_15_19(W_Add,DI,Weight_En,WE,CLK,W_0_15_19);
Weight_0_15_20_BRAM     BRAM_15_20(W_Add,DI,Weight_En,WE,CLK,W_0_15_20);
Weight_0_15_21_BRAM     BRAM_15_21(W_Add,DI,Weight_En,WE,CLK,W_0_15_21);
Weight_0_15_22_BRAM     BRAM_15_22(W_Add,DI,Weight_En,WE,CLK,W_0_15_22);
Weight_0_15_23_BRAM     BRAM_15_23(W_Add,DI,Weight_En,WE,CLK,W_0_15_23);
Weight_0_15_24_BRAM     BRAM_15_24(W_Add,DI,Weight_En,WE,CLK,W_0_15_24);
Weight_0_15_25_BRAM     BRAM_15_25(W_Add,DI,Weight_En,WE,CLK,W_0_15_25);
Weight_0_15_26_BRAM     BRAM_15_26(W_Add,DI,Weight_En,WE,CLK,W_0_15_26);
Weight_0_15_27_BRAM     BRAM_15_27(W_Add,DI,Weight_En,WE,CLK,W_0_15_27);

//BRAM 17th Neuron
Weight_0_16_0_BRAM     BRAM_16_0(W_Add,DI,Weight_En,WE,CLK,W_0_16_0);
Weight_0_16_1_BRAM     BRAM_16_1(W_Add,DI,Weight_En,WE,CLK,W_0_16_1);
Weight_0_16_2_BRAM     BRAM_16_2(W_Add,DI,Weight_En,WE,CLK,W_0_16_2);
Weight_0_16_3_BRAM     BRAM_16_3(W_Add,DI,Weight_En,WE,CLK,W_0_16_3);
Weight_0_16_4_BRAM     BRAM_16_4(W_Add,DI,Weight_En,WE,CLK,W_0_16_4);
Weight_0_16_5_BRAM     BRAM_16_5(W_Add,DI,Weight_En,WE,CLK,W_0_16_5);
Weight_0_16_6_BRAM     BRAM_16_6(W_Add,DI,Weight_En,WE,CLK,W_0_16_6);
Weight_0_16_7_BRAM     BRAM_16_7(W_Add,DI,Weight_En,WE,CLK,W_0_16_7);
Weight_0_16_8_BRAM     BRAM_16_8(W_Add,DI,Weight_En,WE,CLK,W_0_16_8);
Weight_0_16_9_BRAM     BRAM_16_9(W_Add,DI,Weight_En,WE,CLK,W_0_16_9);
Weight_0_16_10_BRAM     BRAM_16_10(W_Add,DI,Weight_En,WE,CLK,W_0_16_10);
Weight_0_16_11_BRAM     BRAM_16_11(W_Add,DI,Weight_En,WE,CLK,W_0_16_11);
Weight_0_16_12_BRAM     BRAM_16_12(W_Add,DI,Weight_En,WE,CLK,W_0_16_12);
Weight_0_16_13_BRAM     BRAM_16_13(W_Add,DI,Weight_En,WE,CLK,W_0_16_13);
Weight_0_16_14_BRAM     BRAM_16_14(W_Add,DI,Weight_En,WE,CLK,W_0_16_14);
Weight_0_16_15_BRAM     BRAM_16_15(W_Add,DI,Weight_En,WE,CLK,W_0_16_15);
Weight_0_16_16_BRAM     BRAM_16_16(W_Add,DI,Weight_En,WE,CLK,W_0_16_16);
Weight_0_16_17_BRAM     BRAM_16_17(W_Add,DI,Weight_En,WE,CLK,W_0_16_17);
Weight_0_16_18_BRAM     BRAM_16_18(W_Add,DI,Weight_En,WE,CLK,W_0_16_18);
Weight_0_16_19_BRAM     BRAM_16_19(W_Add,DI,Weight_En,WE,CLK,W_0_16_19);
Weight_0_16_20_BRAM     BRAM_16_20(W_Add,DI,Weight_En,WE,CLK,W_0_16_20);
Weight_0_16_21_BRAM     BRAM_16_21(W_Add,DI,Weight_En,WE,CLK,W_0_16_21);
Weight_0_16_22_BRAM     BRAM_16_22(W_Add,DI,Weight_En,WE,CLK,W_0_16_22);
Weight_0_16_23_BRAM     BRAM_16_23(W_Add,DI,Weight_En,WE,CLK,W_0_16_23);
Weight_0_16_24_BRAM     BRAM_16_24(W_Add,DI,Weight_En,WE,CLK,W_0_16_24);
Weight_0_16_25_BRAM     BRAM_16_25(W_Add,DI,Weight_En,WE,CLK,W_0_16_25);
Weight_0_16_26_BRAM     BRAM_16_26(W_Add,DI,Weight_En,WE,CLK,W_0_16_26);
Weight_0_16_27_BRAM     BRAM_16_27(W_Add,DI,Weight_En,WE,CLK,W_0_16_27);

//BRAM 18th Neuron
Weight_0_17_0_BRAM     BRAM_17_0(W_Add,DI,Weight_En,WE,CLK,W_0_17_0);
Weight_0_17_1_BRAM     BRAM_17_1(W_Add,DI,Weight_En,WE,CLK,W_0_17_1);
Weight_0_17_2_BRAM     BRAM_17_2(W_Add,DI,Weight_En,WE,CLK,W_0_17_2);
Weight_0_17_3_BRAM     BRAM_17_3(W_Add,DI,Weight_En,WE,CLK,W_0_17_3);
Weight_0_17_4_BRAM     BRAM_17_4(W_Add,DI,Weight_En,WE,CLK,W_0_17_4);
Weight_0_17_5_BRAM     BRAM_17_5(W_Add,DI,Weight_En,WE,CLK,W_0_17_5);
Weight_0_17_6_BRAM     BRAM_17_6(W_Add,DI,Weight_En,WE,CLK,W_0_17_6);
Weight_0_17_7_BRAM     BRAM_17_7(W_Add,DI,Weight_En,WE,CLK,W_0_17_7);
Weight_0_17_8_BRAM     BRAM_17_8(W_Add,DI,Weight_En,WE,CLK,W_0_17_8);
Weight_0_17_9_BRAM     BRAM_17_9(W_Add,DI,Weight_En,WE,CLK,W_0_17_9);
Weight_0_17_10_BRAM     BRAM_17_10(W_Add,DI,Weight_En,WE,CLK,W_0_17_10);
Weight_0_17_11_BRAM     BRAM_17_11(W_Add,DI,Weight_En,WE,CLK,W_0_17_11);
Weight_0_17_12_BRAM     BRAM_17_12(W_Add,DI,Weight_En,WE,CLK,W_0_17_12);
Weight_0_17_13_BRAM     BRAM_17_13(W_Add,DI,Weight_En,WE,CLK,W_0_17_13);
Weight_0_17_14_BRAM     BRAM_17_14(W_Add,DI,Weight_En,WE,CLK,W_0_17_14);
Weight_0_17_15_BRAM     BRAM_17_15(W_Add,DI,Weight_En,WE,CLK,W_0_17_15);
Weight_0_17_16_BRAM     BRAM_17_16(W_Add,DI,Weight_En,WE,CLK,W_0_17_16);
Weight_0_17_17_BRAM     BRAM_17_17(W_Add,DI,Weight_En,WE,CLK,W_0_17_17);
Weight_0_17_18_BRAM     BRAM_17_18(W_Add,DI,Weight_En,WE,CLK,W_0_17_18);
Weight_0_17_19_BRAM     BRAM_17_19(W_Add,DI,Weight_En,WE,CLK,W_0_17_19);
Weight_0_17_20_BRAM     BRAM_17_20(W_Add,DI,Weight_En,WE,CLK,W_0_17_20);
Weight_0_17_21_BRAM     BRAM_17_21(W_Add,DI,Weight_En,WE,CLK,W_0_17_21);
Weight_0_17_22_BRAM     BRAM_17_22(W_Add,DI,Weight_En,WE,CLK,W_0_17_22);
Weight_0_17_23_BRAM     BRAM_17_23(W_Add,DI,Weight_En,WE,CLK,W_0_17_23);
Weight_0_17_24_BRAM     BRAM_17_24(W_Add,DI,Weight_En,WE,CLK,W_0_17_24);
Weight_0_17_25_BRAM     BRAM_17_25(W_Add,DI,Weight_En,WE,CLK,W_0_17_25);
Weight_0_17_26_BRAM     BRAM_17_26(W_Add,DI,Weight_En,WE,CLK,W_0_17_26);
Weight_0_17_27_BRAM     BRAM_17_27(W_Add,DI,Weight_En,WE,CLK,W_0_17_27);

//BRAM 19th Neuron
Weight_0_18_0_BRAM     BRAM_18_0(W_Add,DI,Weight_En,WE,CLK,W_0_18_0);
Weight_0_18_1_BRAM     BRAM_18_1(W_Add,DI,Weight_En,WE,CLK,W_0_18_1);
Weight_0_18_2_BRAM     BRAM_18_2(W_Add,DI,Weight_En,WE,CLK,W_0_18_2);
Weight_0_18_3_BRAM     BRAM_18_3(W_Add,DI,Weight_En,WE,CLK,W_0_18_3);
Weight_0_18_4_BRAM     BRAM_18_4(W_Add,DI,Weight_En,WE,CLK,W_0_18_4);
Weight_0_18_5_BRAM     BRAM_18_5(W_Add,DI,Weight_En,WE,CLK,W_0_18_5);
Weight_0_18_6_BRAM     BRAM_18_6(W_Add,DI,Weight_En,WE,CLK,W_0_18_6);
Weight_0_18_7_BRAM     BRAM_18_7(W_Add,DI,Weight_En,WE,CLK,W_0_18_7);
Weight_0_18_8_BRAM     BRAM_18_8(W_Add,DI,Weight_En,WE,CLK,W_0_18_8);
Weight_0_18_9_BRAM     BRAM_18_9(W_Add,DI,Weight_En,WE,CLK,W_0_18_9);
Weight_0_18_10_BRAM     BRAM_18_10(W_Add,DI,Weight_En,WE,CLK,W_0_18_10);
Weight_0_18_11_BRAM     BRAM_18_11(W_Add,DI,Weight_En,WE,CLK,W_0_18_11);
Weight_0_18_12_BRAM     BRAM_18_12(W_Add,DI,Weight_En,WE,CLK,W_0_18_12);
Weight_0_18_13_BRAM     BRAM_18_13(W_Add,DI,Weight_En,WE,CLK,W_0_18_13);
Weight_0_18_14_BRAM     BRAM_18_14(W_Add,DI,Weight_En,WE,CLK,W_0_18_14);
Weight_0_18_15_BRAM     BRAM_18_15(W_Add,DI,Weight_En,WE,CLK,W_0_18_15);
Weight_0_18_16_BRAM     BRAM_18_16(W_Add,DI,Weight_En,WE,CLK,W_0_18_16);
Weight_0_18_17_BRAM     BRAM_18_17(W_Add,DI,Weight_En,WE,CLK,W_0_18_17);
Weight_0_18_18_BRAM     BRAM_18_18(W_Add,DI,Weight_En,WE,CLK,W_0_18_18);
Weight_0_18_19_BRAM     BRAM_18_19(W_Add,DI,Weight_En,WE,CLK,W_0_18_19);
Weight_0_18_20_BRAM     BRAM_18_20(W_Add,DI,Weight_En,WE,CLK,W_0_18_20);
Weight_0_18_21_BRAM     BRAM_18_21(W_Add,DI,Weight_En,WE,CLK,W_0_18_21);
Weight_0_18_22_BRAM     BRAM_18_22(W_Add,DI,Weight_En,WE,CLK,W_0_18_22);
Weight_0_18_23_BRAM     BRAM_18_23(W_Add,DI,Weight_En,WE,CLK,W_0_18_23);
Weight_0_18_24_BRAM     BRAM_18_24(W_Add,DI,Weight_En,WE,CLK,W_0_18_24);
Weight_0_18_25_BRAM     BRAM_18_25(W_Add,DI,Weight_En,WE,CLK,W_0_18_25);
Weight_0_18_26_BRAM     BRAM_18_26(W_Add,DI,Weight_En,WE,CLK,W_0_18_26);
Weight_0_18_27_BRAM     BRAM_18_27(W_Add,DI,Weight_En,WE,CLK,W_0_18_27);

//BRAM 20th Neuron
Weight_0_19_0_BRAM     BRAM_19_0(W_Add,DI,Weight_En,WE,CLK,W_0_19_0);
Weight_0_19_1_BRAM     BRAM_19_1(W_Add,DI,Weight_En,WE,CLK,W_0_19_1);
Weight_0_19_2_BRAM     BRAM_19_2(W_Add,DI,Weight_En,WE,CLK,W_0_19_2);
Weight_0_19_3_BRAM     BRAM_19_3(W_Add,DI,Weight_En,WE,CLK,W_0_19_3);
Weight_0_19_4_BRAM     BRAM_19_4(W_Add,DI,Weight_En,WE,CLK,W_0_19_4);
Weight_0_19_5_BRAM     BRAM_19_5(W_Add,DI,Weight_En,WE,CLK,W_0_19_5);
Weight_0_19_6_BRAM     BRAM_19_6(W_Add,DI,Weight_En,WE,CLK,W_0_19_6);
Weight_0_19_7_BRAM     BRAM_19_7(W_Add,DI,Weight_En,WE,CLK,W_0_19_7);
Weight_0_19_8_BRAM     BRAM_19_8(W_Add,DI,Weight_En,WE,CLK,W_0_19_8);
Weight_0_19_9_BRAM     BRAM_19_9(W_Add,DI,Weight_En,WE,CLK,W_0_19_9);
Weight_0_19_10_BRAM     BRAM_19_10(W_Add,DI,Weight_En,WE,CLK,W_0_19_10);
Weight_0_19_11_BRAM     BRAM_19_11(W_Add,DI,Weight_En,WE,CLK,W_0_19_11);
Weight_0_19_12_BRAM     BRAM_19_12(W_Add,DI,Weight_En,WE,CLK,W_0_19_12);
Weight_0_19_13_BRAM     BRAM_19_13(W_Add,DI,Weight_En,WE,CLK,W_0_19_13);
Weight_0_19_14_BRAM     BRAM_19_14(W_Add,DI,Weight_En,WE,CLK,W_0_19_14);
Weight_0_19_15_BRAM     BRAM_19_15(W_Add,DI,Weight_En,WE,CLK,W_0_19_15);
Weight_0_19_16_BRAM     BRAM_19_16(W_Add,DI,Weight_En,WE,CLK,W_0_19_16);
Weight_0_19_17_BRAM     BRAM_19_17(W_Add,DI,Weight_En,WE,CLK,W_0_19_17);
Weight_0_19_18_BRAM     BRAM_19_18(W_Add,DI,Weight_En,WE,CLK,W_0_19_18);
Weight_0_19_19_BRAM     BRAM_19_19(W_Add,DI,Weight_En,WE,CLK,W_0_19_19);
Weight_0_19_20_BRAM     BRAM_19_20(W_Add,DI,Weight_En,WE,CLK,W_0_19_20);
Weight_0_19_21_BRAM     BRAM_19_21(W_Add,DI,Weight_En,WE,CLK,W_0_19_21);
Weight_0_19_22_BRAM     BRAM_19_22(W_Add,DI,Weight_En,WE,CLK,W_0_19_22);
Weight_0_19_23_BRAM     BRAM_19_23(W_Add,DI,Weight_En,WE,CLK,W_0_19_23);
Weight_0_19_24_BRAM     BRAM_19_24(W_Add,DI,Weight_En,WE,CLK,W_0_19_24);
Weight_0_19_25_BRAM     BRAM_19_25(W_Add,DI,Weight_En,WE,CLK,W_0_19_25);
Weight_0_19_26_BRAM     BRAM_19_26(W_Add,DI,Weight_En,WE,CLK,W_0_19_26);
Weight_0_19_27_BRAM     BRAM_19_27(W_Add,DI,Weight_En,WE,CLK,W_0_19_27);

//BRAM 21st Neuron
Weight_0_20_0_BRAM     BRAM_20_0(W_Add,DI,Weight_En,WE,CLK,W_0_20_0);
Weight_0_20_1_BRAM     BRAM_20_1(W_Add,DI,Weight_En,WE,CLK,W_0_20_1);
Weight_0_20_2_BRAM     BRAM_20_2(W_Add,DI,Weight_En,WE,CLK,W_0_20_2);
Weight_0_20_3_BRAM     BRAM_20_3(W_Add,DI,Weight_En,WE,CLK,W_0_20_3);
Weight_0_20_4_BRAM     BRAM_20_4(W_Add,DI,Weight_En,WE,CLK,W_0_20_4);
Weight_0_20_5_BRAM     BRAM_20_5(W_Add,DI,Weight_En,WE,CLK,W_0_20_5);
Weight_0_20_6_BRAM     BRAM_20_6(W_Add,DI,Weight_En,WE,CLK,W_0_20_6);
Weight_0_20_7_BRAM     BRAM_20_7(W_Add,DI,Weight_En,WE,CLK,W_0_20_7);
Weight_0_20_8_BRAM     BRAM_20_8(W_Add,DI,Weight_En,WE,CLK,W_0_20_8);
Weight_0_20_9_BRAM     BRAM_20_9(W_Add,DI,Weight_En,WE,CLK,W_0_20_9);
Weight_0_20_10_BRAM     BRAM_20_10(W_Add,DI,Weight_En,WE,CLK,W_0_20_10);
Weight_0_20_11_BRAM     BRAM_20_11(W_Add,DI,Weight_En,WE,CLK,W_0_20_11);
Weight_0_20_12_BRAM     BRAM_20_12(W_Add,DI,Weight_En,WE,CLK,W_0_20_12);
Weight_0_20_13_BRAM     BRAM_20_13(W_Add,DI,Weight_En,WE,CLK,W_0_20_13);
Weight_0_20_14_BRAM     BRAM_20_14(W_Add,DI,Weight_En,WE,CLK,W_0_20_14);
Weight_0_20_15_BRAM     BRAM_20_15(W_Add,DI,Weight_En,WE,CLK,W_0_20_15);
Weight_0_20_16_BRAM     BRAM_20_16(W_Add,DI,Weight_En,WE,CLK,W_0_20_16);
Weight_0_20_17_BRAM     BRAM_20_17(W_Add,DI,Weight_En,WE,CLK,W_0_20_17);
Weight_0_20_18_BRAM     BRAM_20_18(W_Add,DI,Weight_En,WE,CLK,W_0_20_18);
Weight_0_20_19_BRAM     BRAM_20_19(W_Add,DI,Weight_En,WE,CLK,W_0_20_19);
Weight_0_20_20_BRAM     BRAM_20_20(W_Add,DI,Weight_En,WE,CLK,W_0_20_20);
Weight_0_20_21_BRAM     BRAM_20_21(W_Add,DI,Weight_En,WE,CLK,W_0_20_21);
Weight_0_20_22_BRAM     BRAM_20_22(W_Add,DI,Weight_En,WE,CLK,W_0_20_22);
Weight_0_20_23_BRAM     BRAM_20_23(W_Add,DI,Weight_En,WE,CLK,W_0_20_23);
Weight_0_20_24_BRAM     BRAM_20_24(W_Add,DI,Weight_En,WE,CLK,W_0_20_24);
Weight_0_20_25_BRAM     BRAM_20_25(W_Add,DI,Weight_En,WE,CLK,W_0_20_25);
Weight_0_20_26_BRAM     BRAM_20_26(W_Add,DI,Weight_En,WE,CLK,W_0_20_26);
Weight_0_20_27_BRAM     BRAM_20_27(W_Add,DI,Weight_En,WE,CLK,W_0_20_27);

//BRAM 22nd Neuron
Weight_0_21_0_BRAM     BRAM_21_0(W_Add,DI,Weight_En,WE,CLK,W_0_21_0);
Weight_0_21_1_BRAM     BRAM_21_1(W_Add,DI,Weight_En,WE,CLK,W_0_21_1);
Weight_0_21_2_BRAM     BRAM_21_2(W_Add,DI,Weight_En,WE,CLK,W_0_21_2);
Weight_0_21_3_BRAM     BRAM_21_3(W_Add,DI,Weight_En,WE,CLK,W_0_21_3);
Weight_0_21_4_BRAM     BRAM_21_4(W_Add,DI,Weight_En,WE,CLK,W_0_21_4);
Weight_0_21_5_BRAM     BRAM_21_5(W_Add,DI,Weight_En,WE,CLK,W_0_21_5);
Weight_0_21_6_BRAM     BRAM_21_6(W_Add,DI,Weight_En,WE,CLK,W_0_21_6);
Weight_0_21_7_BRAM     BRAM_21_7(W_Add,DI,Weight_En,WE,CLK,W_0_21_7);
Weight_0_21_8_BRAM     BRAM_21_8(W_Add,DI,Weight_En,WE,CLK,W_0_21_8);
Weight_0_21_9_BRAM     BRAM_21_9(W_Add,DI,Weight_En,WE,CLK,W_0_21_9);
Weight_0_21_10_BRAM     BRAM_21_10(W_Add,DI,Weight_En,WE,CLK,W_0_21_10);
Weight_0_21_11_BRAM     BRAM_21_11(W_Add,DI,Weight_En,WE,CLK,W_0_21_11);
Weight_0_21_12_BRAM     BRAM_21_12(W_Add,DI,Weight_En,WE,CLK,W_0_21_12);
Weight_0_21_13_BRAM     BRAM_21_13(W_Add,DI,Weight_En,WE,CLK,W_0_21_13);
Weight_0_21_14_BRAM     BRAM_21_14(W_Add,DI,Weight_En,WE,CLK,W_0_21_14);
Weight_0_21_15_BRAM     BRAM_21_15(W_Add,DI,Weight_En,WE,CLK,W_0_21_15);
Weight_0_21_16_BRAM     BRAM_21_16(W_Add,DI,Weight_En,WE,CLK,W_0_21_16);
Weight_0_21_17_BRAM     BRAM_21_17(W_Add,DI,Weight_En,WE,CLK,W_0_21_17);
Weight_0_21_18_BRAM     BRAM_21_18(W_Add,DI,Weight_En,WE,CLK,W_0_21_18);
Weight_0_21_19_BRAM     BRAM_21_19(W_Add,DI,Weight_En,WE,CLK,W_0_21_19);
Weight_0_21_20_BRAM     BRAM_21_20(W_Add,DI,Weight_En,WE,CLK,W_0_21_20);
Weight_0_21_21_BRAM     BRAM_21_21(W_Add,DI,Weight_En,WE,CLK,W_0_21_21);
Weight_0_21_22_BRAM     BRAM_21_22(W_Add,DI,Weight_En,WE,CLK,W_0_21_22);
Weight_0_21_23_BRAM     BRAM_21_23(W_Add,DI,Weight_En,WE,CLK,W_0_21_23);
Weight_0_21_24_BRAM     BRAM_21_24(W_Add,DI,Weight_En,WE,CLK,W_0_21_24);
Weight_0_21_25_BRAM     BRAM_21_25(W_Add,DI,Weight_En,WE,CLK,W_0_21_25);
Weight_0_21_26_BRAM     BRAM_21_26(W_Add,DI,Weight_En,WE,CLK,W_0_21_26);
Weight_0_21_27_BRAM     BRAM_21_27(W_Add,DI,Weight_En,WE,CLK,W_0_21_27);

//BRAM 23rd Neuron
Weight_0_22_0_BRAM     BRAM_22_0(W_Add,DI,Weight_En,WE,CLK,W_0_22_0);
Weight_0_22_1_BRAM     BRAM_22_1(W_Add,DI,Weight_En,WE,CLK,W_0_22_1);
Weight_0_22_2_BRAM     BRAM_22_2(W_Add,DI,Weight_En,WE,CLK,W_0_22_2);
Weight_0_22_3_BRAM     BRAM_22_3(W_Add,DI,Weight_En,WE,CLK,W_0_22_3);
Weight_0_22_4_BRAM     BRAM_22_4(W_Add,DI,Weight_En,WE,CLK,W_0_22_4);
Weight_0_22_5_BRAM     BRAM_22_5(W_Add,DI,Weight_En,WE,CLK,W_0_22_5);
Weight_0_22_6_BRAM     BRAM_22_6(W_Add,DI,Weight_En,WE,CLK,W_0_22_6);
Weight_0_22_7_BRAM     BRAM_22_7(W_Add,DI,Weight_En,WE,CLK,W_0_22_7);
Weight_0_22_8_BRAM     BRAM_22_8(W_Add,DI,Weight_En,WE,CLK,W_0_22_8);
Weight_0_22_9_BRAM     BRAM_22_9(W_Add,DI,Weight_En,WE,CLK,W_0_22_9);
Weight_0_22_10_BRAM     BRAM_22_10(W_Add,DI,Weight_En,WE,CLK,W_0_22_10);
Weight_0_22_11_BRAM     BRAM_22_11(W_Add,DI,Weight_En,WE,CLK,W_0_22_11);
Weight_0_22_12_BRAM     BRAM_22_12(W_Add,DI,Weight_En,WE,CLK,W_0_22_12);
Weight_0_22_13_BRAM     BRAM_22_13(W_Add,DI,Weight_En,WE,CLK,W_0_22_13);
Weight_0_22_14_BRAM     BRAM_22_14(W_Add,DI,Weight_En,WE,CLK,W_0_22_14);
Weight_0_22_15_BRAM     BRAM_22_15(W_Add,DI,Weight_En,WE,CLK,W_0_22_15);
Weight_0_22_16_BRAM     BRAM_22_16(W_Add,DI,Weight_En,WE,CLK,W_0_22_16);
Weight_0_22_17_BRAM     BRAM_22_17(W_Add,DI,Weight_En,WE,CLK,W_0_22_17);
Weight_0_22_18_BRAM     BRAM_22_18(W_Add,DI,Weight_En,WE,CLK,W_0_22_18);
Weight_0_22_19_BRAM     BRAM_22_19(W_Add,DI,Weight_En,WE,CLK,W_0_22_19);
Weight_0_22_20_BRAM     BRAM_22_20(W_Add,DI,Weight_En,WE,CLK,W_0_22_20);
Weight_0_22_21_BRAM     BRAM_22_21(W_Add,DI,Weight_En,WE,CLK,W_0_22_21);
Weight_0_22_22_BRAM     BRAM_22_22(W_Add,DI,Weight_En,WE,CLK,W_0_22_22);
Weight_0_22_23_BRAM     BRAM_22_23(W_Add,DI,Weight_En,WE,CLK,W_0_22_23);
Weight_0_22_24_BRAM     BRAM_22_24(W_Add,DI,Weight_En,WE,CLK,W_0_22_24);
Weight_0_22_25_BRAM     BRAM_22_25(W_Add,DI,Weight_En,WE,CLK,W_0_22_25);
Weight_0_22_26_BRAM     BRAM_22_26(W_Add,DI,Weight_En,WE,CLK,W_0_22_26);
Weight_0_22_27_BRAM     BRAM_22_27(W_Add,DI,Weight_En,WE,CLK,W_0_22_27);

//BRAM 24th Neuron
Weight_0_23_0_BRAM     BRAM_23_0(W_Add,DI,Weight_En,WE,CLK,W_0_23_0);
Weight_0_23_1_BRAM     BRAM_23_1(W_Add,DI,Weight_En,WE,CLK,W_0_23_1);
Weight_0_23_2_BRAM     BRAM_23_2(W_Add,DI,Weight_En,WE,CLK,W_0_23_2);
Weight_0_23_3_BRAM     BRAM_23_3(W_Add,DI,Weight_En,WE,CLK,W_0_23_3);
Weight_0_23_4_BRAM     BRAM_23_4(W_Add,DI,Weight_En,WE,CLK,W_0_23_4);
Weight_0_23_5_BRAM     BRAM_23_5(W_Add,DI,Weight_En,WE,CLK,W_0_23_5);
Weight_0_23_6_BRAM     BRAM_23_6(W_Add,DI,Weight_En,WE,CLK,W_0_23_6);
Weight_0_23_7_BRAM     BRAM_23_7(W_Add,DI,Weight_En,WE,CLK,W_0_23_7);
Weight_0_23_8_BRAM     BRAM_23_8(W_Add,DI,Weight_En,WE,CLK,W_0_23_8);
Weight_0_23_9_BRAM     BRAM_23_9(W_Add,DI,Weight_En,WE,CLK,W_0_23_9);
Weight_0_23_10_BRAM     BRAM_23_10(W_Add,DI,Weight_En,WE,CLK,W_0_23_10);
Weight_0_23_11_BRAM     BRAM_23_11(W_Add,DI,Weight_En,WE,CLK,W_0_23_11);
Weight_0_23_12_BRAM     BRAM_23_12(W_Add,DI,Weight_En,WE,CLK,W_0_23_12);
Weight_0_23_13_BRAM     BRAM_23_13(W_Add,DI,Weight_En,WE,CLK,W_0_23_13);
Weight_0_23_14_BRAM     BRAM_23_14(W_Add,DI,Weight_En,WE,CLK,W_0_23_14);
Weight_0_23_15_BRAM     BRAM_23_15(W_Add,DI,Weight_En,WE,CLK,W_0_23_15);
Weight_0_23_16_BRAM     BRAM_23_16(W_Add,DI,Weight_En,WE,CLK,W_0_23_16);
Weight_0_23_17_BRAM     BRAM_23_17(W_Add,DI,Weight_En,WE,CLK,W_0_23_17);
Weight_0_23_18_BRAM     BRAM_23_18(W_Add,DI,Weight_En,WE,CLK,W_0_23_18);
Weight_0_23_19_BRAM     BRAM_23_19(W_Add,DI,Weight_En,WE,CLK,W_0_23_19);
Weight_0_23_20_BRAM     BRAM_23_20(W_Add,DI,Weight_En,WE,CLK,W_0_23_20);
Weight_0_23_21_BRAM     BRAM_23_21(W_Add,DI,Weight_En,WE,CLK,W_0_23_21);
Weight_0_23_22_BRAM     BRAM_23_22(W_Add,DI,Weight_En,WE,CLK,W_0_23_22);
Weight_0_23_23_BRAM     BRAM_23_23(W_Add,DI,Weight_En,WE,CLK,W_0_23_23);
Weight_0_23_24_BRAM     BRAM_23_24(W_Add,DI,Weight_En,WE,CLK,W_0_23_24);
Weight_0_23_25_BRAM     BRAM_23_25(W_Add,DI,Weight_En,WE,CLK,W_0_23_25);
Weight_0_23_26_BRAM     BRAM_23_26(W_Add,DI,Weight_En,WE,CLK,W_0_23_26);
Weight_0_23_27_BRAM     BRAM_23_27(W_Add,DI,Weight_En,WE,CLK,W_0_23_27);

//BRAM 25th Neuron
Weight_0_24_0_BRAM     BRAM_24_0(W_Add,DI,Weight_En,WE,CLK,W_0_24_0);
Weight_0_24_1_BRAM     BRAM_24_1(W_Add,DI,Weight_En,WE,CLK,W_0_24_1);
Weight_0_24_2_BRAM     BRAM_24_2(W_Add,DI,Weight_En,WE,CLK,W_0_24_2);
Weight_0_24_3_BRAM     BRAM_24_3(W_Add,DI,Weight_En,WE,CLK,W_0_24_3);
Weight_0_24_4_BRAM     BRAM_24_4(W_Add,DI,Weight_En,WE,CLK,W_0_24_4);
Weight_0_24_5_BRAM     BRAM_24_5(W_Add,DI,Weight_En,WE,CLK,W_0_24_5);
Weight_0_24_6_BRAM     BRAM_24_6(W_Add,DI,Weight_En,WE,CLK,W_0_24_6);
Weight_0_24_7_BRAM     BRAM_24_7(W_Add,DI,Weight_En,WE,CLK,W_0_24_7);
Weight_0_24_8_BRAM     BRAM_24_8(W_Add,DI,Weight_En,WE,CLK,W_0_24_8);
Weight_0_24_9_BRAM     BRAM_24_9(W_Add,DI,Weight_En,WE,CLK,W_0_24_9);
Weight_0_24_10_BRAM     BRAM_24_10(W_Add,DI,Weight_En,WE,CLK,W_0_24_10);
Weight_0_24_11_BRAM     BRAM_24_11(W_Add,DI,Weight_En,WE,CLK,W_0_24_11);
Weight_0_24_12_BRAM     BRAM_24_12(W_Add,DI,Weight_En,WE,CLK,W_0_24_12);
Weight_0_24_13_BRAM     BRAM_24_13(W_Add,DI,Weight_En,WE,CLK,W_0_24_13);
Weight_0_24_14_BRAM     BRAM_24_14(W_Add,DI,Weight_En,WE,CLK,W_0_24_14);
Weight_0_24_15_BRAM     BRAM_24_15(W_Add,DI,Weight_En,WE,CLK,W_0_24_15);
Weight_0_24_16_BRAM     BRAM_24_16(W_Add,DI,Weight_En,WE,CLK,W_0_24_16);
Weight_0_24_17_BRAM     BRAM_24_17(W_Add,DI,Weight_En,WE,CLK,W_0_24_17);
Weight_0_24_18_BRAM     BRAM_24_18(W_Add,DI,Weight_En,WE,CLK,W_0_24_18);
Weight_0_24_19_BRAM     BRAM_24_19(W_Add,DI,Weight_En,WE,CLK,W_0_24_19);
Weight_0_24_20_BRAM     BRAM_24_20(W_Add,DI,Weight_En,WE,CLK,W_0_24_20);
Weight_0_24_21_BRAM     BRAM_24_21(W_Add,DI,Weight_En,WE,CLK,W_0_24_21);
Weight_0_24_22_BRAM     BRAM_24_22(W_Add,DI,Weight_En,WE,CLK,W_0_24_22);
Weight_0_24_23_BRAM     BRAM_24_23(W_Add,DI,Weight_En,WE,CLK,W_0_24_23);
Weight_0_24_24_BRAM     BRAM_24_24(W_Add,DI,Weight_En,WE,CLK,W_0_24_24);
Weight_0_24_25_BRAM     BRAM_24_25(W_Add,DI,Weight_En,WE,CLK,W_0_24_25);
Weight_0_24_26_BRAM     BRAM_24_26(W_Add,DI,Weight_En,WE,CLK,W_0_24_26);
Weight_0_24_27_BRAM     BRAM_24_27(W_Add,DI,Weight_En,WE,CLK,W_0_24_27);



//BRAM 26th Neuron
Weight_0_25_0_BRAM     BRAM_25_0(W_Add,DI,Weight_En,WE,CLK,W_0_25_0);
Weight_0_25_1_BRAM     BRAM_25_1(W_Add,DI,Weight_En,WE,CLK,W_0_25_1);
Weight_0_25_2_BRAM     BRAM_25_2(W_Add,DI,Weight_En,WE,CLK,W_0_25_2);
Weight_0_25_3_BRAM     BRAM_25_3(W_Add,DI,Weight_En,WE,CLK,W_0_25_3);
Weight_0_25_4_BRAM     BRAM_25_4(W_Add,DI,Weight_En,WE,CLK,W_0_25_4);
Weight_0_25_5_BRAM     BRAM_25_5(W_Add,DI,Weight_En,WE,CLK,W_0_25_5);
Weight_0_25_6_BRAM     BRAM_25_6(W_Add,DI,Weight_En,WE,CLK,W_0_25_6);
Weight_0_25_7_BRAM     BRAM_25_7(W_Add,DI,Weight_En,WE,CLK,W_0_25_7);
Weight_0_25_8_BRAM     BRAM_25_8(W_Add,DI,Weight_En,WE,CLK,W_0_25_8);
Weight_0_25_9_BRAM     BRAM_25_9(W_Add,DI,Weight_En,WE,CLK,W_0_25_9);
Weight_0_25_10_BRAM     BRAM_25_10(W_Add,DI,Weight_En,WE,CLK,W_0_25_10);
Weight_0_25_11_BRAM     BRAM_25_11(W_Add,DI,Weight_En,WE,CLK,W_0_25_11);
Weight_0_25_12_BRAM     BRAM_25_12(W_Add,DI,Weight_En,WE,CLK,W_0_25_12);
Weight_0_25_13_BRAM     BRAM_25_13(W_Add,DI,Weight_En,WE,CLK,W_0_25_13);
Weight_0_25_14_BRAM     BRAM_25_14(W_Add,DI,Weight_En,WE,CLK,W_0_25_14);
Weight_0_25_15_BRAM     BRAM_25_15(W_Add,DI,Weight_En,WE,CLK,W_0_25_15);
Weight_0_25_16_BRAM     BRAM_25_16(W_Add,DI,Weight_En,WE,CLK,W_0_25_16);
Weight_0_25_17_BRAM     BRAM_25_17(W_Add,DI,Weight_En,WE,CLK,W_0_25_17);
Weight_0_25_18_BRAM     BRAM_25_18(W_Add,DI,Weight_En,WE,CLK,W_0_25_18);
Weight_0_25_19_BRAM     BRAM_25_19(W_Add,DI,Weight_En,WE,CLK,W_0_25_19);
Weight_0_25_20_BRAM     BRAM_25_20(W_Add,DI,Weight_En,WE,CLK,W_0_25_20);
Weight_0_25_21_BRAM     BRAM_25_21(W_Add,DI,Weight_En,WE,CLK,W_0_25_21);
Weight_0_25_22_BRAM     BRAM_25_22(W_Add,DI,Weight_En,WE,CLK,W_0_25_22);
Weight_0_25_23_BRAM     BRAM_25_23(W_Add,DI,Weight_En,WE,CLK,W_0_25_23);
Weight_0_25_24_BRAM     BRAM_25_24(W_Add,DI,Weight_En,WE,CLK,W_0_25_24);
Weight_0_25_25_BRAM     BRAM_25_25(W_Add,DI,Weight_En,WE,CLK,W_0_25_25);
Weight_0_25_26_BRAM     BRAM_25_26(W_Add,DI,Weight_En,WE,CLK,W_0_25_26);
Weight_0_25_27_BRAM     BRAM_25_27(W_Add,DI,Weight_En,WE,CLK,W_0_25_27);

//BRAM 27th Neuron
Weight_0_26_0_BRAM     BRAM_26_0(W_Add,DI,Weight_En,WE,CLK,W_0_26_0);
Weight_0_26_1_BRAM     BRAM_26_1(W_Add,DI,Weight_En,WE,CLK,W_0_26_1);
Weight_0_26_2_BRAM     BRAM_26_2(W_Add,DI,Weight_En,WE,CLK,W_0_26_2);
Weight_0_26_3_BRAM     BRAM_26_3(W_Add,DI,Weight_En,WE,CLK,W_0_26_3);
Weight_0_26_4_BRAM     BRAM_26_4(W_Add,DI,Weight_En,WE,CLK,W_0_26_4);
Weight_0_26_5_BRAM     BRAM_26_5(W_Add,DI,Weight_En,WE,CLK,W_0_26_5);
Weight_0_26_6_BRAM     BRAM_26_6(W_Add,DI,Weight_En,WE,CLK,W_0_26_6);
Weight_0_26_7_BRAM     BRAM_26_7(W_Add,DI,Weight_En,WE,CLK,W_0_26_7);
Weight_0_26_8_BRAM     BRAM_26_8(W_Add,DI,Weight_En,WE,CLK,W_0_26_8);
Weight_0_26_9_BRAM     BRAM_26_9(W_Add,DI,Weight_En,WE,CLK,W_0_26_9);
Weight_0_26_10_BRAM     BRAM_26_10(W_Add,DI,Weight_En,WE,CLK,W_0_26_10);
Weight_0_26_11_BRAM     BRAM_26_11(W_Add,DI,Weight_En,WE,CLK,W_0_26_11);
Weight_0_26_12_BRAM     BRAM_26_12(W_Add,DI,Weight_En,WE,CLK,W_0_26_12);
Weight_0_26_13_BRAM     BRAM_26_13(W_Add,DI,Weight_En,WE,CLK,W_0_26_13);
Weight_0_26_14_BRAM     BRAM_26_14(W_Add,DI,Weight_En,WE,CLK,W_0_26_14);
Weight_0_26_15_BRAM     BRAM_26_15(W_Add,DI,Weight_En,WE,CLK,W_0_26_15);
Weight_0_26_16_BRAM     BRAM_26_16(W_Add,DI,Weight_En,WE,CLK,W_0_26_16);
Weight_0_26_17_BRAM     BRAM_26_17(W_Add,DI,Weight_En,WE,CLK,W_0_26_17);
Weight_0_26_18_BRAM     BRAM_26_18(W_Add,DI,Weight_En,WE,CLK,W_0_26_18);
Weight_0_26_19_BRAM     BRAM_26_19(W_Add,DI,Weight_En,WE,CLK,W_0_26_19);
Weight_0_26_20_BRAM     BRAM_26_20(W_Add,DI,Weight_En,WE,CLK,W_0_26_20);
Weight_0_26_21_BRAM     BRAM_26_21(W_Add,DI,Weight_En,WE,CLK,W_0_26_21);
Weight_0_26_22_BRAM     BRAM_26_22(W_Add,DI,Weight_En,WE,CLK,W_0_26_22);
Weight_0_26_23_BRAM     BRAM_26_23(W_Add,DI,Weight_En,WE,CLK,W_0_26_23);
Weight_0_26_24_BRAM     BRAM_26_24(W_Add,DI,Weight_En,WE,CLK,W_0_26_24);
Weight_0_26_25_BRAM     BRAM_26_25(W_Add,DI,Weight_En,WE,CLK,W_0_26_25);
Weight_0_26_26_BRAM     BRAM_26_26(W_Add,DI,Weight_En,WE,CLK,W_0_26_26);
Weight_0_26_27_BRAM     BRAM_26_27(W_Add,DI,Weight_En,WE,CLK,W_0_26_27);

//BRAM 28th Neuron
Weight_0_27_0_BRAM     BRAM_27_0(W_Add,DI,Weight_En,WE,CLK,W_0_27_0);
Weight_0_27_1_BRAM     BRAM_27_1(W_Add,DI,Weight_En,WE,CLK,W_0_27_1);
Weight_0_27_2_BRAM     BRAM_27_2(W_Add,DI,Weight_En,WE,CLK,W_0_27_2);
Weight_0_27_3_BRAM     BRAM_27_3(W_Add,DI,Weight_En,WE,CLK,W_0_27_3);
Weight_0_27_4_BRAM     BRAM_27_4(W_Add,DI,Weight_En,WE,CLK,W_0_27_4);
Weight_0_27_5_BRAM     BRAM_27_5(W_Add,DI,Weight_En,WE,CLK,W_0_27_5);
Weight_0_27_6_BRAM     BRAM_27_6(W_Add,DI,Weight_En,WE,CLK,W_0_27_6);
Weight_0_27_7_BRAM     BRAM_27_7(W_Add,DI,Weight_En,WE,CLK,W_0_27_7);
Weight_0_27_8_BRAM     BRAM_27_8(W_Add,DI,Weight_En,WE,CLK,W_0_27_8);
Weight_0_27_9_BRAM     BRAM_27_9(W_Add,DI,Weight_En,WE,CLK,W_0_27_9);
Weight_0_27_10_BRAM     BRAM_27_10(W_Add,DI,Weight_En,WE,CLK,W_0_27_10);
Weight_0_27_11_BRAM     BRAM_27_11(W_Add,DI,Weight_En,WE,CLK,W_0_27_11);
Weight_0_27_12_BRAM     BRAM_27_12(W_Add,DI,Weight_En,WE,CLK,W_0_27_12);
Weight_0_27_13_BRAM     BRAM_27_13(W_Add,DI,Weight_En,WE,CLK,W_0_27_13);
Weight_0_27_14_BRAM     BRAM_27_14(W_Add,DI,Weight_En,WE,CLK,W_0_27_14);
Weight_0_27_15_BRAM     BRAM_27_15(W_Add,DI,Weight_En,WE,CLK,W_0_27_15);
Weight_0_27_16_BRAM     BRAM_27_16(W_Add,DI,Weight_En,WE,CLK,W_0_27_16);
Weight_0_27_17_BRAM     BRAM_27_17(W_Add,DI,Weight_En,WE,CLK,W_0_27_17);
Weight_0_27_18_BRAM     BRAM_27_18(W_Add,DI,Weight_En,WE,CLK,W_0_27_18);
Weight_0_27_19_BRAM     BRAM_27_19(W_Add,DI,Weight_En,WE,CLK,W_0_27_19);
Weight_0_27_20_BRAM     BRAM_27_20(W_Add,DI,Weight_En,WE,CLK,W_0_27_20);
Weight_0_27_21_BRAM     BRAM_27_21(W_Add,DI,Weight_En,WE,CLK,W_0_27_21);
Weight_0_27_22_BRAM     BRAM_27_22(W_Add,DI,Weight_En,WE,CLK,W_0_27_22);
Weight_0_27_23_BRAM     BRAM_27_23(W_Add,DI,Weight_En,WE,CLK,W_0_27_23);
Weight_0_27_24_BRAM     BRAM_27_24(W_Add,DI,Weight_En,WE,CLK,W_0_27_24);
Weight_0_27_25_BRAM     BRAM_27_25(W_Add,DI,Weight_En,WE,CLK,W_0_27_25);
Weight_0_27_26_BRAM     BRAM_27_26(W_Add,DI,Weight_En,WE,CLK,W_0_27_26);
Weight_0_27_27_BRAM     BRAM_27_27(W_Add,DI,Weight_En,WE,CLK,W_0_27_27);

//BRAM 29th Neuron
Weight_0_28_0_BRAM     BRAM_28_0(W_Add,DI,Weight_En,WE,CLK,W_0_28_0);
Weight_0_28_1_BRAM     BRAM_28_1(W_Add,DI,Weight_En,WE,CLK,W_0_28_1);
Weight_0_28_2_BRAM     BRAM_28_2(W_Add,DI,Weight_En,WE,CLK,W_0_28_2);
Weight_0_28_3_BRAM     BRAM_28_3(W_Add,DI,Weight_En,WE,CLK,W_0_28_3);
Weight_0_28_4_BRAM     BRAM_28_4(W_Add,DI,Weight_En,WE,CLK,W_0_28_4);
Weight_0_28_5_BRAM     BRAM_28_5(W_Add,DI,Weight_En,WE,CLK,W_0_28_5);
Weight_0_28_6_BRAM     BRAM_28_6(W_Add,DI,Weight_En,WE,CLK,W_0_28_6);
Weight_0_28_7_BRAM     BRAM_28_7(W_Add,DI,Weight_En,WE,CLK,W_0_28_7);
Weight_0_28_8_BRAM     BRAM_28_8(W_Add,DI,Weight_En,WE,CLK,W_0_28_8);
Weight_0_28_9_BRAM     BRAM_28_9(W_Add,DI,Weight_En,WE,CLK,W_0_28_9);
Weight_0_28_10_BRAM     BRAM_28_10(W_Add,DI,Weight_En,WE,CLK,W_0_28_10);
Weight_0_28_11_BRAM     BRAM_28_11(W_Add,DI,Weight_En,WE,CLK,W_0_28_11);
Weight_0_28_12_BRAM     BRAM_28_12(W_Add,DI,Weight_En,WE,CLK,W_0_28_12);
Weight_0_28_13_BRAM     BRAM_28_13(W_Add,DI,Weight_En,WE,CLK,W_0_28_13);
Weight_0_28_14_BRAM     BRAM_28_14(W_Add,DI,Weight_En,WE,CLK,W_0_28_14);
Weight_0_28_15_BRAM     BRAM_28_15(W_Add,DI,Weight_En,WE,CLK,W_0_28_15);
Weight_0_28_16_BRAM     BRAM_28_16(W_Add,DI,Weight_En,WE,CLK,W_0_28_16);
Weight_0_28_17_BRAM     BRAM_28_17(W_Add,DI,Weight_En,WE,CLK,W_0_28_17);
Weight_0_28_18_BRAM     BRAM_28_18(W_Add,DI,Weight_En,WE,CLK,W_0_28_18);
Weight_0_28_19_BRAM     BRAM_28_19(W_Add,DI,Weight_En,WE,CLK,W_0_28_19);
Weight_0_28_20_BRAM     BRAM_28_20(W_Add,DI,Weight_En,WE,CLK,W_0_28_20);
Weight_0_28_21_BRAM     BRAM_28_21(W_Add,DI,Weight_En,WE,CLK,W_0_28_21);
Weight_0_28_22_BRAM     BRAM_28_22(W_Add,DI,Weight_En,WE,CLK,W_0_28_22);
Weight_0_28_23_BRAM     BRAM_28_23(W_Add,DI,Weight_En,WE,CLK,W_0_28_23);
Weight_0_28_24_BRAM     BRAM_28_24(W_Add,DI,Weight_En,WE,CLK,W_0_28_24);
Weight_0_28_25_BRAM     BRAM_28_25(W_Add,DI,Weight_En,WE,CLK,W_0_28_25);
Weight_0_28_26_BRAM     BRAM_28_26(W_Add,DI,Weight_En,WE,CLK,W_0_28_26);
Weight_0_28_27_BRAM     BRAM_28_27(W_Add,DI,Weight_En,WE,CLK,W_0_28_27);

//BRAM 30th Neuron
Weight_0_29_0_BRAM     BRAM_29_0(W_Add,DI,Weight_En,WE,CLK,W_0_29_0);
Weight_0_29_1_BRAM     BRAM_29_1(W_Add,DI,Weight_En,WE,CLK,W_0_29_1);
Weight_0_29_2_BRAM     BRAM_29_2(W_Add,DI,Weight_En,WE,CLK,W_0_29_2);
Weight_0_29_3_BRAM     BRAM_29_3(W_Add,DI,Weight_En,WE,CLK,W_0_29_3);
Weight_0_29_4_BRAM     BRAM_29_4(W_Add,DI,Weight_En,WE,CLK,W_0_29_4);
Weight_0_29_5_BRAM     BRAM_29_5(W_Add,DI,Weight_En,WE,CLK,W_0_29_5);
Weight_0_29_6_BRAM     BRAM_29_6(W_Add,DI,Weight_En,WE,CLK,W_0_29_6);
Weight_0_29_7_BRAM     BRAM_29_7(W_Add,DI,Weight_En,WE,CLK,W_0_29_7);
Weight_0_29_8_BRAM     BRAM_29_8(W_Add,DI,Weight_En,WE,CLK,W_0_29_8);
Weight_0_29_9_BRAM     BRAM_29_9(W_Add,DI,Weight_En,WE,CLK,W_0_29_9);
Weight_0_29_10_BRAM     BRAM_29_10(W_Add,DI,Weight_En,WE,CLK,W_0_29_10);
Weight_0_29_11_BRAM     BRAM_29_11(W_Add,DI,Weight_En,WE,CLK,W_0_29_11);
Weight_0_29_12_BRAM     BRAM_29_12(W_Add,DI,Weight_En,WE,CLK,W_0_29_12);
Weight_0_29_13_BRAM     BRAM_29_13(W_Add,DI,Weight_En,WE,CLK,W_0_29_13);
Weight_0_29_14_BRAM     BRAM_29_14(W_Add,DI,Weight_En,WE,CLK,W_0_29_14);
Weight_0_29_15_BRAM     BRAM_29_15(W_Add,DI,Weight_En,WE,CLK,W_0_29_15);
Weight_0_29_16_BRAM     BRAM_29_16(W_Add,DI,Weight_En,WE,CLK,W_0_29_16);
Weight_0_29_17_BRAM     BRAM_29_17(W_Add,DI,Weight_En,WE,CLK,W_0_29_17);
Weight_0_29_18_BRAM     BRAM_29_18(W_Add,DI,Weight_En,WE,CLK,W_0_29_18);
Weight_0_29_19_BRAM     BRAM_29_19(W_Add,DI,Weight_En,WE,CLK,W_0_29_19);
Weight_0_29_20_BRAM     BRAM_29_20(W_Add,DI,Weight_En,WE,CLK,W_0_29_20);
Weight_0_29_21_BRAM     BRAM_29_21(W_Add,DI,Weight_En,WE,CLK,W_0_29_21);
Weight_0_29_22_BRAM     BRAM_29_22(W_Add,DI,Weight_En,WE,CLK,W_0_29_22);
Weight_0_29_23_BRAM     BRAM_29_23(W_Add,DI,Weight_En,WE,CLK,W_0_29_23);
Weight_0_29_24_BRAM     BRAM_29_24(W_Add,DI,Weight_En,WE,CLK,W_0_29_24);
Weight_0_29_25_BRAM     BRAM_29_25(W_Add,DI,Weight_En,WE,CLK,W_0_29_25);
Weight_0_29_26_BRAM     BRAM_29_26(W_Add,DI,Weight_En,WE,CLK,W_0_29_26);
Weight_0_29_27_BRAM     BRAM_29_27(W_Add,DI,Weight_En,WE,CLK,W_0_29_27);


Parallelized_Neuron Neuron_1st( CLK, Clear, Data_Ready,  Done,Data_Request , Done_Final_Hidden_Layer, Pix_1_0, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_0_0, W_0_0_1, W_0_0_2, W_0_0_3, W_0_0_4, W_0_0_5, W_0_0_6, W_0_0_7, W_0_0_8,W_0_0_9, W_0_0_10,W_0_0_11, W_0_0_12, W_0_0_13, W_0_0_14, W_0_0_15, W_0_0_16, W_0_0_17, W_0_0_18, W_0_0_19, W_0_0_20, W_0_0_21, W_0_0_22, W_0_0_23, W_0_0_24, W_0_0_25, W_0_0_26, W_0_0_27, 16'b0001011110011001);

Parallelized_Neuron Neuron_2nd( CLK, Clear, Data_Ready,  Done, , , Pix_1_1, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_1_0, W_0_1_1, W_0_1_2, W_0_1_3, W_0_1_4, W_0_1_5, W_0_1_6, W_0_1_7, W_0_1_8,W_0_1_9, W_0_1_10,W_0_1_11, W_0_1_12, W_0_1_13, W_0_1_14, W_0_1_15, W_0_1_16, W_0_1_17, W_0_1_18, W_0_1_19, W_0_1_20, W_0_1_21, W_0_1_22, W_0_1_23, W_0_1_24, W_0_1_25, W_0_1_26, W_0_1_27, 16'b110011011110100);

Parallelized_Neuron Neuron_3rd( CLK, Clear, Data_Ready,  Done, , , Pix_1_2, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_2_0, W_0_2_1, W_0_2_2, W_0_2_3, W_0_2_4, W_0_2_5, W_0_2_6, W_0_2_7, W_0_2_8,W_0_2_9, W_0_2_10,W_0_2_11, W_0_2_12, W_0_2_13, W_0_2_14, W_0_2_15, W_0_2_16, W_0_2_17, W_0_2_18, W_0_2_19, W_0_2_20, W_0_2_21, W_0_2_22, W_0_2_23, W_0_2_24, W_0_2_25, W_0_2_26, W_0_2_27, 16'b1111101101001010);

Parallelized_Neuron Neuron_4th( CLK, Clear, Data_Ready,  Done, , , Pix_1_3, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_3_0, W_0_3_1, W_0_3_2, W_0_3_3, W_0_3_4, W_0_3_5, W_0_3_6, W_0_3_7, W_0_3_8,W_0_3_9, W_0_3_10,W_0_3_11, W_0_3_12, W_0_3_13, W_0_3_14, W_0_3_15, W_0_3_16, W_0_3_17, W_0_3_18, W_0_3_19, W_0_3_20, W_0_3_21, W_0_3_22, W_0_3_23, W_0_3_24, W_0_3_25, W_0_3_26, W_0_3_27, 16'b1110110100010110);

Parallelized_Neuron Neuron_5th( CLK, Clear, Data_Ready,  Done, , , Pix_1_4, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_4_0, W_0_4_1, W_0_4_2, W_0_4_3, W_0_4_4, W_0_4_5, W_0_4_6, W_0_4_7, W_0_4_8,W_0_4_9, W_0_4_10,W_0_4_11, W_0_4_12, W_0_4_13, W_0_4_14, W_0_4_15, W_0_4_16, W_0_4_17, W_0_4_18, W_0_4_19, W_0_4_20, W_0_4_21, W_0_4_22, W_0_4_23, W_0_4_24, W_0_4_25, W_0_4_26, W_0_4_27, 16'b1110100001101001);

Parallelized_Neuron Neuron_6th( CLK, Clear, Data_Ready,  Done, , , Pix_1_5, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_5_0, W_0_5_1, W_0_5_2, W_0_5_3, W_0_5_4, W_0_5_5, W_0_5_6, W_0_5_7, W_0_5_8,W_0_5_9, W_0_5_10,W_0_5_11, W_0_5_12, W_0_5_13, W_0_5_14, W_0_5_15, W_0_5_16, W_0_5_17, W_0_5_18, W_0_5_19, W_0_5_20, W_0_5_21, W_0_5_22, W_0_5_23, W_0_5_24, W_0_5_25, W_0_5_26, W_0_5_27, 16'b0001001010011100);

Parallelized_Neuron Neuron_7th( CLK, Clear, Data_Ready,  Done, , , Pix_1_6, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
 W_0_6_0, W_0_6_1, W_0_6_2, W_0_6_3, W_0_6_4, W_0_6_5, W_0_6_6, W_0_6_7, W_0_6_8,W_0_6_9, W_0_6_10,W_0_6_11, W_0_6_12, W_0_6_13, W_0_6_14, W_0_6_15, W_0_6_16, W_0_6_17, W_0_6_18, W_0_6_19, W_0_6_20, W_0_6_21, W_0_6_22, W_0_6_23, W_0_6_24, W_0_6_25, W_0_6_26, W_0_6_27, 16'b1111001001100011);

Parallelized_Neuron Neuron_8th( CLK, Clear, Data_Ready,  Done, , , Pix_1_7, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_7_0, W_0_7_1, W_0_7_2, W_0_7_3, W_0_7_4, W_0_7_5, W_0_7_6, W_0_7_7, W_0_7_8,W_0_7_9, W_0_7_10,W_0_7_11, W_0_7_12, W_0_7_13, W_0_7_14, W_0_7_15, W_0_7_16, W_0_7_17, W_0_7_18, W_0_7_19, W_0_7_20, W_0_7_21, W_0_7_22, W_0_7_23, W_0_7_24, W_0_7_25, W_0_7_26, W_0_7_27, 16'b1111110100101000);

Parallelized_Neuron Neuron_9th( CLK, Clear, Data_Ready,  Done, , , Pix_1_8, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_8_0, W_0_8_1, W_0_8_2, W_0_8_3, W_0_8_4, W_0_8_5, W_0_8_6, W_0_8_7, W_0_8_8,W_0_8_9, W_0_8_10,W_0_8_11, W_0_8_12, W_0_8_13, W_0_8_14, W_0_8_15, W_0_8_16, W_0_8_17, W_0_8_18, W_0_8_19, W_0_8_20, W_0_8_21, W_0_8_22, W_0_8_23, W_0_8_24, W_0_8_25, W_0_8_26, W_0_8_27, 16'b1011101010000100);

Parallelized_Neuron Neuron_10th( CLK, Clear, Data_Ready,  Done, , , Pix_1_9, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_9_0, W_0_9_1, W_0_9_2, W_0_9_3, W_0_9_4, W_0_9_5, W_0_9_6, W_0_9_7, W_0_9_8,W_0_9_9, W_0_9_10,W_0_9_11, W_0_9_12, W_0_9_13, W_0_9_14, W_0_9_15, W_0_9_16, W_0_9_17, W_0_9_18, W_0_9_19, W_0_9_20, W_0_9_21, W_0_9_22, W_0_9_23, W_0_9_24, W_0_9_25, W_0_9_26, W_0_9_27,16'b0000001001010010);

Parallelized_Neuron Neuron_11th( CLK, Clear, Data_Ready,  Done, , , Pix_1_10, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_10_0, W_0_10_1, W_0_10_2, W_0_10_3, W_0_10_4, W_0_10_5, W_0_10_6, W_0_10_7, W_0_10_8,W_0_10_9, W_0_10_10,W_0_10_11, W_0_10_12, W_0_10_13, W_0_10_14, W_0_10_15, W_0_10_16, W_0_10_17, W_0_10_18, W_0_10_19, W_0_10_20, W_0_10_21, W_0_10_22, W_0_10_23, W_0_10_24, W_0_10_25, W_0_10_26, W_0_10_27, 16'b0000010101111101);

Parallelized_Neuron Neuron_12th( CLK, Clear, Data_Ready,  Done, , , Pix_1_11, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_11_0, W_0_11_1, W_0_11_2, W_0_11_3, W_0_11_4, W_0_11_5, W_0_11_6, W_0_11_7, W_0_11_8,W_0_11_9, W_0_11_10,W_0_11_11, W_0_11_12, W_0_11_13, W_0_11_14, W_0_11_15, W_0_11_16, W_0_11_17, W_0_11_18, W_0_11_19, W_0_11_20, W_0_11_21, W_0_11_22, W_0_11_23, W_0_11_24, W_0_11_25, W_0_11_26, W_0_11_27, 16'b1111000101100010);

Parallelized_Neuron Neuron_13th( CLK, Clear, Data_Ready,  Done, , , Pix_1_12, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_12_0, W_0_12_1, W_0_12_2, W_0_12_3, W_0_12_4, W_0_12_5, W_0_12_6, W_0_12_7, W_0_12_8,W_0_12_9, W_0_12_10,W_0_12_11, W_0_12_12, W_0_12_13, W_0_12_14, W_0_12_15, W_0_12_16, W_0_12_17, W_0_12_18, W_0_12_19, W_0_12_20, W_0_12_21, W_0_12_22, W_0_12_23, W_0_12_24, W_0_12_25, W_0_12_26, W_0_12_27, 16'b1111010110010010);

Parallelized_Neuron Neuron_14th( CLK, Clear, Data_Ready,  Done, , , Pix_1_13, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_13_0, W_0_13_1, W_0_13_2, W_0_13_3, W_0_13_4, W_0_13_5, W_0_13_6, W_0_13_7, W_0_13_8,W_0_13_9, W_0_13_10,W_0_13_11, W_0_13_12, W_0_13_13, W_0_13_14, W_0_13_15, W_0_13_16, W_0_13_17, W_0_13_18, W_0_13_19, W_0_13_20, W_0_13_21, W_0_13_22, W_0_13_23, W_0_13_24, W_0_13_25, W_0_13_26, W_0_13_27, 16'b1101001000011011);

Parallelized_Neuron Neuron_15th( CLK, Clear, Data_Ready,  Done, , , Pix_1_14, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_14_0, W_0_14_1, W_0_14_2, W_0_14_3, W_0_14_4, W_0_14_5, W_0_14_6, W_0_14_7, W_0_14_8,W_0_14_9, W_0_14_10,W_0_14_11, W_0_14_12, W_0_14_13, W_0_14_14, W_0_14_15, W_0_14_16, W_0_14_17, W_0_14_18, W_0_14_19, W_0_14_20, W_0_14_21, W_0_14_22, W_0_14_23, W_0_14_24, W_0_14_25, W_0_14_26, W_0_14_27, 16'b0001101011110001);

Parallelized_Neuron Neuron_16th( CLK, Clear, Data_Ready,  Done, , , Pix_1_15, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_15_0, W_0_15_1, W_0_15_2, W_0_15_3, W_0_15_4, W_0_15_5, W_0_15_6, W_0_15_7, W_0_15_8,W_0_15_9, W_0_15_10,W_0_15_11, W_0_15_12, W_0_15_13, W_0_15_14, W_0_15_15, W_0_15_16, W_0_15_17, W_0_15_18, W_0_15_19, W_0_15_20, W_0_15_21, W_0_15_22, W_0_15_23, W_0_15_24, W_0_15_25, W_0_15_26, W_0_15_27, 16'b0000000110011110);

Parallelized_Neuron Neuron_17th( CLK, Clear, Data_Ready,  Done, , , Pix_1_16, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_16_0, W_0_16_1, W_0_16_2, W_0_16_3, W_0_16_4, W_0_16_5, W_0_16_6, W_0_16_7, W_0_16_8,W_0_16_9, W_0_16_10,W_0_16_11, W_0_16_12, W_0_16_13, W_0_16_14, W_0_16_15, W_0_16_16, W_0_16_17, W_0_16_18, W_0_16_19, W_0_16_20, W_0_16_21, W_0_16_22, W_0_16_23, W_0_16_24, W_0_16_25, W_0_16_26, W_0_16_27, 16'b1101111111001011);

Parallelized_Neuron Neuron_18th( CLK, Clear, Data_Ready,  Done, , , Pix_1_17, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_17_0, W_0_17_1, W_0_17_2, W_0_17_3, W_0_17_4, W_0_17_5, W_0_17_6, W_0_17_7, W_0_17_8,W_0_17_9, W_0_17_10,W_0_17_11, W_0_17_12, W_0_17_13, W_0_17_14, W_0_17_15, W_0_17_16, W_0_17_17, W_0_17_18, W_0_17_19, W_0_17_20, W_0_17_21, W_0_17_22, W_0_17_23, W_0_17_24, W_0_17_25, W_0_17_26, W_0_17_27, 16'b0000111011111101);

Parallelized_Neuron Neuron_19th( CLK, Clear, Data_Ready,  Done, , , Pix_1_18, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_18_0, W_0_18_1, W_0_18_2, W_0_18_3, W_0_18_4, W_0_18_5, W_0_18_6, W_0_18_7, W_0_18_8,W_0_18_9, W_0_18_10,W_0_18_11, W_0_18_12, W_0_18_13, W_0_18_14, W_0_18_15, W_0_18_16, W_0_18_17, W_0_18_18, W_0_18_19, W_0_18_20, W_0_18_21, W_0_18_22, W_0_18_23, W_0_18_24, W_0_18_25, W_0_18_26, W_0_18_27, 16'b1110010100111010);

Parallelized_Neuron Neuron_20th( CLK, Clear, Data_Ready,  Done, , , Pix_1_19, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_19_0, W_0_19_1, W_0_19_2, W_0_19_3, W_0_19_4, W_0_19_5, W_0_19_6, W_0_19_7, W_0_19_8,W_0_19_9, W_0_19_10,W_0_19_11, W_0_19_12, W_0_19_13, W_0_19_14, W_0_19_15, W_0_19_16, W_0_19_17, W_0_19_18, W_0_19_19, W_0_19_20, W_0_19_21, W_0_19_22, W_0_19_23, W_0_19_24, W_0_19_25, W_0_19_26, W_0_19_27, 16'b0001111011111110);

Parallelized_Neuron Neuron_21st( CLK, Clear, Data_Ready,  Done, , , Pix_1_20, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_20_0, W_0_20_1, W_0_20_2, W_0_20_3, W_0_20_4, W_0_20_5, W_0_20_6, W_0_20_7, W_0_20_8,W_0_20_9, W_0_20_10,W_0_20_11, W_0_20_12, W_0_20_13, W_0_20_14, W_0_20_15, W_0_20_16, W_0_20_17, W_0_20_18, W_0_20_19, W_0_20_20, W_0_20_21, W_0_20_22, W_0_20_23, W_0_20_24, W_0_20_25, W_0_20_26, W_0_20_27,  16'b1110111000000110);

Parallelized_Neuron Neuron_22nd( CLK, Clear, Data_Ready,  Done, , , Pix_1_21, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_21_0, W_0_21_1, W_0_21_2, W_0_21_3, W_0_21_4, W_0_21_5, W_0_21_6, W_0_21_7, W_0_21_8,W_0_21_9, W_0_21_10,W_0_21_11, W_0_21_12, W_0_21_13, W_0_21_14, W_0_21_15, W_0_21_16, W_0_21_17, W_0_21_18, W_0_21_19, W_0_21_20, W_0_21_21, W_0_21_22, W_0_21_23, W_0_21_24, W_0_21_25, W_0_21_26, W_0_21_27, 16'b1110000111011001);

Parallelized_Neuron Neuron_23rd( CLK, Clear, Data_Ready,  Done, , , Pix_1_22, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_22_0, W_0_22_1, W_0_22_2, W_0_22_3, W_0_22_4, W_0_22_5, W_0_22_6, W_0_22_7, W_0_22_8,W_0_22_9, W_0_22_10,W_0_22_11, W_0_22_12, W_0_22_13, W_0_22_14, W_0_22_15, W_0_22_16, W_0_22_17, W_0_22_18, W_0_22_19, W_0_22_20, W_0_22_21, W_0_22_22, W_0_22_23, W_0_22_24, W_0_22_25, W_0_22_26, W_0_22_27, 16'b1101101000110100);

Parallelized_Neuron Neuron_24th( CLK, Clear, Data_Ready,  Done, , , Pix_1_23, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_23_0, W_0_23_1, W_0_23_2, W_0_23_3, W_0_23_4, W_0_23_5, W_0_23_6, W_0_23_7, W_0_23_8,W_0_23_9, W_0_23_10,W_0_23_11, W_0_23_12, W_0_23_13, W_0_23_14, W_0_23_15, W_0_23_16, W_0_23_17, W_0_23_18, W_0_23_19, W_0_23_20, W_0_23_21, W_0_23_22, W_0_23_23, W_0_23_24, W_0_23_25, W_0_23_26, W_0_23_27, 16'b1110001100100000);

Parallelized_Neuron Neuron_25th( CLK, Clear, Data_Ready,  Done, , , Pix_1_24, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_24_0, W_0_24_1, W_0_24_2, W_0_24_3, W_0_24_4, W_0_24_5, W_0_24_6, W_0_24_7, W_0_24_8,W_0_24_9, W_0_24_10,W_0_24_11, W_0_24_12, W_0_24_13, W_0_24_14, W_0_24_15, W_0_24_16, W_0_24_17, W_0_24_18, W_0_24_19, W_0_24_20, W_0_24_21, W_0_24_22, W_0_24_23, W_0_24_24, W_0_24_25, W_0_24_26, W_0_24_27, 16'b0000001011010111);

Parallelized_Neuron Neuron_26th( CLK, Clear, Data_Ready,  Done, , , Pix_1_25, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_25_0, W_0_25_1, W_0_25_2, W_0_25_3, W_0_25_4, W_0_25_5, W_0_25_6, W_0_25_7, W_0_25_8,W_0_25_9, W_0_25_10,W_0_25_11, W_0_25_12, W_0_25_13, W_0_25_14, W_0_25_15, W_0_25_16, W_0_25_17, W_0_25_18, W_0_25_19, W_0_25_20, W_0_25_21, W_0_25_22, W_0_25_23, W_0_25_24, W_0_25_25, W_0_25_26, W_0_25_27, 16'b0011010010010110);

Parallelized_Neuron Neuron_27th( CLK, Clear, Data_Ready,  Done, , , Pix_1_26, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
 W_0_26_0, W_0_26_1, W_0_26_2, W_0_26_3, W_0_26_4, W_0_26_5, W_0_26_6, W_0_26_7, W_0_26_8,W_0_26_9, W_0_26_10,W_0_26_11, W_0_26_12, W_0_26_13, W_0_26_14, W_0_26_15, W_0_26_16, W_0_26_17, W_0_26_18, W_0_26_19, W_0_26_20, W_0_26_21, W_0_26_22, W_0_26_23, W_0_26_24, W_0_26_25, W_0_26_26, W_0_26_27, 16'b1111010010100101);

Parallelized_Neuron Neuron_28th( CLK, Clear, Data_Ready,  Done, , , Pix_1_27, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_27_0, W_0_27_1, W_0_27_2, W_0_27_3, W_0_27_4, W_0_27_5, W_0_27_6, W_0_27_7, W_0_27_8,W_0_27_9, W_0_27_10,W_0_27_11, W_0_27_12, W_0_27_13, W_0_27_14, W_0_27_15, W_0_27_16, W_0_27_17, W_0_27_18, W_0_27_19, W_0_27_20, W_0_27_21, W_0_27_22, W_0_27_23, W_0_27_24, W_0_27_25, W_0_27_26, W_0_27_27, 16'b0000111000011000);

Parallelized_Neuron Neuron_29th( CLK, Clear, Data_Ready,  Done, , , Pix_1_28, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_28_0, W_0_28_1, W_0_28_2, W_0_28_3, W_0_28_4, W_0_28_5, W_0_28_6, W_0_28_7, W_0_28_8,W_0_28_9, W_0_28_10,W_0_28_11, W_0_28_12, W_0_28_13, W_0_28_14, W_0_28_15, W_0_28_16, W_0_28_17, W_0_28_18, W_0_28_19, W_0_28_20, W_0_28_21, W_0_28_22, W_0_28_23, W_0_28_24, W_0_28_25, W_0_28_26, W_0_28_27, 16'b1111001010111000);

Parallelized_Neuron Neuron_30th( CLK, Clear, Data_Ready,  Done, , , Pix_1_29, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27,
W_0_29_0, W_0_29_1, W_0_29_2, W_0_29_3, W_0_29_4, W_0_29_5, W_0_29_6, W_0_29_7, W_0_29_8,W_0_29_9, W_0_29_10,W_0_29_11, W_0_29_12, W_0_29_13, W_0_29_14, W_0_29_15, W_0_29_16, W_0_29_17, W_0_29_18, W_0_29_19, W_0_29_20, W_0_29_21, W_0_29_22, W_0_29_23, W_0_29_24, W_0_29_25, W_0_29_26, W_0_29_27, 16'b0000010011111000);



Mux32X1 U3 (Pix_1_0, Pix_1_1, Pix_1_2, Pix_1_3, Pix_1_4, Pix_1_5, Pix_1_6, Pix_1_7, Pix_1_8, Pix_1_9, Pix_1_10,  Pix_1_11, Pix_1_12, Pix_1_13, Pix_1_14, Pix_1_15, Pix_1_16, Pix_1_17, Pix_1_18, Pix_1_19, Pix_1_20, Pix_1_21, Pix_1_22, Pix_1_23, Pix_1_24, Pix_1_25, Pix_1_26, Pix_1_27, Pix_1_28, Pix_1_29,,,Pix_En_Output_Layer,Pix_Out_Mux);
always @(negedge CLK) begin
    Pix_Out <= Pix_Out_Mux;
end
//Second Layer BRAM
AGU_Output_Layer U1(CLK, Rst, (Data_Request_Output_Layer && Done_Final_Hidden_Layer), W_Add_Output_Layer_AGU,  Data_Ready_AGU_Output, Done_AGU_Output, W_En_Output_Layer , Pix_En_Output_Layer_AGU, Controller_Data_Request);
assign Pix_En_Output_Layer = Pix_En_Output_Layer_AGU - 1;
assign W_Add_Output_Layer = W_Add_Output_Layer_AGU - 1;

Weight_1_0_BRAM     BRAM1_0(W_Add_Output_Layer,,W_En_Output_Layer,WE,CLK,W_1_0);
Weight_1_1_BRAM     BRAM1_1(W_Add_Output_Layer,,W_En_Output_Layer,WE,CLK,W_1_1);
Weight_1_2_BRAM     BRAM1_2(W_Add_Output_Layer,,W_En_Output_Layer,WE,CLK,W_1_2);
Weight_1_3_BRAM     BRAM1_3(W_Add_Output_Layer,,W_En_Output_Layer,WE,CLK,W_1_3);
Weight_1_4_BRAM     BRAM1_4(W_Add_Output_Layer,,W_En_Output_Layer,WE,CLK,W_1_4);
Weight_1_5_BRAM     BRAM1_5(W_Add_Output_Layer,,W_En_Output_Layer,WE,CLK,W_1_5);
Weight_1_6_BRAM     BRAM1_6(W_Add_Output_Layer,,W_En_Output_Layer,WE,CLK,W_1_6);
Weight_1_7_BRAM     BRAM1_7(W_Add_Output_Layer,,W_En_Output_Layer,WE,CLK,W_1_7);
Weight_1_8_BRAM     BRAM1_8(W_Add_Output_Layer,,W_En_Output_Layer,WE,CLK,W_1_8);
Weight_1_9_BRAM     BRAM1_9(W_Add_Output_Layer,,W_En_Output_Layer,WE,CLK,W_1_9);

Neuron_Out  Neuron_H_1_0(Pix_Out, W_1_0, Sum_1_0, CLK, Clear, Data_Ready_AGU_Output, Data_Request_Output_Layer , Done_AGU_Output, Done_Output_Layer,16'b1101010001111001);//32'hc02e1cad);//
Neuron_Out  Neuron_H_1_1(Pix_Out, W_1_1, Sum_1_1, CLK, Clear, Data_Ready_AGU_Output,  , Done_AGU_Output, , 16'b1101111011010000);//32'hc004c0b6);//
Neuron_Out  Neuron_H_1_2(Pix_Out, W_1_2, Sum_1_2, CLK, Clear, Data_Ready_AGU_Output,  , Done_AGU_Output, , 16'b1010111001010101);//32'hc0a3569f);//
Neuron_Out  Neuron_H_1_3(Pix_Out, W_1_3, Sum_1_3, CLK, Clear, Data_Ready_AGU_Output,  , Done_AGU_Output, , 16'b1011110110001110);//32'hc084e3a8 );//
Neuron_Out  Neuron_H_1_4(Pix_Out, W_1_4, Sum_1_4, CLK, Clear, Data_Ready_AGU_Output,  , Done_AGU_Output, , 16'b1110100011011111);//32'hbfb90be3);//
Neuron_Out  Neuron_H_1_5(Pix_Out, W_1_5, Sum_1_5, CLK, Clear, Data_Ready_AGU_Output,  , Done_AGU_Output, , 16'b1100011011100100);//32'hc0647014);//
Neuron_Out  Neuron_H_1_6(Pix_Out, W_1_6, Sum_1_6, CLK, Clear, Data_Ready_AGU_Output,  , Done_AGU_Output, , 16'b1101001110000101);//32'hc031ec84);//
Neuron_Out  Neuron_H_1_7(Pix_Out, W_1_7, Sum_1_7, CLK, Clear, Data_Ready_AGU_Output,  , Done_AGU_Output, , 16'b1111001101111100); //32'hbf484462);//
Neuron_Out  Neuron_H_1_8(Pix_Out, W_1_8, Sum_1_8, CLK, Clear, Data_Ready_AGU_Output,  , Done_AGU_Output, , 16'b1011101111011001);//32'hc0884e0e);//
Neuron_Out  Neuron_H_1_9(Pix_Out, W_1_9, Sum_1_9, CLK, Clear, Data_Ready_AGU_Output,  , Done_AGU_Output, , 16'b1110100100010110);// 32'hbfb752bb);//



endmodule
