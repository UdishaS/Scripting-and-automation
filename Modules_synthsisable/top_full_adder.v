`timescale 1ns / 1ps
module top_full_adder(

    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    wire w1, w2, w3, w4;
    xor xor1 (w1, a, b);
    xor xor2 (sum, w1, cin);

    and and1 (w2, a, b);
    and and2 (w3, b, cin);
    and and3 (w4, a, cin);
    or or1 (cout, w2, w3, w4);

endmodule
