//////////////////////////////////////////////////////////////////////////////////
// Design: Ripple Counter
// Engineer: kiran
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module ripple_counter(clk, rst, upcount, downcount);

    parameter N = 4;
    
    input  wire clk;
    input  wire rst;
    output wire [N-1:0] upcount;
    output wire [N-1:0] downcount;
    
    wire [N-1:0] s;
    wire [N-1:0] qs;
    
  
    
    d_ff D1 (.d(qs[0]), .clk(clk)  , .rst(rst), .q(s[0]), .qb(qs[0]));
    d_ff D2 (.d(qs[1]), .clk(qs[0]), .rst(rst), .q(s[1]), .qb(qs[1]));
    d_ff D3 (.d(qs[2]), .clk(qs[1]), .rst(rst), .q(s[2]), .qb(qs[2]));
    d_ff D4 (.d(qs[3]), .clk(qs[2]), .rst(rst), .q(s[3]), .qb(qs[3]));
    
//    genvar i;
//    generate
//        for (i=0; i < N; i=i+1)
//            begin : Build_FF
//                d_ff COMP(.d(qs[i]), .clk(s[i]) , .rst(rst), .q(s[i+1]), .qb(qs[i]));
//            end
//        endgenerate
        
    assign upcount   = s;
    assign downcount = qs;
    
endmodule



//module dff (   input d,
//               input clk,
//               input rstn,
//               output reg q,
//               output qn);
//   always @ (posedge clk or negedge rstn)
//      if (!rstn)
//         q <= 0;
//      else  
//         q <= d;
 
//   assign qn = ~q;
//endmodule
 
//module ripple_counter ( input clk,
//                input rst,
//                output [3:0] out);
//   wire  q0;
//   wire  qn0;
//   wire  q1;
//   wire  qn1;
//   wire  q2;
//   wire  qn2;
//   wire  q3;
//   wire  qn3;
 
//   dff   dff0 ( .d (qn0), 
//                .clk (clk),
//                .rstn (rstn),
//                .q (q0),
//                .qn (qn0));
 
//   dff   dff1 ( .d (qn1), 
//                .clk (q0),
//                .rstn (rstn),
//                .q (q1),
//                .qn (qn1));
 
//   dff   dff2 ( .d (qn2), 
//                .clk (q1),
//                .rstn (rstn),
//                .q (q2),
//                .qn (qn2));
 
//   dff   dff3 ( .d (qn3), 
//                .clk (q2),
//                .rstn (rstn),
//                .q (q3),
//                .qn (qn3));
 
//   assign out = {qn3, qn2, qn1, qn0};
 
//endmodule