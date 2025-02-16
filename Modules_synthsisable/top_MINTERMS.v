`timescale 1ns / 1ps

module top_MINTERMS(
  input a, b, c, d,
    output f
);
 wire w1, w2, w3, w4, w5, w6, w7;

// Minterms
and(w1, ~a, ~b, ~c, ~d);  // m0
and(w2, ~a, ~b, c, ~d);   // m2
and(w3, ~a, c, ~d, b);    // m5
and(w4, a, ~b, ~c, d);    // m9
and(w5, a, ~b, c, d);     // m11
and(w6, a, b, ~c, d);     // m13
and(w7, a, b, c, d);      // m15
// OR all minterms
or(f, w1, w2, w3, w4, w5, w6, w7);

endmodule
