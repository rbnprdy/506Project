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


module Image_BRAM_18(ADDR,DI,EN,WE,CLK,DO);
input [7:0] ADDR;
input [7:0] DI;
input EN,WE;
input CLK;
output reg [7:0]DO;
(* ram_style = "block" *) reg [7:0]Image_Memory[0:168];
    always @(negedge CLK) begin      
        if (EN==1) begin
            if (WE == 1) begin
                Image_Memory[ADDR] = DI;
            end
            else begin
                DO <= Image_Memory[ADDR];
            end
        end   
    end
    
 
    initial begin
	    $readmemh("Image_18.txt", Image_Memory, 0, 168);
    end

endmodule
