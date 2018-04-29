`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2018 09:37:40 PM
// Design Name: 
// Module Name: Weigth_0_1_BRAM
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


module Image_BRAM_19(ADDR,DI,EN,WE,CLK,DO);
input [7:0] ADDR;
input [7:0] DI;
input EN,WE;
input CLK;
output reg [7:0]DO;
(* ram_style = "block" *) reg [7:0]W_Memory[0:168];
    always @(negedge CLK) begin      
        if (EN==1) begin
            if (WE == 1) begin
                W_Memory[ADDR] = DI;
            end
            else begin
                DO <= W_Memory[ADDR];
            end
        end   
    end
    
 
    initial begin
	    $readmemh("Image_19.txt", W_Memory, 0, 168);
    end

endmodule
