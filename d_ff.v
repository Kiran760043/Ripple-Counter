//////////////////////////////////////////////////////////////////////////////////
// Design: D Flip Flop
// Engineer: kiran
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps


module d_ff(d, clk, rst, q, qb);

    input  wire d;
    input  wire clk;
    input  wire rst;
    output reg  q;
    output wire qb;
   
   always @(posedge(clk))
    begin
        if(rst == 1'b1) begin
            q <= 1'b0;
        end else begin
            q  <= d;
        end
    end
    
    assign qb = ~q;
    
endmodule
