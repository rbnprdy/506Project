`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2018 08:57:30 PM
// Design Name: 
// Module Name: AGU
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


module AGU(Clk, Rst, Data_Request, W_Add, Pix_Add, Data_Ready, Done, W_En , Pix_En, Controller_Data_Request);
input Clk, Rst;
input Data_Request;
output reg Data_Ready;
output reg [7:0] Pix_Add;
output reg [4:0] W_Add;
output reg Done;
output reg W_En, Pix_En;
input Controller_Data_Request;
reg [1:0] State; 
parameter S_Wait = 0, S_One = 1, S_Done = 2;
always @(   posedge Clk) begin
    if (Rst == 1) begin
        Pix_Add <= 7'd0;
        W_Add <= 5'd0;
        Data_Ready <= 0;
        W_En <= 0;
        Pix_En <= 0;
        Done <= 0;
        State <= S_Wait;
    end
    else begin
        case (State)
            S_Wait : begin
                Data_Ready <= 0;
                W_En <= 0;
                Pix_En <= 0;
                Done <= 0;
                if (Data_Request)  begin
                    State <= S_One;
                end  
                else begin
                    State <= S_Wait;
                end
            end
            S_One : begin
                if (W_Add != 5'd28) begin
                    W_Add <= W_Add + 1;
                    Pix_Add <= Pix_Add + 1;
                    Data_Ready <= 1;
                    W_En <= 1;
                    Pix_En <= 1;
                    State <= S_One;
                    Done <= 0;
                end
                else begin
                    State <= S_Done;
                    Done <= 1;
                    Data_Ready <= 0;
                    W_En <= 0;
                    Pix_En <= 0;
                end
            end
            S_Done: begin
                if (Controller_Data_Request) begin
                  W_Add <= 4'd0; 
                  Done <= 0; 
                  State <= S_One;
                end
                else begin
                    State <= S_Done;
                    Done <= 1;
                end
                W_En <= 0;
                Pix_En <= 0;
            end
        endcase
    end
end
endmodule
