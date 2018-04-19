`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// delay_register.v
// Created by Ruben Purdy on 04/19/2018 03:00:13 PM
//////////////////////////////////////////////////////////////////////////////////


module delay_register(clk, clr, in, out);

    input clk, clr, in;
    output reg out;
    
    always@(posedge clk) begin
        out <= in;
    end
endmodule
