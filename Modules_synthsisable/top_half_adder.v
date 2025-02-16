`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2025 03:08:05
// Design Name: 
// Module Name: top_half_adder
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


module top_half_adder(

    input a,
    input b,
    output sum,
    output carry
);

   
    xor xor_gate (sum, a, b);
    and and_gate (carry, a, b);

endmodule
