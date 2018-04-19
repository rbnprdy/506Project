`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// buffer.v
// Created by Ruben Purdy on 04/04/2018 09:14:21 PM
//////////////////////////////////////////////////////////////////////////////////

/*
    A data buffer with synchronous writes and reads. After ready is set to 1, the buffer reads out values
    sequentially until it reaches the end of the buffer, at which point it outputs 0.
    
    - inputs:
        - [7:0] write_data: The 8 bit data to write to the current buffer address.
        - w_en: A write enable flag.
        - clk: The clock.
        - clr: A synchronous clear.
        - ready: Indicates whether the buffer should begin reading out values.
    - outputs:
        - [7:0] read_data: The 8 bit read data.
        - read_data_valid: Indicates whether the current read data is valid.
*/
module buffer(write_data, w_en, clk, clr, ready, read_data, read_data_valid);

    parameter BUFFER_SIZE = 784;
    
    input [7:0] write_data;
    input w_en, clk, clr, ready;
    
    output reg [7:0] read_data;
    output reg read_data_valid;
    
    reg [7:0] data [0:BUFFER_SIZE - 1];
    reg [9:0] curr_index; // The index to write to in the buffer
    reg [9:0] read_address;
    
    integer i;
    
    initial begin
        for (i = 0; i < BUFFER_SIZE; i = i + 1) begin
            data[i] <= 8'd0;
        end
        curr_index <= 0;
        read_address <= 0;
        read_data <= 0;
        read_data_valid <= 0;
    end
    
    always@(posedge clk) begin
        // if we should clear
        if (clr) begin
            // clear the buffer
            for (i = 0; i < BUFFER_SIZE; i = i + 1) begin
                data[i] = 0;
            end
            // reset the index, address, and valid flag
            curr_index = 0;
            read_address = 0;
            read_data_valid <= 0;
        end
        // if we're writing and we haven't reached the end of the buffer
        if (!clr && w_en && curr_index < BUFFER_SIZE) begin
            // write the data and increment the current index
            data[curr_index] <= write_data;
            curr_index <= curr_index + 1;
        end
        // if we're reading and haven't reached the end of the buffer
        if (!clr && ready && read_address < BUFFER_SIZE) begin
            // indicate that the data is valid, read out the current data and then increment the read address
            read_data_valid <= 1;
            read_data = data[read_address];
            read_address = read_address + 1;
        end
        // if we're reading but have reached the end of the buffer
        else if (ready)
            // output zero
            read_data = 0;
    end
endmodule
