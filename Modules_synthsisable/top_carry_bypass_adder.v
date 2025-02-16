`timescale 1ns / 1ps
module top_carry_bypass_adder(
    input [15:0] A,
    input [15:0] B,
    input Cin,
    output [15:0] Sum,
    output Cout
);

    wire [3:0] carry;
    wire [3:0] bypass;

    // Instantiate four 4-bit carry-bypass blocks
carry_bypass_block block0(.A(A[3:0]), .B(B[3:0]), .Cin(Cin), .Sum(Sum[3:0]), .Cout(carry[0]), .Bypass(bypass[0]));
carry_bypass_block block1(.A(A[7:4]), .B(B[7:4]), .Cin(carry[0]), .Sum(Sum[7:4]), .Cout(carry[1]), .Bypass(bypass[1]));
carry_bypass_block block2(.A(A[11:8]), .B(B[11:8]), .Cin(carry[1]), .Sum(Sum[11:8]), .Cout(carry[2]), .Bypass(bypass[2]));
carry_bypass_block block3(.A(A[15:12]), .B(B[15:12]), .Cin(carry[2]), .Sum(Sum[15:12]), .Cout(carry[3]), .Bypass(bypass[3]));

    // Final carry-out logic
 assign Cout = (bypass[3] & bypass[2] & bypass[1] & bypass[0] & Cin) | (bypass[3] & bypass[2] & bypass[1] & carry[0]) |(bypass[3] & bypass[2] & carry[1]) |
                (bypass[3] & carry[2]) |
                  carry[3];

endmodule

module carry_bypass_block(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout,
    output Bypass
);

    wire [3:0] P;
    wire [4:0] C;

    assign C[0] = Cin;

    // Generate propagate signals
    assign P = A ^ B;

    // Ripple carry adder
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : gen_full_adders
            full_adder fa(
                .A(A[i]),
                .B(B[i]),
                .Cin(C[i]),
                .Sum(Sum[i]),
                .Cout(C[i+1])
            );
        end
    endgenerate

    // Bypass logic
    assign Bypass = &P;
    assign Cout = Bypass ? Cin : C[4];

endmodule

module full_adder(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);
    assign Sum = A ^ B ^ Cin;
    assign Cout = (A & B) | (Cin & (A ^ B));
endmodule
