`timescale 1ns / 1ps



module top_mealy_fsm(


    input clk, reset, inp, 
    output reg out
);

parameter a=3'b000, b=3'b001, c=3'b010, d=3'b011, e=3'b100, f=3'b101, g=3'b110, h=3'b111;
reg[2:0] present_state, next_state;

always @(negedge clk or negedge reset)
begin
    if(!reset) begin
        present_state <= a;
        end
    else begin
        present_state <= next_state;
        end
end

always @(*)
begin
    case (present_state)
        a: begin
            next_state = inp ? b : e;
            out<= inp? 0:0;
        end
        b: begin
            next_state = inp ? c : b;
           out <= inp ? 0 : 0;
        end
        c: begin
            next_state = inp ? d : f;
            out <= inp ? 0 : 0;
        end
        d: begin
            next_state = inp ? f : e;
            out <= inp ? 0 : 1;
        end
        e: begin
            next_state = inp ? e : f;
           out <= inp ? 0 : 0;
        end
        f: begin
            next_state = inp ? g : b;
           out <= inp ? 0 : 0;
        end
        g: begin
            next_state = inp ? d : f;
            out <= inp ? 1 : 0;
        end
        default: begin
            next_state = a;
            out <= 0;
        end
    endcase
end

endmodule