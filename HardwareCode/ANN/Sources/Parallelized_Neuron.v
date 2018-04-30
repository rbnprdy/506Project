`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2018 11:41:52 AM
// Design Name: 
// Module Name: Parallelized_Neuron
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


module Parallelized_Neuron( CLK, Rst, Data_Ready,  Done,Data_Request , Done_Final_Hidden_Layer, Pix_1_0, Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27, W_0_0_0, W_0_0_1, W_0_0_2, W_0_0_3, W_0_0_4, W_0_0_5, W_0_0_6, W_0_0_7, W_0_0_8,W_0_0_9, W_0_0_10,W_0_0_11, W_0_0_12, W_0_0_13, W_0_0_14, W_0_0_15, W_0_0_16, W_0_0_17, W_0_0_18, W_0_0_19, W_0_0_20, W_0_0_21, W_0_0_22, W_0_0_23, W_0_0_24, W_0_0_25, W_0_0_26, W_0_0_27, Bias);
input CLK, Rst;
input wire Data_Ready,  Done;
output Data_Request;
wire Done_Hidden_Layer;
output wire signed [15:0] Pix_1_0;
reg signed [43:0] Final_Sum;
wire signed [31:0] Div_FinalSum;
input wire [7:0] Pix_0, Pix_1, Pix_2, Pix_3, Pix_4, Pix_5, Pix_6, Pix_7, Pix_8, Pix_9, Pix_10,  Pix_11, Pix_12, Pix_13, Pix_14, Pix_15, Pix_16, Pix_17, Pix_18, Pix_19, Pix_20, Pix_21, Pix_22, Pix_23, Pix_24, Pix_25, Pix_26, Pix_27;

input wire signed [15:0] W_0_0_0, W_0_0_1, W_0_0_2, W_0_0_3, W_0_0_4, W_0_0_5, W_0_0_6, W_0_0_7, W_0_0_8,W_0_0_9, W_0_0_10,W_0_0_11, W_0_0_12, W_0_0_13, W_0_0_14, W_0_0_15, W_0_0_16, W_0_0_17, W_0_0_18, W_0_0_19, W_0_0_20, W_0_0_21, W_0_0_22, W_0_0_23, W_0_0_24, W_0_0_25, W_0_0_26, W_0_0_27;  

wire  signed [31:0] SumH_0_0,SumH_0_1, SumH_0_2, SumH_0_3, SumH_0_4, SumH_0_5, SumH_0_6, SumH_0_7, SumH_0_8, SumH_0_9, SumH_0_10, SumH_0_11, SumH_0_12, SumH_0_13, SumH_0_14, SumH_0_15, SumH_0_16, SumH_0_17, SumH_0_18, SumH_0_19, SumH_0_20, SumH_0_21, SumH_0_22, SumH_0_23, SumH_0_24,SumH_0_25, SumH_0_26, SumH_0_27;

wire signed [31:0] Ex_Sum_H_0, Incremeant_Ex_Result_H_0,Rec_Sum_H_0, Result_Negate_Mul_H_0;

wire Fixed_Float_SlaveReady, Fixed_Float_SlaveValid, Fixed_Float_MasterValid;
reg Fixed_Float_MasterReady;

wire Float_Fixed_SlaveReady, Float_Fixed_SlaveValid, Float_Fixed_MasterValid;
reg Float_Fixed_MasterReady;


wire ADD_H_0_SlaveReady_A, ADD_H_0_SlaveValid_A, ADD_H_0_SlaveReady_B, ADD_H_0_SlaveValid_B, ADD_H_0_MasterValid;
reg  ADD_H_0_MasterReady;

wire Ex_H_0_SlaveValid, Ex_H_0_SlaveReady , Ex_H_0_MasterValid;
reg  Ex_H_0_MasterReady;

wire Rec_H_0_SlaveValid, Rec_H_0_SlaveReady , Rec_H_0_MasterValid;
reg  Rec_H_0_MasterReady;

wire MUL_SlaveValid_A, MUL_SlaveReady_A, MUL_SlaveReady_B, MUL_SlaveValid_B, MUL_MasterValid;
reg MUL_MasterReady;

input signed [15:0] Bias;
wire signed [31:0]  Float_Sum;
wire signed [15:0] Fixed_Sum;

reg [2:0] State, Next_State;
parameter S_Wait = 0, S_Enable_ADD = 1,  S_Fixed_Float = 2, S_Float_Fixed = 3, S_Ex = 4, S_ADD = 5,  S_Rec = 6, S_MUL = 7;

output reg Done_Final_Hidden_Layer;


Neuron  Neuron_H_0_0(Pix_0, W_0_0_0, SumH_0_0, CLK, Rst, Data_Ready, Data_Request, Done, Done_Hidden_Layer);
Neuron  Neuron_H_0_1(Pix_1, W_0_0_1, SumH_0_1, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_2(Pix_2, W_0_0_2, SumH_0_2, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_3(Pix_3, W_0_0_3, SumH_0_3, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_4(Pix_4, W_0_0_4, SumH_0_4, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_5(Pix_5, W_0_0_5, SumH_0_5, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_6(Pix_6, W_0_0_6, SumH_0_6, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_7(Pix_7, W_0_0_7, SumH_0_7, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_8(Pix_8, W_0_0_8, SumH_0_8, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_9(Pix_9, W_0_0_9, SumH_0_9, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_10(Pix_10, W_0_0_10, SumH_0_10, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_11(Pix_11, W_0_0_11, SumH_0_11, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_12(Pix_12, W_0_0_12, SumH_0_12, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_13(Pix_13, W_0_0_13, SumH_0_13, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_14(Pix_14, W_0_0_14, SumH_0_14, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_15(Pix_15, W_0_0_15, SumH_0_15, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_16(Pix_16, W_0_0_16, SumH_0_16, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_17(Pix_17, W_0_0_17, SumH_0_17, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_18(Pix_18, W_0_0_18, SumH_0_18, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_19(Pix_19, W_0_0_19, SumH_0_19, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_20(Pix_20, W_0_0_20, SumH_0_20, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_21(Pix_21, W_0_0_21, SumH_0_21, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_22(Pix_22, W_0_0_22, SumH_0_22, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_23(Pix_23, W_0_0_23, SumH_0_23, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_24(Pix_24, W_0_0_24, SumH_0_24, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_25(Pix_25, W_0_0_25, SumH_0_25, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_26(Pix_26, W_0_0_26, SumH_0_26, CLK, Rst, Data_Ready, , Done, );
Neuron  Neuron_H_0_27(Pix_27, W_0_0_27, SumH_0_27, CLK, Rst, Data_Ready, , Done, );
assign MUL_SlaveValid_A = (MUL_MasterValid) ?1:0;
assign MUL_SlaveValid_B = (MUL_MasterValid) ?1:0;
assign Fixed_Float_SlaveValid = (Fixed_Float_MasterValid) ? 1:0;
assign Float_Fixed_SlaveValid = (Float_Fixed_MasterValid) ? 1:0;
assign Ex_H_0_SlaveValid     = ( Ex_H_0_MasterValid ) ? 1:0;
assign Rec_H_0_SlaveValid    = ( Rec_H_0_MasterValid ) ? 1:0;
assign ADD_H_0_SlaveValid_A  = ( ADD_H_0_MasterValid ) ? 1:0;
assign ADD_H_0_SlaveValid_B  = ( ADD_H_0_MasterValid ) ? 1:0;
wire signed [31:0] SigneEx_Div_FinalSum ;

wire signed [31:0] Result_Mul; 
assign SigneEx_Div_FinalSum = (Div_FinalSum[15]==1)? ({16'hFFFF,Div_FinalSum}):({16'h0000,Div_FinalSum});
Fixed_Float  FF_1( CLK,
    Fixed_Float_SlaveValid,
    Fixed_Float_SlaveReady,
    SigneEx_Div_FinalSum,
    Fixed_Float_MasterValid,
    Fixed_Float_MasterReady ,
    Float_Sum
  );
Exponenitial EX_H_0( CLK , Ex_H_0_SlaveValid , Ex_H_0_SlaveReady , Float_Sum, Ex_H_0_MasterValid, Ex_H_0_MasterReady, Ex_Sum_H_0 );
FP_ADD ADD_H_0(CLK, ADD_H_0_SlaveValid_A, ADD_H_0_SlaveReady_A, Ex_Sum_H_0, ADD_H_0_SlaveValid_B, ADD_H_0_SlaveReady_B, 32'h3F800000, ADD_H_0_MasterValid, ADD_H_0_MasterReady, Incremeant_Ex_Result_H_0);
Reciprocal Rec_H_0(CLK, Rec_H_0_SlaveValid, Rec_H_0_SlaveReady, Incremeant_Ex_Result_H_0, Rec_H_0_MasterValid, Rec_H_0_MasterReady, Rec_Sum_H_0 );
Float_Fixed FF_2(
    CLK,
    Float_Fixed_SlaveValid,
    Float_Fixed_SlaveReady,
    Rec_Sum_H_0,
    Float_Fixed_MasterValid,
    Float_Fixed_MasterReady,
    Fixed_Sum
  );

Register Storage_H_0 (CLK, Rst, Done_Final_Hidden_Layer, Fixed_Sum, Pix_1_0);

always @(posedge CLK) begin
    if (Rst == 1) begin
        State <= S_Wait;
    end
    else begin
        State <= Next_State;
    end
end
always @(*) begin
   
    Ex_H_0_MasterReady <= 0; Rec_H_0_MasterReady <= 0; ADD_H_0_MasterReady <= 0;
    Fixed_Float_MasterReady <= 0; Float_Fixed_MasterReady <= 0;
    
    case (State)
        S_Wait : begin
            Done_Final_Hidden_Layer <= 0;
            Final_Sum <= 44'd0;
            Ex_H_0_MasterReady <= 0; Rec_H_0_MasterReady <= 0; ADD_H_0_MasterReady <= 0;
            Fixed_Float_MasterReady <= 0; Float_Fixed_MasterReady <= 0; MUL_MasterReady<= 0;
            if (Done_Hidden_Layer) begin
               Next_State <=  S_Enable_ADD;
            end
            else begin
                Next_State <= S_Wait;
            end
        end
        S_Enable_ADD : begin
            Next_State <= S_Fixed_Float; 
            MUL_MasterReady<= 0;
            Final_Sum <= $signed(Bias) + $signed(SumH_0_0) + $signed(SumH_0_1) + $signed(SumH_0_2) + $signed(SumH_0_3) + $signed(SumH_0_4) + $signed(SumH_0_5) + $signed(SumH_0_6) + $signed(SumH_0_7) + $signed(SumH_0_8) + $signed(SumH_0_9) + $signed(SumH_0_10) + $signed(SumH_0_11) + $signed(SumH_0_12) + $signed(SumH_0_13) + $signed(SumH_0_14) + $signed(SumH_0_15) + $signed(SumH_0_16) + $signed(SumH_0_17) + $signed(SumH_0_18) + $signed(SumH_0_19) + $signed(SumH_0_20) + $signed(SumH_0_21) + $signed(SumH_0_22) + $signed(SumH_0_23) + $signed(SumH_0_24) + $signed(SumH_0_25) + $signed(SumH_0_26) + $signed(SumH_0_27);
            Done_Final_Hidden_Layer <= 0;
             Ex_H_0_MasterReady <= 0; Rec_H_0_MasterReady <= 0; ADD_H_0_MasterReady <= 0;
            Fixed_Float_MasterReady <= 0; Float_Fixed_MasterReady <= 0;
            
        end
        S_Fixed_Float : begin
            Final_Sum <= $signed(Bias) + $signed(SumH_0_0) + $signed(SumH_0_1) + $signed(SumH_0_2) + $signed(SumH_0_3) + $signed(SumH_0_4) + $signed(SumH_0_5) + $signed(SumH_0_6) + $signed(SumH_0_7) + $signed(SumH_0_8) + $signed(SumH_0_9) + $signed(SumH_0_10) + $signed(SumH_0_11) + $signed(SumH_0_12) + $signed(SumH_0_13) + $signed(SumH_0_14) + $signed(SumH_0_15) + $signed(SumH_0_16) + $signed(SumH_0_17) + $signed(SumH_0_18) + $signed(SumH_0_19) + $signed(SumH_0_20) + $signed(SumH_0_21) + $signed(SumH_0_22) + $signed(SumH_0_23) + $signed(SumH_0_24) + $signed(SumH_0_25) + $signed(SumH_0_26) + $signed(SumH_0_27);
            Done_Final_Hidden_Layer <= 0; Next_State <= S_Ex; 
            Ex_H_0_MasterReady <= 0; Rec_H_0_MasterReady <= 0; ADD_H_0_MasterReady <= 0; Fixed_Float_MasterReady <= 1; Float_Fixed_MasterReady <= 0;MUL_MasterReady<= 0;
        end
        
   
        S_Ex : begin
           Done_Final_Hidden_Layer <= 0; Next_State <= S_ADD; 
           // First Neuron
           Final_Sum <= $signed(Bias) + $signed(SumH_0_0) + $signed(SumH_0_1) + $signed(SumH_0_2) + $signed(SumH_0_3) + $signed(SumH_0_4) + $signed(SumH_0_5) + $signed(SumH_0_6) + $signed(SumH_0_7) + $signed(SumH_0_8) + $signed(SumH_0_9) + $signed(SumH_0_10) + $signed(SumH_0_11) + $signed(SumH_0_12) + $signed(SumH_0_13) + $signed(SumH_0_14) + $signed(SumH_0_15) + $signed(SumH_0_16) + $signed(SumH_0_17) + $signed(SumH_0_18) + $signed(SumH_0_19) + $signed(SumH_0_20) + $signed(SumH_0_21) + $signed(SumH_0_22) + $signed(SumH_0_23) + $signed(SumH_0_24) + $signed(SumH_0_25) + $signed(SumH_0_26) + $signed(SumH_0_27);
             Ex_H_0_MasterReady <= 1; Rec_H_0_MasterReady <= 0; ADD_H_0_MasterReady <= 0; Fixed_Float_MasterReady <= 0; Float_Fixed_MasterReady <= 0;MUL_MasterReady<= 0;
        end
        
        S_ADD : begin
           Done_Final_Hidden_Layer <= 0; Next_State <= S_Rec;
           // First Neuron
           Ex_H_0_MasterReady <= 0; Rec_H_0_MasterReady <= 0; ADD_H_0_MasterReady <= 1;Fixed_Float_MasterReady <= 0; Float_Fixed_MasterReady <= 0;MUL_MasterReady<= 0;
            Final_Sum <= $signed(Bias) + $signed(SumH_0_0) + $signed(SumH_0_1) + $signed(SumH_0_2) + $signed(SumH_0_3) + $signed(SumH_0_4) + $signed(SumH_0_5) + $signed(SumH_0_6) + $signed(SumH_0_7) + $signed(SumH_0_8) + $signed(SumH_0_9) + $signed(SumH_0_10) + $signed(SumH_0_11) + $signed(SumH_0_12) + $signed(SumH_0_13) + $signed(SumH_0_14) + $signed(SumH_0_15) + $signed(SumH_0_16) + $signed(SumH_0_17) + $signed(SumH_0_18) + $signed(SumH_0_19) + $signed(SumH_0_20) + $signed(SumH_0_21) + $signed(SumH_0_22) + $signed(SumH_0_23) + $signed(SumH_0_24) + $signed(SumH_0_25) + $signed(SumH_0_26) + $signed(SumH_0_27);
        end
        
        S_Rec : begin
           Done_Final_Hidden_Layer <=0; Next_State <= S_Float_Fixed; 
           // First Neuron
            Ex_H_0_MasterReady <= 0; Rec_H_0_MasterReady <= 1; ADD_H_0_MasterReady <= 0;Fixed_Float_MasterReady <= 0; Float_Fixed_MasterReady <= 0;MUL_MasterReady<= 0;
           Final_Sum <= $signed(Bias) + $signed(SumH_0_0) + $signed(SumH_0_1) + $signed(SumH_0_2) + $signed(SumH_0_3) + $signed(SumH_0_4) + $signed(SumH_0_5) + $signed(SumH_0_6) + $signed(SumH_0_7) + $signed(SumH_0_8) + $signed(SumH_0_9) + $signed(SumH_0_10) + $signed(SumH_0_11) + $signed(SumH_0_12) + $signed(SumH_0_13) + $signed(SumH_0_14) + $signed(SumH_0_15) + $signed(SumH_0_16) + $signed(SumH_0_17) + $signed(SumH_0_18) + $signed(SumH_0_19) + $signed(SumH_0_20) + $signed(SumH_0_21) + $signed(SumH_0_22) + $signed(SumH_0_23) + $signed(SumH_0_24) + $signed(SumH_0_25) + $signed(SumH_0_26) + $signed(SumH_0_27);
        end  
        
        S_Float_Fixed : begin
            Done_Final_Hidden_Layer <= 1; Next_State <= S_Wait; 
             Ex_H_0_MasterReady <= 0; Rec_H_0_MasterReady <= 0; ADD_H_0_MasterReady <= 0; Float_Fixed_MasterReady <= 1;Fixed_Float_MasterReady <= 0;MUL_MasterReady<= 0;
            Final_Sum <= $signed(Bias) + $signed(SumH_0_0) + $signed(SumH_0_1) + $signed(SumH_0_2) + $signed(SumH_0_3) + $signed(SumH_0_4) + $signed(SumH_0_5) + $signed(SumH_0_6) + $signed(SumH_0_7) + $signed(SumH_0_8) + $signed(SumH_0_9) + $signed(SumH_0_10) + $signed(SumH_0_11) + $signed(SumH_0_12) + $signed(SumH_0_13) + $signed(SumH_0_14) + $signed(SumH_0_15) + $signed(SumH_0_16) + $signed(SumH_0_17) + $signed(SumH_0_18) + $signed(SumH_0_19) + $signed(SumH_0_20) + $signed(SumH_0_21) + $signed(SumH_0_22) + $signed(SumH_0_23) + $signed(SumH_0_24) + $signed(SumH_0_25) + $signed(SumH_0_26) + $signed(SumH_0_27);
        end
        default : begin
            Next_State <= S_Wait;
            Done_Final_Hidden_Layer <= 0;
            Ex_H_0_MasterReady <= 0; Rec_H_0_MasterReady <= 0; ADD_H_0_MasterReady <= 0;
            Fixed_Float_MasterReady <= 0; Float_Fixed_MasterReady <= 0;MUL_MasterReady<= 0;
            Final_Sum <= 64'd0;
        end
    endcase
end

assign Div_FinalSum = ($signed(Final_Sum) / (4096*256))* ($signed(-1));

endmodule
