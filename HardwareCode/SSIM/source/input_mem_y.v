`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// input_mem_y.v
// Created by Ruben Purdy on 04/12/2018 10:29:45 PM
//////////////////////////////////////////////////////////////////////////////////

/*
    Input memory for each pixel subtracted by the mean value of the average of the training data.
    
    - inputs: 
        - clk: The clock.
        - rst: A synchronous reset signal.
        - start: Indicates when the memory should begin reading out values.
    - outputs:
        - valid: Indicates whether the out data is valid.
        - [31:0] out: The current output value in floating point form.
*/
module input_mem_y(clk, rst, start, valid, out);

    input clk, rst, start;
    output reg valid;
    output reg [31:0] out;
    
    reg [31:0] memory [0:783];
    reg [9:0] address;
    
    initial begin
        address = 0;
        valid = 0;
        out = 0;
        $readmemh("input_y.txt", memory);
    end

    always@(posedge clk) begin
        // if we're not resetting and start is high
        if (!rst && start) begin
            // show that the data is valid
            valid = 1;
            // if we're not on the last memory location, output the new data and then increment address
            if (address < 783) begin
                out = memory[address];
                address = address + 1;
            end
        end
    end
endmodule
