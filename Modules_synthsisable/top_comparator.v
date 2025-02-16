`timescale 1ns / 1ps
module top_comparator(
    input [7:0] A,
    input [7:0] B,
    output reg [7:0] A_gt_B,
    output reg [7:0] A_lt_B,
    output reg [7:0] A_equal_B
);
    always @(*) begin

        if (A < B) begin
            A_gt_B = 0;
            A_lt_B = 1;
            A_equal_B = 0;

        end else if (A > B) begin
            A_gt_B = 1;
            A_lt_B = 0;
            A_equal_B = 0;

        end else begin
            A_gt_B = 0;
            A_lt_B = 0;
            A_equal_B = 1;

        end

    end

endmodule

