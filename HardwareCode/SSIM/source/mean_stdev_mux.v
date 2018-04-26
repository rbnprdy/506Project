`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2018 09:53:15 AM
// Design Name: 
// Module Name: mean_stdev_mux
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


module mean_stdev_mux(sel, mean, stdev);

    input [3:0] sel;
    output reg [31:0] mean, stdev;

    always@(*) begin
        case(sel)
            0: begin
                mean <= 32'h42304925;
                stdev <= 32'h4273bdf4;
            end
            1: begin
                mean <= 32'h4199de0a;
                stdev <= 32'h42338d17;
            end
            2: begin
                mean <= 32'h42168bc1;
                stdev <= 32'h424eeecd;
            end
            3: begin
                mean <= 32'h420f8e5e;
                stdev <= 32'h4254c90d;
            end
            4: begin
                mean <= 32'h41f62c68;
                stdev <= 32'h42427a92;
            end
            5: begin
                mean <= 32'h4201c29d;
                stdev <= 32'h42342497;
            end
            6: begin
                mean <= 32'h420b1249;
                stdev <= 32'h42558c8a;
            end
            7: begin
                mean <= 32'h41e85634;
                stdev <= 32'h4244f708;
            end
            8: begin
                mean <= 32'h4218bac7;
                stdev <= 32'h425e62e3;
            end
            9: begin
                mean <= 32'h41f87054;
                stdev <= 32'h424ba924;
            end
        endcase
    end

endmodule
