`timescale 1ns / 1ps
module top_carry_select_adder(

    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout
);

 wire [3:0] sum0, sum1;
  wire cout0, cout1;

// Lower 2 bits:  Ripple Carry Adder form
 full_adder fa0(.A(A[0]), .B(B[0]), .Cin(Cin), .Sum(Sum[0]), .Cout(c1));
 full_adder fa1(.A(A[1]), .B(B[1]), .Cin(c1), .Sum(Sum[1]), .Cout(c2));

 // Upper 2 bits: Two adders, one assuming Cin=0, another assuming Cin=1
 full_adder fa2_0(.A(A[2]), .B(B[2]), .Cin(1'b0), .Sum(sum0[2]), .Cout(c3_0));
 full_adder fa3_0(.A(A[3]), .B(B[3]), .Cin(c3_0), .Sum(sum0[3]), .Cout(cout0));

  full_adder fa2_1(.A(A[2]), .B(B[2]), .Cin(1'b1), .Sum(sum1[2]), .Cout(c3_1));
  full_adder fa3_1(.A(A[3]), .B(B[3]), .Cin(c3_1), .Sum(sum1[3]), .Cout(cout1));

 // Multiplexer to select the correct sum and carry out based on c2
 assign Sum[3:2] = c2 ? sum1[3:2] : sum0[3:2];
 assign Cout = c2 ? cout1 : cout0;

endmodule

// Full Adder module
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
