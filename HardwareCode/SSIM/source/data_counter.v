`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// data_counter.v
// Created by Ruben Purdy on 04/03/2018 07:35:54 PM
//////////////////////////////////////////////////////////////////////////////////

/*
    Feeds data through up until num, at which point it starts feeding out 0's.
    
    - inputs:
        - [BIT_WIDTH - 1:0] in: The input data, whose bit width is specified by the BIT_WIDTH parameter.
        - clk: The clock.
        - ready: Indicates whether counting should begin.
        - clr: A asynchronous clear singal.
    - outputs:
        - [BIT_WIDTH - 1:0] out: The output value, whose bit width is specified by the BIT_WIDTH parameter.
        - done: Indicates whether the final value has been reached.
    - parameters:
        - BIT_WIDTH: The number of bits of the input values. Defaults to 32.
        - NUM: The number to count to. Defaults to 784.
*/
module data_counter #(parameter BIT_WIDTH = 32, NUM = 784)(in, clk, ready, clr, out, done);
    input [BIT_WIDTH - 1:0] in;
    input clk, ready, clr;
    output reg [BIT_WIDTH - 1:0] out;
    output reg done;
    
    reg [BIT_WIDTH - 1:0] curr = 0;
    
    initial begin
        out <= 0;
        done <= 0;
    end
    
    always@(posedge clk) begin
        if (clr) begin
            curr <= 0;
            done <= 0;
        end
        else if (curr >= NUM - 1) begin
            done = 1;
        end
        else if (ready && !clr)
            curr = curr + 1;
    end
    
    always@(in, done, clr) begin
        if (!done && !clr)
            out <= in;
        else
            out <= 0;
    end    
endmodule
