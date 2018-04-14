`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2018 09:14:21 PM
// Design Name: 
// Module Name: buffer
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


module buffer(write_data, w_en, clk, clr, ready, read_data);

    parameter BUFFER_SIZE = 784;
    
    input [7:0] write_data;
    input w_en, clk, clr, ready;
    //input [9:0] address;
    
    output reg [7:0] read_data;
    
    reg [7:0] data [0:BUFFER_SIZE - 1];
    reg [9:0] curr_index; // The index to write to in the buffer
    reg [9:0] read_address;
    
    integer i;
    
    initial begin
        for (i = 0; i < BUFFER_SIZE; i = i + 1) begin
            data[i] <= 8'd0;
        end
        curr_index = 0;
        read_address = 0;
        read_data <= 0;
    end
    
    always@(posedge clk) begin
        if (!clr && w_en && curr_index < BUFFER_SIZE) begin
            data[curr_index] <= write_data;
            curr_index <= curr_index + 1;
        end
        if (!clr && ready && read_address < BUFFER_SIZE) begin
            read_data = data[read_address];
            read_address = read_address + 1;
        end
        else
            read_data = 0;
    end
    
    always@(clr, ready) begin
        if (clr) begin
            for (i = 0; i < BUFFER_SIZE; i = i + 1) begin
               data[i] = 0;
             end
               curr_index = 0;
               read_address = 0;
        end
        else if (ready) begin
            read_data = data[read_address];
            read_address = read_address + 1;
        end
    end
endmodule
