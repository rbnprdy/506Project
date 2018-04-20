`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// input_mem.v
// Created by Ruben Purdy on 04/05/2018 11:06:36 PM
//////////////////////////////////////////////////////////////////////////////////

/*
    A customizable input memory that reads from a hex file.
    
    - inputs: 
        - clk: The clock.
        - rst: A synchronous reset signal.
        - start: Indicates when the memory should begin reading out values.
    - outputs:
        - valid: Indicates whether the out data is valid.
        - [7:0] out: The current output value.
    - parameters:
        - FILE_NAME: The name of the file that contains the hex data. Defaults to "input.txt".
        - DATA_BIT_WIDTH: The bit width of each entry. Defaults to 32.
        - NUM_ENTRIES: The number of entries in the memory. Defaults to 784.
        - ADDRESS_BIT_WIDTH: The bit width of the address used to index into the memory. Should be ceil(log2(NUM_ENTRIES)). Defaults to 10.
*/
module input_mem #(parameter FILE_NAME = "input.txt", DATA_BIT_WIDTH = 32, NUM_ENTRIES = 784, ADDRESS_BIT_WIDTH = 10)(clk, rst, start_a, start_b, valid_a, valid_b, out_a, out_b);

    input clk, rst, start_a, start_b;
    output reg valid_a, valid_b;
    output reg [DATA_BIT_WIDTH - 1:0] out_a, out_b;
    
    reg [DATA_BIT_WIDTH - 1:0] memory [0:NUM_ENTRIES - 1];
    reg [ADDRESS_BIT_WIDTH - 1:0] address_a, address_b;
    
    initial begin
        address_a = 0;
        address_b = 0;
        valid_a = 0;
        valid_b = 0;
        out_a = 0;
        out_b = 0;
        $readmemh(FILE_NAME, memory);
    end
    
    always@(posedge clk) begin
        // if we're not resetting and we should start the a port
        if (rst) begin
            address_a = 0;
            address_b = 0;
            valid_a = 0;
            valid_b = 0;
            out_a = 0;
            out_b = 0;
        end
        else if (start_a || start_b) begin
            if (start_a) begin
                // indicate that the data is valid
                valid_a = 1;
                // if we're not at the last memory location, output the new data and then increment address
                if (address_a < NUM_ENTRIES) begin
                    out_a = memory[address_a];
                    address_a = address_a + 1;
                end
                else
                    out_a = 0;
            end
            if (start_b) begin
                // indicate that the data is valid
                valid_b = 1;
                // if we're not at the last memory location, output the new data and then increment address
                if (address_b < NUM_ENTRIES) begin
                    out_b = memory[address_b];
                    address_b = address_b + 1;
                end
                else
                    out_b = 0;
            end
        end
    end
endmodule
