`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// input_mem.v
// Created by Ruben Purdy on 04/05/2018 11:06:36 PM
//////////////////////////////////////////////////////////////////////////////////

/*
    Input memory for the image that is currently being classified. Will read out the next data sequentially each clock cycle until it reaches the end of the data.
    
    - inputs: 
        - clk: The clock.
        - rst: A synchronous reset signal.
        - start: Indicates when the memory should begin reading out values.
    - outputs:
        - valid: Indicates whether the out data is valid.
        - [7:0] out: The current output value.
*/
module input_mem(clk, rst, start, valid, out);

    input clk, rst, start;
    output reg valid;
    output reg [7:0] out;
    
    reg [7:0] memory [0:783];
    reg [9:0] address;
    
    initial begin
        address = 0;
        valid = 0;
        out = 0;
        $readmemh("input.txt", memory);
    end
    
    always@(posedge clk) begin
        // if we're not resetting and we should start
        if (!rst && start) begin
            // indicate that the data is valid
            valid = 1;
            // if we're not at the last memory location, output the new data and then increment address
            if (address < 784) begin
                out = memory[address];
                address = address + 1;
            end
            else
                out = 0;
        end
    end
endmodule
