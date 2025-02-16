`timescale 1ns / 1ps
module top_mealy(
input clk,reset,in,          
output reg out      
);
   

    // State Encoding
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, 
              S3 = 3'b011, S4 = 3'b100;
              
    reg [2:0] state;

always @(posedge clk or posedge reset) begin
if(reset) begin
out <= 1'b0;
state <= S0;
   end
else begin
case(state)
      S0:begin
 if(in) begin
 state <= S1;
 out <= 1'b0;
 end
 else
 out <= 1'b0;
  end
  S1: begin
  if(~in) begin
  state <= S2;
  out <= 1'b0;
  end
  else begin
  out <= 1'b0;
  end
  end
  S2: begin
  if(~in) begin
   state <= S3;
   out <= 1'b0;
  end
   else begin
    state <= S1;
    out <= 1'b0;
    end
   end
  S3: begin
  if(in) begin
  state <= S4;
  out <= 1'b0;
  end
 else begin
 state <= S0;
  out <= 1'b0;
  end
   end
  S4: begin
  if(in) begin
  state <= S0;
   out <= 1'b1;
   end
   else begin
   state <= S2;
   out <= 1'b0;
   end
 end
  endcase
 end
 end

endmodule

