`timescale 1ns / 1ps


module top_moore_fsm(
    input d, clk, reset,
    output reg y
);

localparam [3:0] S0=0, S1=1, S2=2, S3=3, S4=4, S5=5, S6=6, S7=7, S8=8;
reg [3:0] state, next;

always @(posedge clk or negedge reset)
    state <= !reset ? S0 : next;

always @(*) begin
    next = S0;
    case(state)
        S0: next = d ? S1 : S6;
        S1: next = d ? S1 : S2;
        S2: next = d ? S3 : S6;
        S3: next = d ? S4 : S2;
        S4: next = d ? S1 : S5;
        S5: next = d ? S3 : S6;
        S6: next = d ? S7 : S6;
        S7: next = d ? S8 : S2;
        S8: next = d ? S1 : S5;
    endcase
end

always @(*)
case (state)
S0: y=0;
S1: y=0;
S2: y=0;
S3: y=0;
S4: y=1;
S5: y=1;
S6: y=0;
S7: y=0;
S8:y=0;
default: y=0;
endcase

endmodule
