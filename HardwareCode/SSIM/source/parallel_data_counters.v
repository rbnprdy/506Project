`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2018 06:51:33 PM
// Design Name: 
// Module Name: parallel_data_counters
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


module parallel_data_counters #(parameter NUM_INPUTS = 28 - 1)(
clk, clr,
in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, 
in15, in16, in17, in18, in19, in20, in21, in22, in23, in24, in25, in26, in27, in28, 
ready1, ready2, ready3, ready4, ready5, ready6, ready7,
ready8, ready9, ready10, ready11, ready12, ready13, ready14,
ready15, ready16, ready17, ready18, ready19, ready20, ready21,
ready22, ready23, ready24, ready25, ready26, ready27, ready28,
out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, 
out15, out16, out17, out18, out19, out20, out21, out22, out23, out24, out25, out26, out27, out28,
done1, done2, done3, done4, done5, done6, done7,done8, done9, done10, done11, done12, done13, done14,
done15, done16, done17, done18, done19, done20, done21, done22, done23, done24, done25, done26, done27, done28
);

    input clk, clr;
    
    input [31:0] in1, in2, in3, in4, in5, in6, in7;
    input [31:0] in8, in9, in10, in11, in12, in13, in14;
    input [31:0] in15, in16, in17, in18, in19, in20, in21;
    input [31:0] in22, in23, in24, in25, in26, in27, in28;

    input ready1, ready2, ready3, ready4, ready5, ready6, ready7;
    input ready8, ready9, ready10, ready11, ready12, ready13, ready14;
    input ready15, ready16, ready17, ready18, ready19, ready20, ready21;
    input ready22, ready23, ready24, ready25, ready26, ready27, ready28;
    
    output [31:0] out1, out2, out3, out4, out5, out6, out7;
    output [31:0] out8, out9, out10, out11, out12, out13, out14;
    output [31:0] out15, out16, out17, out18, out19, out20, out21;
    output [31:0] out22, out23, out24, out25, out26, out27, out28;
    
    output done1, done2, done3, done4, done5, done6, done7;
    output done8, done9, done10, done11, done12, done13, done14;
    output done15, done16, done17, done18, done19, done20, done21;
    output done22, done23, done24, done25, done26, done27, done28;    
    
    data_counter #(.NUM(NUM_INPUTS)) d1 (
        .in(in1),
        .clk(clk),
        .ready(ready1),
        .clr(clr),
        .out(out1),
        .done(done1)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d2 (
        .in(in2),
        .clk(clk),
        .ready(ready2),
        .clr(clr),
        .out(out2),
        .done(done2)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d3 (
        .in(in3),
        .clk(clk),
        .ready(ready3),
        .clr(clr),
        .out(out3),
        .done(done3)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d4 (
        .in(in4),
        .clk(clk),
        .ready(ready4),
        .clr(clr),
        .out(out4),
        .done(done4)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d5 (
        .in(in5),
        .clk(clk),
        .ready(ready5),
        .clr(clr),
        .out(out5),
        .done(done5)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d6 (
        .in(in6),
        .clk(clk),
        .ready(ready6),
        .clr(clr),
        .out(out6),
        .done(done6)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d7 (
        .in(in7),
        .clk(clk),
        .ready(ready7),
        .clr(clr),
        .out(out7),
        .done(done7)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d8 (
        .in(in8),
        .clk(clk),
        .ready(ready8),
        .clr(clr),
        .out(out8),
        .done(done8)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d9 (
        .in(in9),
        .clk(clk),
        .ready(ready9),
        .clr(clr),
        .out(out9),
        .done(done9)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d10 (
        .in(in10),
        .clk(clk),
        .ready(ready10),
        .clr(clr),
        .out(out10),
        .done(done10)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d11 (
        .in(in11),
        .clk(clk),
        .ready(ready11),
        .clr(clr),
        .out(out11),
        .done(done11)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d12 (
        .in(in12),
        .clk(clk),
        .ready(ready12),
        .clr(clr),
        .out(out12),
        .done(done12)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d13 (
        .in(in13),
        .clk(clk),
        .ready(ready13),
        .clr(clr),
        .out(out13),
        .done(done13)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d14 (
        .in(in14),
        .clk(clk),
        .ready(ready14),
        .clr(clr),
        .out(out14),
        .done(done14)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d15 (
        .in(in15),
        .clk(clk),
        .ready(ready15),
        .clr(clr),
        .out(out15),
        .done(done15)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d16 (
        .in(in16),
        .clk(clk),
        .ready(ready16),
        .clr(clr),
        .out(out16),
        .done(done16)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d17 (
        .in(in17),
        .clk(clk),
        .ready(ready17),
        .clr(clr),
        .out(out17),
        .done(done17)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d18 (
        .in(in18),
        .clk(clk),
        .ready(ready18),
        .clr(clr),
        .out(out18),
        .done(done18)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d19 (
        .in(in19),
        .clk(clk),
        .ready(ready19),
        .clr(clr),
        .out(out19),
        .done(done19)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d20 (
        .in(in20),
        .clk(clk),
        .ready(ready20),
        .clr(clr),
        .out(out20),
        .done(done20)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d21 (
        .in(in21),
        .clk(clk),
        .ready(ready21),
        .clr(clr),
        .out(out21),
        .done(done21)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d22 (
        .in(in22),
        .clk(clk),
        .ready(ready22),
        .clr(clr),
        .out(out22),
        .done(done22)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d23 (
        .in(in23),
        .clk(clk),
        .ready(ready23),
        .clr(clr),
        .out(out23),
        .done(done23)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d24 (
        .in(in24),
        .clk(clk),
        .ready(ready24),
        .clr(clr),
        .out(out24),
        .done(done24)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d25 (
        .in(in25),
        .clk(clk),
        .ready(ready25),
        .clr(clr),
        .out(out25),
        .done(done25)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d26 (
        .in(in26),
        .clk(clk),
        .ready(ready26),
        .clr(clr),
        .out(out26),
        .done(done26)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d27 (
        .in(in27),
        .clk(clk),
        .ready(ready27),
        .clr(clr),
        .out(out27),
        .done(done27)
    );
     
    data_counter #(.NUM(NUM_INPUTS)) d28 (
        .in(in28),
        .clk(clk),
        .ready(ready28),
        .clr(clr),
        .out(out28),
        .done(done28)
    );

endmodule
