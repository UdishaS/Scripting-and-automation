`timescale 1ns / 1ps
module top_shifter(

    input CLK, 
    input RST, 
    input [2:0] S, 
    input [7:0] IN, 
    input [7:0] parallel_in, 
    output reg [7:0] OUT
);

    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            OUT <= 8'b0; 
        end else begin
            case (S)
                3'b000: OUT <= OUT;                           
                3'b001: OUT <= IN << 1;                          
                3'b010: OUT <= IN >> 1;           
                3'b011: OUT <= parallel_in;                   
                3'b100: OUT <= {IN[6:0], IN[7]};                
                3'b101: OUT <= {IN[0], IN[7:1]}; 
                default: OUT <= OUT;           
            endcase
        end
    end

endmodule
