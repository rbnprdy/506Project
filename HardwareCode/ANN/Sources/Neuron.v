`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2018 11:49:56 PM
// Design Name: 
// Module Name: Neuron
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


module Neuron (Pix, Weight, Sum, Clk, Rst, Data_Ready, Request_Data, Done, Done_Hidden_Layer);
input Clk, Rst;
input [7:0] Pix;
wire signed [8:0] Signed_Pix;
input signed [15:0] Weight;
input Data_Ready;
output  reg signed[31:0] Sum;
output reg Request_Data;
input Done;
output reg Done_Hidden_Layer;
reg signed [31:0] PartialSum;
reg signed [31:0] P;
reg signed [31:0] Temp= 32'd0;
reg [1:0] State, Next_State;
parameter Wait = 0, Enable_MUL = 1, S_Done_Hidden = 2 ;
assign Signed_Pix = {1'b0, Pix};
always @(posedge Clk) begin
    if (Rst == 1) begin
        State <= Wait;
        Temp <= 80'd0;
    end
    else begin
        State <= Next_State;
        Temp <= $signed (PartialSum)  + $signed(Temp) ;
    end
end
always @(*) begin
    case (State) 
        Wait : begin
            Done_Hidden_Layer <= 0;
            PartialSum <= 32'd0;
            P <= 80'd0;
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
            Done_Hidden_Layer <= 0;
            PartialSum <= P;
            Request_Data <= 0;
            P <= $signed(Signed_Pix)* $signed(Weight);
            if (Done != 1) begin
                Next_State <= Enable_MUL; 
            end
            else begin
                Next_State <= S_Done_Hidden;
            end
        end  
        S_Done_Hidden : begin
           PartialSum <= 32'd0;
           Done_Hidden_Layer <= 1;
           Next_State <= Wait; 
           Request_Data <= 0;
           P <= PartialSum;
        end 
 
        default : begin
           Done_Hidden_Layer <= 0;
           Next_State <= Wait; 
           Request_Data <= 0;
           PartialSum <= 32'd0;
           P <= 32'd0;
        end 
    endcase
end

always @(posedge Clk) begin
    if (Rst ==1) begin
        Sum <= 32'd0;
    end
    else if (Done_Hidden_Layer) begin
        Sum <= Temp;
    end
end 
endmodule
