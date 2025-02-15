`timescale 1ns / 1ps



module top_FOUR_bit_FA(
 input [3:0] A, B,
    input Ci,
    output [3:0] S,
    output Co
);
    wire c1, c2, c3;

 adder FA0(.X(A[0]), .Y(B[0]), .Ci(Ci), .S(S[0]), .Co(c1));
 adder FA1(.X(A[1]), .Y(B[1]), .Ci(c1), .S(S[1]), .Co(c2));
 adder FA2(.X(A[2]), .Y(B[2]), .Ci(c2), .S(S[2]), .Co(c3));
  adder FA3(.X(A[3]), .Y(B[3]), .Ci(c3), .S(S[3]), .Co(Co));
endmodule

module adder(
input X, Y, Ci,
output S, Co
);
wire w1, w2, w3;

 xor G1(w1, X, Y);
xor G2(S, w1, Ci);
and G3(w2, w1, Ci);
 and G4(w3, X, Y);
or G5(Co, w2, w3);
endmodule