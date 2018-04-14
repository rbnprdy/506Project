`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// counter.v
// Created by Ruben Purdy on 04/05/2018 10:39:03 PM
//////////////////////////////////////////////////////////////////////////////////

/*
    Counts to a value and then raises a `done` flag when value is reached.
    
    - inputs: 
        - clk: The clock.
        - rst: A synchronous reset signal.
        - start: Raise to begin counting.
    - outputs:
        - done: Indicates whether the counting value has been reached.
    - parameters:
        - NUM: The number to count to.
*/
module counter #(parameter NUM = 784)(clk, rst, start, done);

    //input [31:0] in;
    input clk, rst, start;
    output reg done;
    
    reg [9:0] count;
    
    initial begin
        count <= 0;
        done <= 0;
    end

    always@(posedge clk) begin
        // clear on reset
        if (rst) begin
            count <= 0;
            done <= 0;
        end
        // increment counter if we're less than NUM
        if (start && !rst && count <= NUM)
            count = count + 1;
        // raise `done` flag if we're greater than or equal to NUM
        if (count >= NUM) 
            done = 1;
    end
    
endmodule
