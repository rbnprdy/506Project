`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2018 09:21:53 PM
// Design Name: 
// Module Name: Weigth_0_0_BRAM
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


module Weight_0_19_12_BRAM(ADDR,DI,EN,WE,CLK,DO);
input [4:0] ADDR;
input [15:0] DI;
input EN,WE;
input CLK;
output reg [15:0]DO;
(* ram_style = "block" *) reg [15:0]W_Memory[0:27];
    always @(negedge CLK) begin      
        if (EN==1) begin
            if (WE == 1) begin
                W_Memory[ADDR] = DI;
            end
            else begin
                DO[15:0] <= W_Memory[ADDR];
            end
        end   
    end
    
 
    initial begin
	    $readmemb("weight_0_19_12.txt", W_Memory, 0, 27);
    end

endmodule
