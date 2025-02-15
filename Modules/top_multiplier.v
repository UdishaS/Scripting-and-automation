`timescale 1ns / 1ps
module multiplier(
    input [3:0] A,
    input [3:0] B,
    output [7:0] P
);

wire [3:0] pp0, pp1, pp2, pp3;
wire [5:0] sum1, sum2;
wire [7:0] sum3;

    // Generate partial products
assign pp0 = A & {4{B[0]}};
assign pp1 = A & {4{B[1]}};
assign pp2 = A & {4{B[2]}};
assign pp3 = A & {4{B[3]}};

    // First stage addition
assign sum1 = pp0 + (pp1 << 1);

    // Second stage addition
assign sum2 = sum1[5:2] + pp2;

    // Final stage addition
assign sum3 = {sum2, sum1[1:0]} + (pp3 << 3);

    // Assign final product
assign P = sum3;

endmodule
