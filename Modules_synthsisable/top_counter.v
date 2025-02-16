`timescale 1ns / 1ps
module top_counter(
output reg [3:0] Q,
input CLK, RESET
    );
  
    always@(posedge CLK or negedge RESET)
    if (!RESET)
    begin
    Q=0;
    end
    else
    begin
    Q=Q+1;
    end
    
endmodule
