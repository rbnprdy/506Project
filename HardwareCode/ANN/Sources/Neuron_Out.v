`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2018 12:04:00 AM
// Design Name: 
// Module Name: Neuron_Out
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


module Neuron_Out(Pix, Weight, Sum, Clk, Rst, Data_Ready, Request_Data, Done, Done_Hidden_Layer, Bias);
input Clk, Rst;
input signed [15:0] Pix, Weight;
input Data_Ready;
wire signed  [31:0] Result_FP_Mul;
reg signed [31:0] P, PartialSum;
reg signed [31:0] Temp;
wire signed [31:0] Rec_Sum_H_0;
output reg Request_Data;
input Done;
input signed [15:0] Bias;
output reg Done_Hidden_Layer;
wire signed [31:0] Div_Sum;
wire signed [31:0] Float_Sum;
output reg signed [31:0] Sum;
wire signed [31:0] Final_Sum, Result_Negate_Mul, Ex_Sum_H_0,  Incremeant_Ex_Result;
 wire MUL2_SlaveReady_A, MUL2_SlaveValid_A, MUL2_SlaveReady_B, MUL2_SlaveValid_B, MUL2_MasterValid;
reg MUL2_MasterReady;
wire ADD_SlaveReady2_A, ADD_SlaveValid2_A, ADD_SlaveReady2_B, ADD_SlaveValid2_B, ADD_MasterValid2;
reg  ADD_MasterReady2;
wire Ex_SlaveValid, Ex_SlaveReady , Ex_MasterValid;
reg  Ex_MasterReady;

 wire Rec_SlaveValid, Rec_SlaveReady , Rec_MasterValid;
 reg  Rec_MasterReady;

wire Fixed_Float_SlaveReady, Fixed_Float_SlaveValid, Fixed_Float_MasterValid;
reg Fixed_Float_MasterReady;
wire signed [31:0] SignEx_Bias;
assign SignEx_Bias = (Bias[15]== 1) ? ({16'hFFFF, Bias}):({16'h0000, Bias});
reg [2:0] State, Next_State;
parameter Wait = 0, Enable_MUL = 1, S_Fixed_Float = 6, S_Done_Hidden = 2 , S_Ex = 3, S_ADD = 4,  S_Rec = 5;
wire signed [31:0] Temp2;
assign Div_Sum = $signed(Temp) / (4096*1024);
always @(posedge Clk) begin
    if (Rst == 1) begin
        State <= Wait;
    end
    else begin
        State <= Next_State;
    end
end
wire signed [31:0] PWire;
always @(negedge Clk) begin
    if (Rst == 1) begin
        
        Temp <= SignEx_Bias;
    end
    else begin
        Temp <= $signed(P)+ $signed(Temp) ;
    end
end

assign Temp2 = $signed(Temp) * $signed (-1);
        

always @(*) begin
    case (State) 
        Wait : begin
            Done_Hidden_Layer <= 0;
            MUL2_MasterReady <= 0;
            Ex_MasterReady <= 0;
            //Partial_Sum <=  Bias; 
            ADD_MasterReady2 <= 0;
            Rec_MasterReady <= 0;
            Fixed_Float_MasterReady <= 0;
//            PartialSum <= 32'd0;
            P <= 32'd0;
            if (Data_Ready) begin
                Next_State <= Enable_MUL;
                Request_Data <= 0;
            end
            else begin
                Next_State <= Wait;
                Request_Data <= 1;
            end
        end
        Enable_MUL : begin
            ADD_MasterReady2 <= 0;
            Ex_MasterReady <= 0;
            Done_Hidden_Layer <= 0;
            Fixed_Float_MasterReady <= 0;
            Request_Data <= 0;
            Rec_MasterReady <= 0;
            MUL2_MasterReady <= 0;
            PartialSum <= P;
            P <= $signed(Pix ) * $signed(Weight);
            if (Done != 1) begin
                Next_State <= Enable_MUL; 
            end
            else begin
                Next_State <= S_Fixed_Float;
            end
        end  
        S_Fixed_Float : begin
            Rec_MasterReady <= 0;
           Ex_MasterReady <= 0;
           MUL2_MasterReady <= 0;
           Fixed_Float_MasterReady <= 1;
           Done_Hidden_Layer <= 0;
           Next_State <= S_Done_Hidden; 
           Request_Data <= 0;
           PartialSum <= 32'd0;
           P <= 32'd0;
           ADD_MasterReady2 <= 0;
        end
        S_Done_Hidden : begin
           Rec_MasterReady <= 0;
           Ex_MasterReady <= 0;
           MUL2_MasterReady <= 1;
           Done_Hidden_Layer <= 0;
           Next_State <= S_Ex; 
           Request_Data <= 0;
           Fixed_Float_MasterReady <= 0;
           PartialSum <= 32'd0;
           P <= 32'd0;
           ADD_MasterReady2 <= 0;
        end 
        S_Ex : begin
           MUL2_MasterReady <= 0;
           Done_Hidden_Layer <= 0;
           Next_State <= S_ADD; 
           Request_Data <= 0;
           PartialSum <= 32'd0;
           P <= 32'd0;
           Ex_MasterReady <= 1; 
           Rec_MasterReady <= 0;
           ADD_MasterReady2 <= 0;
           
           Fixed_Float_MasterReady <= 0;
        end
        S_ADD : begin
           MUL2_MasterReady <= 0;
           Done_Hidden_Layer <= 0;
           Next_State <= S_Rec; 
           Request_Data <= 0;
           Ex_MasterReady <= 0; 
           PartialSum <= 32'd0;
           P <= 32'd0;
           Rec_MasterReady <= 0;
           ADD_MasterReady2 <= 1;
           Fixed_Float_MasterReady <= 0;
        end
        S_Rec : begin
           MUL2_MasterReady <= 0;
           Done_Hidden_Layer <= 1;
           Next_State <= Wait; 
           Request_Data <= 0;
           PartialSum <= 32'd0;
           P <= 32'd0;
           Ex_MasterReady <= 0;
           Rec_MasterReady <= 1;
           ADD_MasterReady2 <= 0;
           Fixed_Float_MasterReady <= 0;
        end  
        
        default : begin
           MUL2_MasterReady <= 0;
           Done_Hidden_Layer <= 0;
           Next_State <= Wait; 
           Request_Data <= 0;
           PartialSum <= 32'd0;
           P <= 32'd0;
           Ex_MasterReady <= 0;
           Rec_MasterReady <= 0;
           ADD_MasterReady2 <= 0;
           Fixed_Float_MasterReady <= 0;
        end 
    endcase
end
assign MUL2_SlaveValid_A = ( MUL2_MasterValid ) ? 1:0;
assign MUL2_SlaveValid_B = ( MUL2_MasterValid ) ? 1:0;
assign Ex_SlaveValid     = ( Ex_MasterValid ) ? 1:0;
assign Rec_SlaveValid    =( Rec_MasterValid ) ? 1:0;
assign ADD_SlaveValid2_A = ( ADD_MasterValid2 ) ? 1:0;
assign ADD_SlaveValid2_B = ( ADD_MasterValid2 ) ? 1:0;
assign Fixed_Float_SlaveValid = (Fixed_Float_MasterValid) ? 1:0;

Fixed_Float  FF_1( Clk,
    Fixed_Float_SlaveValid,
    Fixed_Float_SlaveReady,
    Div_Sum,
    Fixed_Float_MasterValid,
    Fixed_Float_MasterReady ,
    Float_Sum
  );
 FP_MUL MUL_2(
    Clk,                    //aclk : IN STD_LOGIC;
    MUL2_SlaveValid_A,       //s_axis_a_tvalid : IN STD_LOGIC;
    MUL2_SlaveReady_A,       // : OUT STD_LOGIC;
    Float_Sum,                    //s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    MUL2_SlaveValid_B,       //s_axis_b_tvalid : IN STD_LOGIC;
    MUL2_SlaveReady_B,       //s_axis_b_tready : OUT STD_LOGIC;
    32'hBF800000,                 //s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    MUL2_MasterValid,        //m_axis_result_tvalid : OUT STD_LOGIC;
    MUL2_MasterReady,        //m_axis_result_tready : IN STD_LOGIC;
    Result_Negate_Mul                 //m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
Exponenitial EX( Clk , Ex_SlaveValid , Ex_SlaveReady , Result_Negate_Mul, Ex_MasterValid, Ex_MasterReady, Ex_Sum_H_0 );
FP_ADD ADD2(Clk, ADD_SlaveValid2_A, ADD_SlaveReady2_A, Ex_Sum_H_0, ADD_SlaveValid2_B, ADD_SlaveReady2_B, 32'h3F800000, ADD_MasterValid2, ADD_MasterReady2, Incremeant_Ex_Result);
Reciprocal Rec(Clk, Rec_SlaveValid, Rec_SlaveReady, Incremeant_Ex_Result, Rec_MasterValid, Rec_MasterReady, Rec_Sum_H_0 );
always @(posedge Clk) begin
    if (Rst ==1) begin
        Sum <= 32'd0;
    end
    else if (Done_Hidden_Layer) begin
        Sum <= Rec_Sum_H_0;
    end
end 

endmodule
