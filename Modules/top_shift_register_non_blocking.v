`timescale 1ns / 1ps
module top_shift_register_non_blocking(


    input clk,
    input reset,
    input data_in,
    output [3:0] data_out
);
    reg [3:0] shift_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= 4'b0000;
        end else begin
            shift_reg[3] <= shift_reg[2];
            shift_reg[2] <= shift_reg[1];
            shift_reg[1] <= shift_reg[0];
            shift_reg[0] <= data_in;
        end
    end

    assign data_out = shift_reg;
endmodule
